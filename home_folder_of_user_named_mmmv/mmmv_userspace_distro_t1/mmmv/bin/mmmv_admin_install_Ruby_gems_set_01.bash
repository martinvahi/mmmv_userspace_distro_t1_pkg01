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
#:::::::::::::::::::: The Design Idology of This Script :::::::::::::::::::
#--------------------------------------------------------------------------
#
# For security reasons each operating system user installs 
# its own set of Ruby gems, python packages, etc. To avoid
# re-downloading everything and to mitigate the effect of network outages,
# the Ruby gems, python packages, NodeJS packages, etc.
# should be installed through a local proxy server that caches
# the downloaded files.
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
        echo "GUID=='3af71210-b577-473a-8286-302270b118e7'"
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
        echo "GUID=='54459e73-cf9e-44af-9e86-302270b118e7'"
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
        echo "GUID=='92fe4a46-5646-4cd0-a586-302270b118e7'"
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
    echo "GUID=='44877aba-3439-4161-8386-302270b118e7'"
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
        echo "GUID=='380782f5-768d-443c-b476-302270b118e7'"
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
        echo "GUID=='46827a12-faf7-4468-8176-302270b118e7'"
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
        echo "GUID=='e5cb4355-b19b-4b37-9376-302270b118e7'"
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
        echo "GUID=='584d8452-21ce-4b97-8176-302270b118e7'"
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
        echo "GUID=='1f534fc4-422f-4834-8476-302270b118e7'"
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
            echo "GUID=='ab94c516-dfee-4cb1-a576-302270b118e7'"
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
            echo "GUID=='efc6f816-89b7-4400-9276-302270b118e7'"
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
            echo "GUID=='1375b712-a46f-444d-9276-302270b118e7'"
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
        echo "GUID=='476276fd-6184-48cb-b176-302270b118e7'"
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
            echo "GUID=='ff90bf2a-4e89-413a-b476-302270b118e7'"
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
            echo "GUID=='2c1bc463-d06f-4da6-9566-302270b118e7'"
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
            echo "GUID=='ef957821-e3e0-4c50-8466-302270b118e7'"
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
        "df06ee57-1169-4289-9186-302270b118e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "ab547918-bf05-4170-8286-302270b118e7"
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
#::::::::::::::::::::::script_user_interface_section:::end:::::::::::::::::
#::::::::::::::::::::::script_data_section:::start:::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "ffi" \
    "ac3e6a59-295e-4dbd-8386-302270b118e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "93ffbc2d-c59c-441f-b186-302270b118e7"

func_angervaks_gem_install "hdf5" \
    "3af65b95-fc52-4e27-9576-302270b118e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "bad4061f-990d-4e38-b276-302270b118e7"

func_angervaks_gem_install "json" \
    "2385ef7a-102a-417e-8d76-302270b118e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "01c6695a-aa26-4c56-8276-302270b118e7"

func_angervaks_gem_install "narray" \
    "8fa5553d-9047-49ac-a376-302270b118e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "net" \
    "be6c7f3e-ea8c-4827-8176-302270b118e7"

func_angervaks_gem_install "net-ssh" \
    "d022a04f-3082-4602-b576-302270b118e7"

func_angervaks_gem_install "mail" \
    "3342c855-3062-482b-b376-302270b118e7"

func_angervaks_gem_install "bitmessage" \
    "63f8112a-60d5-40a5-a376-302270b118e7"

func_angervaks_gem_install "rdf" \
    "27a8464e-9f08-424c-a376-302270b118e7"

func_angervaks_gem_install "test-unit" \
    "72730c33-d3b1-454a-b366-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "b6e2ef4e-1af7-440b-a366-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "e3ddbe30-522e-4b5a-b466-302270b118e7"

func_angervaks_gem_install "uri" \
    "775f934a-2c82-432c-8566-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "85e7e918-5f43-42c5-b366-302270b118e7"

func_angervaks_gem_install "graphviz" \
    "a763d71e-3174-46da-9466-302270b118e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "bdc58a30-02fd-4fb7-8266-302270b118e7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "c14add84-8f23-4e0f-a566-302270b118e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "de95c221-05a7-4354-a366-302270b118e7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the 
#     func_angervaks_gem_install "nmatrix" \
#         "6fc2621a-56b7-4029-9266-302270b118e7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "85385f45-a3b6-4f53-a366-302270b118e7"
#     
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "a3cddb42-9a77-4e06-8166-302270b118e7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "33126ec0-b59e-46d8-a266-302270b118e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "4d66b856-d302-4df8-b266-302270b118e7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "66872245-6aa9-4803-9466-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "301a2d14-34e3-4a82-8766-302270b118e7"

func_angervaks_gem_install "geminabox" \
    "44e9fe5e-672c-418e-8266-302270b118e7"

func_angervaks_gem_install "gemirro" \
    "0c21791e-6673-4353-a266-302270b118e7"

