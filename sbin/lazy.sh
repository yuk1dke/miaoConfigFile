#!/bin/sh

workspace=Workspace
tempFile="$HOME/sbin/subCommands.txt"
timeout=3

# workspace begin
Workspace1()
{
    ##test clean
    #Step.1
    #make
targets=`cat Makefile | grep "^TARGETS=" | sed "s/[^=]*= //"`
    echo "begin step $[++stepNum]"
    FuncSetRemoteInfo -i Aliyun
    FuncSFTP -method put -localpath . -remotepath /home/userName/bin -filelist 1.txt 2.txt 3.txt
    echo "end step $[stepNum]"

    #Step.2
    #sftp

    #Step.3
    #run
}
# workspace end


# env
# Aliyun
Aliyun_ip=xxx.xxx.xxx.xxx
Aliyun_user=userName
Aliyun_password=passWord
Aliyun_port=22

# analyze workspace's line
FuncAnalyze()
{
    lineBeg=`grep -n "# workspace\ begin" $0 | awk -F: '{print $1}'`
    lineEnd=`grep -n "# workspace\ end" $0 | awk -F: '{print $1}'`
}

FuncSetRemoteInfo()
{
    while [ $# -gt 0 ]
    do
        case $1 in
            -i)
                shift
                where=$1
                ;;
        esac
        shift
    done
    eval ip=$(echo \$$where"_ip")
    eval user=$(echo \$$where"_user")
    eval password=$(echo \$$where"_password")
    eval port=$(echo \$$where"_port")
}

FuncUsage()
{
    echo "Usage:"
    sed -n "$(($lineBeg + 1)),$(($lineEnd))p" $0 \
    | grep -E "Workspace|##|#@" \
    | sed "s/Workspace\([^(]*\)()$/%%% \1/" \
    | sed "s/^\s*//" \
    | awk '{
        if($1 == "%%%"){
            printf "\t%s ", $0;
            getline;
            print;
        }else{
            print
        }
    }' \
    | sed "s/%%%//" \
    | sed "s/##//" \
    | sed "s/#/\t\t/" \
    | sed "s/@/\t/g"
}

# func
FuncRemoteCmd()
{
    cmd=
    remotePath=

    while [ $# -gt 0 ]
    do
        case $1 in
            -c | -cmd)
                shift
                cmd=$@
                ;;
            -rp | -remotePath)
                remotePath=$2
                shift
                ;;
        esac
        shift
    done

    expect -c "
        spawn ssh -p $port $user@$ip
        set timeout $timeout
        expect \"*passwd\" { send \"$password\r\" }
        expect \"*home\" { send \"cd $remotePath\r\" }
        expect \"$remotePath\" { send \"$cmd\r\" }
        expect \"$remotePath\" { send \"exit\r\" }
    "

    ret=$?
    if [ "$ret" != "0" ]
    then
        echo "$LINENO execute remote cmd error, ret: [$ret]"
    else
        echo "$LINENO execute remote cmd success"
    fi
}


FuncSFTP()
{
    cmd=
    method=
    localPath=
    remotePath=
    fileNum=
    fileList=
    recursion=0

    while [ $# -gt 0 ]
    do
        case $1 in
            -c | -cmd)
                shift
                cmd=$@
                ;;
            -m | -method)
                shift
                method=$1
                echo $method
                ;;
            -lp | -localpath)
                shift
                localPath=$1
                echo $localPath
                ;;
            -rp | -remotepath)
                shift
                remotePath=$1
                echo $remotePath
                ;;
            -d | -dir)
                shift
                recursion=1
                dirName=$1
                ;;
            -fl | -filelist)
                shift
                fileNum=$#
                fileList=$*
                ;;
        esac
        shift
    done

    rm -f $tempFile
    cd $localPath

    echo "set timeout $timeout" >> $tempFile
    echo "spawn sftp -P $port $user@$ip\r" >> $tempFile

    if [ "$ip" != "$XXX_ip" -o "$user" != "$XXX_user" ]
    then
        echo "expect \"$user@$ip's password:\" { send \"$password\r\" }" >> $tempFile
    fi

    echo "expect \"sftp>\" { send \"cd $remotePath\r\" }" >> $tempFile

    if [ $recursion == 0 ]
    then
        for fileName in $fileList
        do
            echo "expect \"sftp>\" { send \"$method $fileName\r\" }" >> $tempFile
        done
        echo "expect \"sftp>\" { send \"quit\r\" }" >> $tempFile
    else
        echo "expect \"sftp>\" { send \"$method -r $dirName\r\" }" >> $tempFile
    fi

    echo "expect eof" >> $tempFile

    expect -f $tempFile
    #rm -f $tempFile
}

FuncMain(){
    FuncAnalyze
    if [ 0 == $# ]
    then
        FuncUsage
        exit 0
    fi

    candidate=`sed -n "$(($lineBeg + 1)), $(($lineEnd - 1))p" $0 | grep "Workspace" | sed 's/Workspace\([^(]*\)()$/\1/'`
    canDo=0
    for i in $candidate
    do
        if [ x"$i" == x"$1" ]
        then
            stepNum=0
            targetWorkspace=$workspace$1
            canDo=1

            if [ $# -gt 0 ]
            then
                shift
                args=$@
            fi
        fi
    done

    if [ $canDo == 1 ]
    then
        $targetWorkspace
    else
        FuncUsage
    fi
}

# main
FuncMain $*
