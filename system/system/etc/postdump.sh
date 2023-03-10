#!/system/bin/sh

# Copyright (C) 2016 Sony Mobile Communications Inc.

src_dir=/data/crashdump
target_dir=/data/media/0/CrashDump
partial_tlcore_dir=/data/crashdata
postdumper=/system/bin/post_dumper

variant=`getprop ro.build.type`

get_latest_index()
{
    idx=0
    while [ -e $partial_tlcore_dir/$@$idx ]
    do
        idx=$((idx + 1))
    done

    if [ $idx -ge 10 ]; then
        latest_file=$(ls -t $partial_tlcore_dir | grep -E $@ | head -1)
        idx=${latest_file##*\_}
        idx=$(((idx + 1) % 10))
    fi

    return $idx
}

move_tlcore_system_to_crashdata()
{
    for s_file in $(ls $@) ; do
        idx=0
        #check any partial tlcore of system dump is present
        if [ "$(ls ${partial_tlcore_dir} | grep -E "tlcore_system_0")" ]; then
            get_latest_index "tlcore_system_0"
            idx=$?
        fi
        echo "Moving $@/$s_file to $partial_tlcore_dir/tlcore_system_0$idx\n"
        cp -a $@/$s_file $partial_tlcore_dir/tlcore_system_0$idx
        if [ $? -eq 0 ] ; then
            rm -r $@/$s_file
        fi
    done
}

move_to_crashdump()
{
    arg=$@
    is_exists=0
    idx=0
    # Rename/move system crash <dumpdir> as <dumpdir_x> incase
    # if already exists in <target_dir> path
    # i.e. <dumpdir_x> can be <dumpdir_1>, <dumpdir_2>..and goes on.
    arg_dir=${arg%_*}
    dir=$arg_dir
    if [ "$(echo $dir | grep -E "crash-")" ]; then
        while [ -e $target_dir/$dir ] && [ ! -e $src_dir/copy.fail ]
        do
            idx=$((idx + 1))
            dir=${arg_dir}_$idx
            is_exists=1
        done
        touch $src_dir/copy.fail
        #Update the dumpstate file if dump is interrupted
        if [ -e $src_dir/$@/dumpstate ]; then
            mv $src_dir/$@/dumpstate $src_dir/$@/dumpstate.fail
        fi
    fi
    echo "Moving $src_dir/$@ to $target_dir/$dir"
    cp -a $src_dir/$@ $target_dir/$dir
    if [ $? -eq 0 ] ; then
        rm -r $src_dir/$@
        rm -r $src_dir/copy.fail
    fi
    if [ $is_exists = 1 ]; then
        echo $target_dir/$dir > $src_dir/lastdump
    fi
}

if [ "$variant" = "userdebug" ] ; then
    if [ -e "${target_dir}" ] && [ -e "${partial_tlcore_dir}" ]; then
        # /data/media/0/CrashDump && /data/crashdata
        if [  -e "${src_dir}" ]; then
              for i in $(ls ${src_dir} | grep -E 'crash|lastdump'); do
                   if [ "$i" = "crashdata" ]; then
                       move_tlcore_system_to_crashdata "$src_dir/$i"
                   else
                       move_to_crashdump $i
                   fi
              done
        fi
        $postdumper
        for i in $(ls ${src_dir} | grep -E 'anr|dropbox|log|tombstones'); do
            echo "Deleting dump files in $src_dir/$i/\n"
            rm -r $src_dir/$i/*
        done
    fi
fi
