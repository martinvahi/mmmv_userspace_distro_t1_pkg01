#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# It has been tested to work on 2023_05_xx Windows10 version of the
# Windows Subsystem for Linux (WSL), on an onld openSUSE Linux.
# If xclip is installed on BSD, then it MIGHT also work on BSD, but
# the current version HAS NOT been tested on BSD.
#
# List of dependencies described partly in EBNF style: 
#     mmmv_polish_ABC_2_A_C_B_exec_t1, bc, grep, cat, uuid, uname, wait,
#     ruby, bash, par/par_text_formatter, (sed|gsed), nice, echo, printf, rm, tr, wc, 
#     ( xclip | ( clip.exe,powershell.exe ) )
# 
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../; pwd`"
fi
#--------------------------------------------------------------------------

if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    #echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE\e[39m ."
    echo "GUID=='13f86441-88e5-4b67-9157-6082207067e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------

# Call example: mmmv_cat_par_sed_t1 ./x.txt
if [ "$SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_cat_par_sed_30_t1="S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; mmmv_polish_ABC_2_A_C_B_exec_t1 'cat ' \" | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' | par_text_formatter 30 | \$S_CMD_GNU_SED -e  's/^/    /g'\" " 
                    alias mmmv_cat_par_sed_40_t1="S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; mmmv_polish_ABC_2_A_C_B_exec_t1 'cat ' \" | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' | par_text_formatter 40 | \$S_CMD_GNU_SED -e  's/^/    /g'\" " 
                    alias mmmv_cat_par_sed_50_t1="S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; mmmv_polish_ABC_2_A_C_B_exec_t1 'cat ' \" | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' | par_text_formatter 50 | \$S_CMD_GNU_SED -e  's/^/    /g'\" "
                    alias mmmv_cat_par_sed_60_t1="S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; mmmv_polish_ABC_2_A_C_B_exec_t1 'cat ' \" | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' | par_text_formatter 60 | \$S_CMD_GNU_SED -e  's/^/    /g'\" "
                    alias mmmv_cat_par_sed_70_t1="S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; mmmv_polish_ABC_2_A_C_B_exec_t1 'cat ' \" | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' | par_text_formatter 70 | \$S_CMD_GNU_SED -e  's/^/    /g'\" " 
                fi
            fi
        fi
    fi
fi


func_mmmv_userspace_distro_t1_declare_clipboard_text_2_citation_aliases_t1(){
# At least some version of the "par" text reformatter
# seems to add one space to the end of some lines
# and with words that are longer than the specified line width, the
# "par" seems to cut them at one character shorter location than the specified
# line with. The very last line also seem to be kept one character
# shorter than the specified line with. This, a bit more hackish,
# version of the clipboard content formatting alias, tries to
# compensate those "par" flaws by manually formatting the 
# citation bounding lines, the 1 line and the last line.
# 
# This "clean copy" of the alias has the structure of 
#
#     alias mmmv_clipboard_text_2_citation_WSL_et_54_t1="
#         <some code> ; wait ;
#         ...
#         <some code> ; wait ;
#         "
#
# and it is meant to be copied to a single line after editing.
# Vim macros are the tool here.
#
# alias mmmv_clipboard_text_2_citation_et_54_t1="
#     S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; 
#     S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ;
#     S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ;
#     S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ;
#     if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ;
#         S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ;
#         S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ;
#     fi ; wait ;
#     S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; 
#     S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; 
#     S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; 
#     nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; 
#     SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ;
#     SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ;
#     for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ;
#         cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ;
#         cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ;
#     done ; wait ;
#     echo \"    ------------tsitaadi----algus---------------------\" >  \$S_FP_TMP_1 ; wait ; 
#     cat \$S_FP_TMP_0 | par_text_formatter 50 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; 
#     echo \"    ------------tsitaadi----lõpp----------------------\" >> \$S_FP_TMP_1 ; wait ;
#     cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; 
#     rm -f \$S_FP_TMP_0 ; wait ;
#     rm -f \$S_FP_TMP_1 ; wait ;
#     "

alias mmmv_clipboard_text_2_citation_et_34_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------tsitaadi--algus---------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 30 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------tsitaadi--lõpp----------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_uk_34_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------citation--start---------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 30 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------citation--end-----------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_et_44_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ----------tsitaadi----algus-------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 40 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ----------tsitaadi----lõpp--------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_uk_44_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ----------citation----start-------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 40 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ----------citation----end---------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_et_54_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------------tsitaadi----algus---------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 50 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------------tsitaadi----lõpp----------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "

alias mmmv_clipboard_text_2_citation_uk_54_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------------citation----start---------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 50 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------------citation----end-----------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "



alias mmmv_clipboard_text_2_citation_et_64_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------------------tsitaadi----algus-------------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 60 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------------------tsitaadi----lõpp--------------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "

alias mmmv_clipboard_text_2_citation_uk_64_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ------------------citation----start-------------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 60 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ------------------citation----end---------------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_et_74_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ----------------------tsitaadi------algus-----------------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 70 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ----------------------tsitaadi------lõpp------------------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "


alias mmmv_clipboard_text_2_citation_uk_74_t1=" S_FP_TMP_RAMPARTITION_OR_HDD=\"/tmp\" ; wait ; S_CMD_GNU_SED=\"sed\" ; if [ \"\`uname -a | grep -i 'BSD' \`\" != '' ]; then S_CMD_GNU_SED=\"gsed\" ; fi ; wait ; S_CMD_CLIPBOARD_2_FILE=\"xclip -out \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"xclip -selection c -in \" ; wait ; if [ \"\`uname -a | grep -i 'Microsoft' \`\" != '' ]; then echo '' > /dev/null ; wait ; S_CMD_CLIPBOARD_2_FILE=\"powershell.exe -c Get-Clipboard \" ; wait ; S_CMD_FILE_2_CLIPBOARD=\"clip.exe \" ; wait ; fi ; wait ; S_FN_SUFFIX=\"\`uuid | \$S_CMD_GNU_SED -e 's/-//g'\`.txt\" ; wait ; S_FP_TMP_0=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_\$S_FN_SUFFIX\" ; wait ; S_FP_TMP_1=\"\$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_1_\$S_FN_SUFFIX\" ; wait ; nice -n 2 \$S_CMD_CLIPBOARD_2_FILE | \$S_CMD_GNU_SED -e 's/[\\r][\\n]/\\n/g' | \$S_CMD_GNU_SED -e 's/[\\r]/\\n/g' | \$S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \$S_CMD_GNU_SED -e 's/[[:blank:]]\+/ /g' > \$S_FP_TMP_0 ; wait ; SI_LINECOUNT=\"\`wc -l \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e 's/[[:blank:]].\+//g' | \$S_CMD_GNU_SED -e 's/\$/+1/' | bc | tr -d '\\n' \`\" ; wait ; SI_ITERATIONCOUNT=\"\$SI_LINECOUNT\" ; wait ; for ((i = 0; i < \$SI_ITERATIONCOUNT ; i++)) do echo '' > /dev/null ; wait ; cat \$S_FP_TMP_0 | \$S_CMD_GNU_SED -e  '1{/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' > \$S_FP_TMP_0 ; wait ; done ; wait ; echo \"    ----------------------citation------start-----------------------------\" >  \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_0 | par_text_formatter 70 | \$S_CMD_GNU_SED -e '\${/^[[:blank:]]*\$/d}' | \$S_CMD_GNU_SED -e 's/^/    /g' >> \$S_FP_TMP_1 ; wait ; echo \"    ----------------------citation------end-------------------------------\" >> \$S_FP_TMP_1 ; wait ; cat \$S_FP_TMP_1 | \$S_CMD_FILE_2_CLIPBOARD ; wait ; rm -f \$S_FP_TMP_0 ; wait ; rm -f \$S_FP_TMP_1 ; wait ; "

} # func_mmmv_userspace_distro_t1_declare_clipboard_text_2_citation_aliases_t1

#--------------------------------------------------------------------------

# The dependencies of the aliases at 
# func_mmmv_userspace_distro_t1_declare_clipboard_text_2_citation_aliases_t1
# include or match with the dependencies of the aliases 
# declared in this function.
func_mmmv_userspace_distro_t1_declare_clipboard_text_2_X_extra_aliases_set_01(){
    #------------------------------------
    local S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/par_text_formatter_dependent_bashrc_subparts/extras_set_01.bash"
    func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_TMP_0"
    #------------------------------------
} # func_mmmv_userspace_distro_t1_declare_clipboard_text_2_X_extra_aliases_set_01

#--------------------------------------------------------------------------

if [ "$SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_UUID_EXISTS_ON_PATH" == "t" ]; then
            #--------------------------------------------------------------
            if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
                #----------------------------------------------------------
                if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
                            # The following 2 aliases are Windows specific:
                            #----------------------------------------------
                            alias mmmv_clipboard_text_2_citation_WSL_et_44_t1="S_FP_TMP=\"/tmp/tmp_\`uuid | sed -e 's/-//g'\`.txt\" ; wait ; echo \"--------tsitaadi----algus-------------- \`nice -n 2 powershell.exe -c Get-Clipboard\` --------tsitaadi----lõpp--------------\" | par_text_formatter 40 | sed -e 's/^/    /g' >> \$S_FP_TMP ; wait ; cat \$S_FP_TMP | clip.exe  ; wait ; rm -f \$S_FP_TMP ;"
                            #----------------------------------------------
                            alias mmmv_clipboard_text_2_citation_WSL_uk_44_t1="S_FP_TMP=\"/tmp/tmp_\`uuid | sed -e 's/-//g'\`.txt\" ; wait ; echo \"--------citation----start-------------- \`nice -n 2 powershell.exe -c Get-Clipboard\` --------citation----end---------------\" | par_text_formatter 40 | sed -e 's/^/    /g' >> \$S_FP_TMP ; wait ; cat \$S_FP_TMP | clip.exe  ; wait ; rm -f \$S_FP_TMP ;"
                            #----------------------------------------------
                        fi
                    fi
                fi
                #----------------------------------------------------------
            fi
            #--------------------------------------------------------------
            if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_BC_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                            if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
                                #------------------------------------------
                                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                                    #--------------------------------------
                                    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
                                        if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "t" ]; then
                                            if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "t" ]; then
                                                func_mmmv_userspace_distro_t1_declare_clipboard_text_2_citation_aliases_t1
                                                func_mmmv_userspace_distro_t1_declare_clipboard_text_2_X_extra_aliases_set_01
                                            fi
                                        fi
                                    else
                                        if [ "$SB_XCLIP_EXISTS_ON_PATH" == "t" ]; then
                                            func_mmmv_userspace_distro_t1_declare_clipboard_text_2_citation_aliases_t1
                                            func_mmmv_userspace_distro_t1_declare_clipboard_text_2_X_extra_aliases_set_01
                                        fi
                                    fi
                                    #--------------------------------------
                                fi
                                #------------------------------------------
                            fi
                        fi
                    fi
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="6c18ee4a-1553-4478-9d57-6082207067e7"
#========================================================================== 
