#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#---------------------the--start--of--boilerplate--------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"

if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR/../../../../; pwd`"
fi
#--------------------------------------------------------------------------
S_FP_BASH_BOILERPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_bash_boilerplate/2022_02_09_mmmv_bash_boilerplate_t2/mmmv_bash_boilerplate_t2.bash"
if [ -e "$S_FP_BASH_BOILERPLATE" ]; then
    if [ -d "$S_FP_BASH_BOILERPLATE" ]; then
        echo ""
        echo "A folder with the path of "
        echo ""
        echo "    S_FP_BASH_BOILERPLATE==$S_FP_BASH_BOILERPLATE"
        echo ""
        echo "exists, but a file is expected."
        echo "GUID=='68bbcbc5-63ae-4a18-9f11-6201718026e7'"
        echo ""
    else
        source "$S_FP_BASH_BOILERPLATE"
    fi
else
    echo ""
    echo "~/.bashrc sub-part with the path of "
    echo ""
    echo "    S_FP_BASH_BOILERPLATE==$S_FP_BASH_BOILERPLATE"
    echo ""
    echo "could not be found."
    echo "GUID=='92222727-3c85-484b-ac21-6201718026e7'"
    echo ""
fi
#--------------------------------------------------------------------------
func_mmmv_exit_if_not_on_path_t2 "cat"
func_mmmv_exit_if_not_on_path_t2 "sed"
func_mmmv_exit_if_not_on_path_t2 "grep"
func_mmmv_exit_if_not_on_path_t2 "gawk"
func_mmmv_exit_if_not_on_path_t2 "ifconfig"
func_mmmv_exit_if_not_on_path_t2 "tee"
#--------------------------------------------------------------------------
SB_OPTIONAL_BAN_SYMLINKS="t" # domain: {"t", "f", ""} default: "f"
#--------
MMMV_USERSPACE_DISTRO_T1_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_assert_folder_exists_t1 "$MMMV_USERSPACE_DISTRO_T1_TERMUX" \
    "f2621727-3c85-484b-ac21-6201718026e7" "$SB_OPTIONAL_BAN_SYMLINKS"
#--------
S_FP_SSHD_CONFIG_FOR_TERMUX_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TERMUX/lib/templates/sshd_config_for_Termux_template"
func_mmmv_assert_file_exists_t1 "$S_FP_SSHD_CONFIG_FOR_TERMUX_TEMPLATE" \
    "e1777777-3cac-484b-ac21-6201718026e7" "$SB_OPTIONAL_BAN_SYMLINKS"
#--------
S_FP_SSHD_CONFIG_FOR_TERMUX="$MMMV_USERSPACE_DISTRO_T1_TERMUX/etc/sshd_config_for_Termux"
#func_mmmv_assert_file_exists_t1 "$S_FP_SSHD_CONFIG_FOR_TERMUX" \
#    "e1777777-3cac-484b-ac21-6201718026e7" "$SB_OPTIONAL_BAN_SYMLINKS"
SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="t" # domain: {"t","f",""}
func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_FP_SSHD_CONFIG_FOR_TERMUX" \
    "d2888777-9c2c-484b-ac21-6201718026e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#---------------------the--end----of--boilerplate--------------------------
echo -e "\e[94m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: \e[39m"
echo "The template file resides at:"
echo -e "\e[94m    $S_FP_SSHD_CONFIG_FOR_TERMUX_TEMPLATE  \e[39m"
echo "The generated config file:"
echo "-------citation---start--------"
#--------------------------------------------------------------------------
# The username and the IP-address of different Termux installations differ. 
SB_TEST_ONLY="f"
if [ "$1" == "test" ]; then
    SB_TEST_ONLY="t"
fi
if [ "$1" == "t" ]; then
    SB_TEST_ONLY="t"
fi
#--------
S_IPADDRESS_LAN_PREFIX="99.99"
if [ "$SB_TEST_ONLY" == "t" ]; then
    #--------
    cat "$S_FP_SSHD_CONFIG_FOR_TERMUX_TEMPLATE" | sed -e "s/u0_a161/`whoami`/g" | sed -e "s/192[.]168/$S_IPADDRESS_LAN_PREFIX/g"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "b3198772-9c2c-484b-ac21-6201718026e7"
    #--------
else
    #--------
    S_IPADDRESS_LAN_PREFIX="`ifconfig | grep ' inet ' | grep -v 127 | gawk '{print $2}' | sed -e 's/[.][[:digit:]]\+[.][[:digit:]]\+$//g'`"
    cat "$S_FP_SSHD_CONFIG_FOR_TERMUX_TEMPLATE" | sed -e "s/u0_a161/`whoami`/g" | sed -e "s/192[.]168/$S_IPADDRESS_LAN_PREFIX/g" | tee "$S_FP_SSHD_CONFIG_FOR_TERMUX"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "a7298712-9c2c-484b-ac21-6201718026e7"
    func_mmmv_wait_and_sync_t1
    SB_OPTIONAL_BAN_SYMLINKS="f"
    func_mmmv_assert_file_exists_t1 "$S_FP_SSHD_CONFIG_FOR_TERMUX" \
        "62733477-3eac-484b-ac21-6201718026e7" "$SB_OPTIONAL_BAN_SYMLINKS"
    #--------
fi
#--------------------------------------------------------------------------
echo "-------citation---end----------"
echo -e "\e[94m:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: \e[39m"
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="61c84e4c-281a-11ed-b97f-77bfe6b16882"
#==========================================================================
