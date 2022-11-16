#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# This script consists of 3 parts, which can be 
# navigated by searching for the following strings:
#
#     script_boilerplate_section
#     script_user_interface_section
#     script_data_section
#
# The boilerplate might be seen as the library of Bash functions that
# the rest of this script depends on. The user interface part handles
# command-line arguments, of which there are currently none.  
#
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::start::::::::::::::::::
#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync to finish
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo "The code of this script is flawed."
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='d311ab38-2b97-4389-b313-939110d0b6e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"     # possible values: "t", "f"
    if [ -h "$S_FP_ORIG" ]; then # Returns "false" for paths that 
                                # do not refer to anything.
        SB_IS_SYMLINK="t"
    fi
    #--------
    if [ ! -e "$S_FP_ORIG" ]; then
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "The "
        else
            echo "The file or folder "
        fi
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "is a broken symlink. It is expected to be a folder that "
        else
            echo "does not exist. It is expected to be a folder that "
        fi
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='2618f63b-c4e4-4f51-8313-939110d0b6e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    if [ ! -d "$S_FP_ORIG" ]; then
        echo "The "
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        echo "is not a folder. It is expected to be a folder that "
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='2f6dce04-1fe1-4eaf-aa13-939110d0b6e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    echo ""
    echo "The code of this script is flawed."
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then 
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='113b5663-3f33-4ff2-8403-939110d0b6e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo "The code of this script is flawed. "
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='70714418-d389-4bd0-8103-939110d0b6e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo "Something went wrong."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='fd88645b-d227-4db0-a203-939110d0b6e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='47a3b4e2-0d8d-4014-8503-939110d0b6e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #--------
    # If the "$?" were evaluated in this function, 
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='05938b36-bc2f-4be4-9103-939110d0b6e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='84d1f72a-c309-45e0-8503-939110d0b6e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a file or "
            echo "a symlinkt to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='e6b5ce22-6ebf-41cb-9103-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The file "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='b8904310-6101-4075-b203-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to the folder "
            else
                echo "The folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "exists, but a file or a symlink to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='2997787c-b92e-45ef-9403-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='17c143b1-3225-4228-b503-939110d0b6e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a folder "
            echo "or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='88b2af4d-3a25-4c24-8103-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The folder "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='aca4e11f-64b0-4a1b-8503-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ ! -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "exists, but a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='469c5f3f-6363-4952-a103-939110d0b6e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_angervaks_gem_install(){
    local S_GEM_PARAMETERS="$1" # the part after the "gem install "
    local S_GUID_CANDIDATE="$2"
    #--------
    nice -n 15 gem install $S_GEM_PARAMETERS
    func_mmmv_assert_error_code_zero_t1 "$?" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #--------
} # func_angervaks_gem_install

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::end::::::::::::::::::::
#::::::::::::::::::::::script_user_interface_section:::start:::::::::::::::
#--------------------------------------------------------------------------
# Some basic checks:
func_mmmv_exit_if_not_on_path_t2 "gem"
func_mmmv_exit_if_not_on_path_t2 "ruby"

if [ "$GEM_HOME" == "" ]; then
    func_mmmv_exc_exit_with_an_error_t2 \
        "675e5e41-b290-488a-a513-939110d0b6e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "54cf0032-36f8-4682-b213-939110d0b6e7"
fi

#--------------------------------------------------------------------------

func_angervaks_print_help_msg_t1() {
    echo ""
    echo "Command line format: "
    echo ""
    echo "<the name of this script>  ARGLIST "
    echo ""
    echo "     ARGLIST :== HELP | SET_OF_GEMS "
    echo ""
    echo "        HELP :== --help | help | -h | -? "
    echo " SET_OF_GEMS :== "
    echo ""
    echo "If this API is used correctly and there are no other "
    echo ""
    echo ""
} # func_angervaks_print_help_msg_t1

#func_angervaks_print_help_msg_t1

