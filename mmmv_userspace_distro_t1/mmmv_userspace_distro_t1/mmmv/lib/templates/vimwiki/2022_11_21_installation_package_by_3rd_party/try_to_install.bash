#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/bonnet/2022_10_31_mmmv_bash_boilerplate_t2/mmmv_bash_boilerplate_t2.bash"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        echo ""
        echo "A folder with the path of "
        echo ""
        echo "    S_FP_0==$S_FP_0"
        echo ""
        echo "exists, but a file is expected."
        echo "GUID=='bb430701-5ec6-4c02-9b54-b3b39051b6e7'"
        echo ""
    else
        source "$S_FP_0"
    fi
else
    echo ""
    echo "A file with the path of "
    echo ""
    echo "    S_FP_0==$S_FP_0"
    echo ""
    echo "could not be found."
    echo "GUID=='29beab82-3ece-400a-b654-b3b39051b6e7'"
    echo ""
fi
#--------------------------------------------------------------------------
S_FP_VIMWIKI_TEMPLATE="$S_FP_DIR/bonnet/2022_11_21_cloned_vimwiki/vimwiki"
S_FP_VIMWIKI_INSTALLATION_PARENT="$HOME/.vim/pack/plugins/start/"
S_FP_VIMWIKI_INSTALLATION="$S_FP_VIMWIKI_INSTALLATION_PARENT/vimwiki"
#--------------------------------------------------------------------------
SB_OPTIONAL_BAN_SYMLINKS="f"
func_mmmv_assert_folder_exists_t1 "$S_FP_VIMWIKI_TEMPLATE" \
    "e345dbb3-c109-4073-9124-b3b39051b6e7" \
    "$SB_OPTIONAL_BAN_SYMLINKS"
#--------------------------------------------------------------------------
mkdir -p "$S_FP_VIMWIKI_INSTALLATION_PARENT"
func_mmmv_assert_error_code_zero_t1 "$?" \
    "5df421e4-46b5-432e-8614-b3b39051b6e7"
func_mmmv_assert_folder_exists_t1 "$S_FP_VIMWIKI_INSTALLATION_PARENT" \
    "519505a5-3c2c-4bae-be14-b3b39051b6e7" \
    "$SB_OPTIONAL_BAN_SYMLINKS"
chmod -f -R 0700 "$S_FP_VIMWIKI_INSTALLATION_PARENT"
func_mmmv_assert_error_code_zero_t1 "$?" \
    "5496afc3-8b7d-4169-b014-b3b39051b6e7"
#--------------------
#git clone https://github.com/vimwiki/vimwiki.git $HOME/.vim/pack/plugins/start/vimwiki
cp -f -R $S_FP_VIMWIKI_TEMPLATE $S_FP_VIMWIKI_INSTALLATION_PARENT/
func_mmmv_assert_error_code_zero_t1 "$?" \
    "3baec4a1-b978-4ca8-af24-b3b39051b6e7"
vim -c 'helptags ~/.vim/pack/plugins/start/vimwiki/doc' -c quit
func_mmmv_assert_error_code_zero_t1 "$?" \
    "223f94c5-df56-48af-8634-b3b39051b6e7"
#--------------------------------------------------------------------------
echo ""
echo "Supposedly the ~/.vimrc must contain "
echo ""
echo -e "\e[33m    :set noncompatible\e[39m"
echo -e "\e[33m    :filetype plugin on\e[39m"
echo -e "\e[33m    :syntax on\e[39m"
echo ""
echo "The way to test, whether the vimwiki "
echo "has been at least somewhat successfully"
echo "installed, is: \":help vimwiki\""
echo "Supposedly 2022_11_21-newest version of "
echo "the vimwiki has been tested on Vim version 7.3."
echo "Some relevant home pages:"
echo ""
echo "    https://github.com/vimwiki"
echo ""
echo "As of 2022_11_21 the \"wiki -> HTML\" conversion tool supports "
echo "only the vimwiki's own wiki format. "
echo "The default \"<Leader\"> key in Vim is \"\\\", but it can be"
echo "overridden by 'let mapleader=\",\"' ."
echo ""
echo "GUID=='fc02fea4-fd1c-488d-a034-b3b39051b6e7'"
echo ""
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="81700cf0-3ce0-45aa-a084-b3b39051b6e7"
#==========================================================================
