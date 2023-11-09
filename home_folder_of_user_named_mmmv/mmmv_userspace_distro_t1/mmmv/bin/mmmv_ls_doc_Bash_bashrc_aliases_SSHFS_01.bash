#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
# S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------

func_display_aliase_template(){
    echo "#-----------------------------------------"
    echo "alias foo_sshfs_mount_LAN_computer_03_awesomeuser22=\"nice -n2 sshfs -oport=22 awesomeuser22@192.168.57.3:/home/awesomeuser22/  \$HOME/sshfs_mountpoints/LAN_computer_03_awesomeuser22 -o follow_symlinks,IdentityFile=\$HOME/.ssh/2020_07_01_LAN_computer_03_awesomeuser22_cryptokey_02.txt\""
    echo "export MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER22=\"fusermount -u \$HOME/sshfs_mountpoints/LAN_computer_03_awesomeuser22 \""
    echo "alias foo_sshfs_unmount_LAN_computer_03_awesomeuser22=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER22\""
    echo "#-----------------------------------------"
    echo "alias foo_sshfs_mount_LAN_computer_03_awesomeuser1=\"nice -n2 sshfs -oport=22 awesomeuser1@192.168.57.3:/home/awesomeuser1/  \$HOME/sshfs_mountpoints/LAN_computer_03_awesomeuser1 -o follow_symlinks,IdentityFile=\$HOME/.ssh/2020_07_01_LAN_computer_03_awesomeuser1_cryptokey_75.txt\""
    echo "export MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER1=\"fusermount -u \$HOME/sshfs_mountpoints/LAN_computer_03_awesomeuser1 \""
    echo "alias foo_sshfs_unmount_LAN_computer_03_awesomeuser1=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER1\""
    echo "#-----------------------------------------"
    echo "export MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_WAN=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_SOFTF1_COM ; \$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_MAIREDESIGN_COM ; \$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_MASINKUDUMINE_EE \""
    echo ""
    echo "export MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER22 ; \$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN_COMPUTER_03_AWESOMEUSER1 \""
    echo ""
    echo "alias foo_sshfs_unmount_all_WAN=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_WAN\""
    echo "alias foo_sshfs_unmount_all_LAN=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN\""
    echo ""
    echo "alias foo_sshfs_unmount_all=\"\$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_WAN ; \$MMMV_BASHRC_CONST_ALIAS_MMMV_SSHFS_UNMOUNT_LAN \""
    echo "#-----------------------------------------"
} # func_display_aliase_template


echo ""
echo -e "Sample code fragment for copying into the\e[33m \$HOME/.bashrc\e[39m "
echo "or into some of its subpart: "
echo -e "\e[36m"
    func_display_aliase_template
echo -e "\e[39m"

#--------------------------------------------------------------------------
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="4fd7b624-5e6a-4cc8-b026-1330b090b7e7"
#==========================================================================