#--------------------------------------------------------------------------
#echo "Buoy 'ade41e5c-9fac-4644-a103-939110d0b6e7'"
#exit 1
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_user_interface_section:::end:::::::::::::::::
#::::::::::::::::::::::script_data_section:::start:::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "ffi" \
    "379dfb7f-e89d-4dbc-b503-939110d0b6e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "25434781-eab6-4aa9-9203-939110d0b6e7"

func_angervaks_gem_install "hdf5" \
    "4738bd3b-d5ef-4132-9503-939110d0b6e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "345a6911-1c22-42fc-8503-939110d0b6e7"

func_angervaks_gem_install "json" \
    "e9e8d51f-82b9-42da-a303-939110d0b6e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "14f1e3f8-c992-4d27-9403-939110d0b6e7"

func_angervaks_gem_install "narray" \
    "6fbf5d3f-4d32-4fd1-9403-939110d0b6e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "sqlite3 --version 1.4.1" \
    "ead51c19-d9a9-4d94-9103-939110d0b6e7"

func_angervaks_gem_install "sqlite3" \
    "50677535-220c-4969-9503-939110d0b6e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "bundler" \
    "83359c29-4940-4ae7-9303-939110d0b6e7"

func_angervaks_gem_install "rake"  \
    "81ca8d02-b2c9-4336-8303-939110d0b6e7"

func_angervaks_gem_install "rdoc" \
    "15dd2bed-d3ae-432f-b403-939110d0b6e7"

func_angervaks_gem_install "rspec" \
    "78666756-599b-4c28-9503-939110d0b6e7"

func_angervaks_gem_install "net" \
    "4b084483-003d-4037-b403-939110d0b6e7"

func_angervaks_gem_install "dbf" \
    "38dfd21f-8324-4d43-b503-939110d0b6e7"

func_angervaks_gem_install "net-ssh" \
    "4b7e5e57-1d38-44f8-9503-939110d0b6e7"

func_angervaks_gem_install "mail" \
    "7b379215-7d04-4f0d-9403-939110d0b6e7"

func_angervaks_gem_install "bitmessage" \
    "e2012510-8c8b-4db2-8303-939110d0b6e7"

func_angervaks_gem_install "rdf" \
    "31873b08-6b7b-4994-8403-939110d0b6e7"

func_angervaks_gem_install "graphviz" \
    "8977ac2a-d85f-4f1f-a303-939110d0b6e7"

func_angervaks_gem_install "gnuplot" \
    "f8264633-39cf-489a-b103-939110d0b6e7"

func_angervaks_gem_install "iruby" \
    "8c93a34f-245f-4972-b403-939110d0b6e7"

func_angervaks_gem_install "test-unit" \
    "f6363953-acd8-4d21-b403-939110d0b6e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "pry" \
    "39ada7a5-46a4-4c20-9803-939110d0b6e7"

func_angervaks_gem_install "pry-doc" \
    "59034675-8ea1-4fc8-8c03-939110d0b6e7"

func_angervaks_gem_install "awesome_print" \
    "2849aab1-2179-4a54-b503-939110d0b6e7"

func_angervaks_gem_install "rubyvis" \
    "71c29da9-0769-42d4-bc03-939110d0b6e7"

func_angervaks_gem_install "nyaplot" \
    "23eace42-b66c-435f-a103-939110d0b6e7"

func_angervaks_gem_install "cztop" \
    "7fa20818-ad97-4408-9303-939110d0b6e7"

# The rbczmq gem installation script fails to build its extentions on 
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "977c31c4-2e4d-4525-8cf2-939110d0b6e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "e127784c-9e24-4e89-83f2-939110d0b6e7"

# Fails to compile/install on 
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "7cb46f17-7b7e-4075-95f2-939110d0b6e7"

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "b8364833-a8d5-4df0-b2f2-939110d0b6e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::::IDE:::::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Some related links:
#
#     https://microsoft.github.io/language-server-protocol/
#     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
#     https://solargraph.org/
#     https://github.com/MaskRay/ccls
#

func_angervaks_gem_install "solargraph" \
    "bea1282a-53ca-4b50-91f2-939110d0b6e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::: database engine interfaces ::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "couchdb" \
    "f135a24d-82df-485f-94f2-939110d0b6e7"