func_angervaks_gem_install "gemstash" \
    "30795b24-b732-4527-8266-302270b118e7"

func_angervaks_gem_install "iruby" \
    "1bfb5b95-9493-4f8f-9156-302270b118e7"

func_angervaks_gem_install "rake"  \
    "3cdc9bb1-4a48-4143-8156-302270b118e7"

func_angervaks_gem_install "rdoc" \
    "855b0436-be91-45dc-a256-302270b118e7"

func_angervaks_gem_install "rspec" \
    "3c718a28-ff83-4f6d-a356-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "f04a2b13-24ca-4c07-b456-302270b118e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "awesome_print" \
    "8f110d54-7763-47a6-b456-302270b118e7"

func_angervaks_gem_install "cztop" \
    "a583195c-fd9a-4a20-a556-302270b118e7"

func_angervaks_gem_install "gnuplot" \
    "eba2b913-f694-45ff-b156-302270b118e7"

func_angervaks_gem_install "nyaplot" \
    "251bfe48-bba7-41de-8456-302270b118e7"

func_angervaks_gem_install "pry" \
    "4d5dde82-fd71-46e6-b356-302270b118e7"

func_angervaks_gem_install "pry-doc" \
    "038d4546-53d1-4ef5-9356-302270b118e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "64c65d27-50ab-4e95-b556-302270b118e7"


# The rbczmq gem installation script fails to build its extentions on 
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "f6785794-0793-4b5e-9756-302270b118e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "b686562d-1a75-4d3d-a256-302270b118e7"

# Fails to compile/install on 
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "24af382e-c577-40a2-a356-302270b118e7"

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "32dfe13f-6f89-4262-8156-302270b118e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::IDE::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Some related links:
#
#     https://microsoft.github.io/language-server-protocol/
#     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
#     https://solargraph.org/
#     https://github.com/MaskRay/ccls
#

func_angervaks_gem_install "solargraph" \
    "646d5aaa-208f-4ab1-b156-302270b118e7"
    # The solagraph.org is about a Ruby "lanuage server".
    # The idea is that some basic support for a programming
    # language can be added to multiple IDEs at once by
    # having those IDEs communicate with a "language server"
    # by using a standardized "language server protocol". 
    #
    #     https://microsoft.github.io/language-server-protocol/
    #
    # The "language servers" handle the project specific source indexing 
    # and delegate as much as possible to the original compiler/interpreter 
    # of the programming language. List of "language server" implementations:
    #
    #     https://langserver.org/
    #     https://microsoft.github.io/language-server-protocol/implementors/servers/
    #
    # The phrase "language server" is in quotation marks here because
    # a more appropriate name for those software components is project_analysis_server.
    # As of 2020 a Vim plugin that can use the various project analysis servers is
    #
    #     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
    #     https://github.com/autozimu/LanguageClient-neovim/
    #
    # As of 2020 the use of that Vim plugin assumes that the ~/.vimrc 
    # contains code that is similar to the following code:
    #::::::::citation:::start:::::::::::::::::::::::::
    # :"------------------------------------------------------------------------ 
    # :set runtimepath+=~/.vim/k2sitsi_paigaldatud_pluginad/LanguageClient-neovim
    # :
    # :" https://medium.com/usevim/vim-101-set-hidden-f78800142855
    # :set hidden
    # :let g:LanguageClient_serverCommands = {
    #     \ 'ruby': ['/home/ts2/m_local/bin_p/Ruby/paigaldatult/v_x_x_x_kasutuses/gem_home/bin/solargraph', 'stdio'],
    #     \ }
    # :nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    # :nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    # :nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    # 
    # :" Language servers to study later:
    # :"    \ 'python': ['/usr/local/bin/pyls'],
    # :"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    # :"   \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    # :"------------------------------------------------------------------------ 
    #::::::::citation:::end:::::::::::::::::::::::::::

#--------------------------------------------------------------------------
#::::::::::::::::::::::database::engine::related::gems:::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "couchdb" \
    "173df735-5578-492a-8556-302270b118e7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "89301c28-73fb-4852-8356-302270b118e7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "03735bc2-d018-48d5-b156-302270b118e7"

func_angervaks_gem_install "mongodb" \
    "e88abd85-c107-4db9-8b56-302270b118e7"

func_angervaks_gem_install "neo4j" \
    "76562808-4ff7-4643-ad56-302270b118e7"

func_angervaks_gem_install "postgresql" \
    "4af83811-c76d-46c6-b446-302270b118e7"

func_angervaks_gem_install "rethinkdb" \
    "1449a715-843b-4832-9346-302270b118e7"

func_angervaks_gem_install "sqlite3 --version 1.4.1" \
    "32fbab17-e49b-4045-9146-302270b118e7"

func_angervaks_gem_install "sqlite3" \
    "426820e4-fe41-4bd4-9146-302270b118e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="e008eb40-e291-4972-8246-302270b118e7"
#==========================================================================