func_angervaks_gem_install "mysql2" \
    "b3016fc1-03ed-48d5-93f2-939110d0b6e7"

func_angervaks_gem_install "mongodb" \
    "47a3a52d-1c8e-47de-92f2-939110d0b6e7"

func_angervaks_gem_install "neo4j" \
    "ba2b211e-54f6-42d0-b4f2-939110d0b6e7"

func_angervaks_gem_install "postgresql" \
    "5f15f111-069e-4aeb-85f2-939110d0b6e7"

func_angervaks_gem_install "rethinkdb" \
    "23422b72-7519-41c0-b5f2-939110d0b6e7"

#--------------------------------------------------------------------------
# S_TMP_LIST_OF_GEMS_00=" rake rdoc sqlite3 rspec \
#     net dbf json hdf5 net-ssh rdf mail \
#     graphviz gnuplot bundler test-unit "
# 
# S_TMP_LIST_OF_GEMS_01=" rethinkdb couchdb "
# 
# S_TMP_LIST_OF_GEMS_02=" micro_kanren "
#     # miniKanren is a form of logic programming.
#     # http://minikanren.org/
# 
# S_TMP_LIST_OF_GEMS_03=" bitmessage "
# 
# S_TMP_LIST_OF_GEMS_04=" solargraph "
#     # The solagraph.org is about a Ruby "lanuage server".
#     # The idea is that some basic support for a programming
#     # language can be added to multiple IDEs at once by
#     # having those IDEs communicate with a "language server"
#     # by using a standardized "language server protocol". 
#     #
#     #     https://microsoft.github.io/language-server-protocol/
#     #
#     # The "language servers" handle the project specific source indexing 
#     # and delegate as much as possible to the original compiler/interpreter 
#     # of the programming language. List of "language server" implementations:
#     #
#     #     https://langserver.org/
#     #     https://microsoft.github.io/language-server-protocol/implementors/servers/
#     #
#     # The phrase "language server" is in quotation marks here because
#     # a more appropriate name for those software components is project_analysis_server.
#     # As of 2020 a Vim plugin that can use the various project analysis servers is
#     #
#     #     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
#     #     https://github.com/autozimu/LanguageClient-neovim/
#     #
#     # As of 2020 the use of that Vim plugin assumes that the ~/.vimrc 
#     # contains code that is similar to the following code:
#     #::::::::citation:::start:::::::::::::::::::::::::
#     # :"------------------------------------------------------------------------ 
#     # :set runtimepath+=~/.vim/k2sitsi_paigaldatud_pluginad/LanguageClient-neovim
#     # :
#     # :" https://medium.com/usevim/vim-101-set-hidden-f78800142855
#     # :set hidden
#     # :let g:LanguageClient_serverCommands = {
#     #     \ 'ruby': ['/home/ts2/m_local/bin_p/Ruby/paigaldatult/v_x_x_x_kasutuses/gem_home/bin/solargraph', 'stdio'],
#     #     \ }
#     # :nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
#     # :nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
#     # :nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
#     # 
#     # :" Language servers to study later:
#     # :"    \ 'python': ['/usr/local/bin/pyls'],
#     # :"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
#     # :"   \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
#     # :"------------------------------------------------------------------------ 
#     #::::::::citation:::end:::::::::::::::::::::::::::
#     #
#    
# S_TMP_0="nice -n 5 gem install "
# alias mmmv_gem_install_set_00_basic_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
# alias mmmv_gem_install_set_01_additional_database_engines="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
# alias mmmv_gem_install_set_02_scientific_computing="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
# alias mmmv_gem_install_set_03_communication_applications="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
# alias mmmv_gem_install_set_04_development_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
# alias mmmv_gem_install_all_mmmv_gem_sets="$S_TMP_0 \
#     $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 \
#     $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 \
#     $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 \
#     $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 \
#     $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 "
# 
# 
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="4a4c5750-d963-47f4-81f2-939110d0b6e7"
#==========================================================================
