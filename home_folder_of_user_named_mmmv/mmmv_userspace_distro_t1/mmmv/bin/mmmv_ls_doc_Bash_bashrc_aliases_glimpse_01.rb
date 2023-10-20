#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================

# Commented out to cope with Ruby code formatter.
# 
# Pure Bash:
#
    # S_FP_WIKI_HOME="$HOME/Foo/awesome_vimwiki_Bar"
#     # FULL_PATH_TO_FOLDER_WITH_INDICES_0="$S_FP_WIKI_HOME/indices_for_glimpse_search_engine"
#     # FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS_0="$S_FP_WIKI_HOME/vimwiki_pages_are_plain_textfiles"
#     # # Only the alias names need to be changed in the 
#     # func_declare_glimpse_search_engine_related_aliases(){
#     #     #----------------------------------------
#     #     # The 
#     #     #     mmmv_cre_temporary_file_t1
#     #     #     mmmv_polish_ABC_2_ACB_exec_t1 
#     #     # are part of the 
#     #     #     https://sourceforge.net/projects/mmmv-userspace-distro-t1/
#     #     #     # which is mirrored at
#     #     #     https://github.com/martinvahi/mmmv_userspace_distro_t1
#     #     #----------------------------------------
#     # S_CMD_GNU_SED_0="sed" ; if [ "`uname -a | grep -i 'BSD' `" != '' ]; then S_CMD_GNU_SED="gsed" ; fi 
#     #     alias awesome_search_of_the_wiki="mmmv_polish_ABC_2_ACB_exec_t1 \" FULL_PATH_TO_FOLDER_WITH_INDICES=\\\"$FULL_PATH_TO_FOLDER_WITH_INDICES_0\\\" ; S_FP_TEMPORARY_FILE=\\\"\\\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \\\`\\\" ; wait ; S_SEARCHSTRING=\\\"\"  \"\\\" ; nice -n 2 glimpse -i -y -H \\\$FULL_PATH_TO_FOLDER_WITH_INDICES \\\"\\\$S_SEARCHSTRING\\\" | $S_CMD_GNU_SED_0 -e \\\"s/\\\\(\\\$S_SEARCHSTRING\\\\)/\\\\x1b[7m\\\\x1b[93m\\\\x1b[41m\\\\1\\\\x1b[27m\\\\x1b[39m\\\\x1b[49m/Ig\\\" | $S_CMD_GNU_SED_0 -e \\\"s/\\\\(^.\\\\+[:]\\\\)/\\\\x1b[35m\\\\1\\\\x1b[39m/\\\" > \\\$S_FP_TEMPORARY_FILE ; wait ; cat \\\$S_FP_TEMPORARY_FILE ; wait; rm -f \\\$S_FP_TEMPORARY_FILE \" "
#     #     alias awesome_indexing_of_the_wiki="FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS=\"$FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS_0\" ; FULL_PATH_TO_FOLDER_WITH_INDICES=\"$FULL_PATH_TO_FOLDER_WITH_INDICES_0\" ; rm -f \$FULL_PATH_TO_FOLDER_WITH_INDICES/.glimps* ; wait ; SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\"20\" ; nice -n 5 glimpseindex -M \$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H  \$FULL_PATH_TO_FOLDER_WITH_INDICES  \$FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS "
#     #     #----------------------------------------
#     # } # func_declare_glimpse_search_engine_related_aliases
#     # 
#     # func_declare_glimpse_search_engine_related_aliases # runs the function
#     #
#
# Double-escapbed version of the above code to cope with 
# the Ruby string escaping rules:
s_bash=<<bash_code_example_in_ruby_HEREDOC
# #-----boilerplate---start-------------------------------------
# if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
#     if [ "$S_CMD_GNU_SED" != "" ]; then
#         S_CMD_GNU_SED_0="$S_CMD_GNU_SED" # speed hack
#     else
#         S_CMD_GNU_SED_0="sed" 
#         if [ "`uname -a | grep -i 'BSD' `" != '' ]; then 
#             S_CMD_GNU_SED_0="gsed" 
#         fi 
#     fi
# fi
# #-----boilerplate---end---------------------------------------
# #
# S_FP_WIKI_HOME="$HOME/Foo/awesome_vimwiki_Bar"
# FULL_PATH_TO_FOLDER_WITH_INDICES_0="$S_FP_WIKI_HOME/indices_for_glimpse_search_engine"
# FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS_0="$S_FP_WIKI_HOME/vimwiki_pages_are_plain_textfiles"
# #
# # Only the alias names need to be changed in the 
# func_declare_glimpse_search_engine_related_aliases(){
#     #----------------------------------------
#     # The 
#     #     mmmv_cre_temporary_file_t1
#     #     mmmv_polish_ABC_2_ACB_exec_t1 
#     # are part of the 
#     #     https://sourceforge.net/projects/mmmv-userspace-distro-t1/
#     #     # which is mirrored at
#     #     https://github.com/martinvahi/mmmv_userspace_distro_t1
#     #----------------------------------------
#     # The purpose of the 
#     if [ "$SB_GLIMPSE_EXISTS_ON_PATH" != "" ]; then
#         # and the
#         if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" != "" ]; then
#             # is to make sure that the aliases
#             # are declared only, if the glimpse version 
#             # is compatible with the aliases.
#             #----------------------------------------
#             if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
#                 #------------------------------------
#                 alias awesome_search_of_the_wiki="mmmv_polish_ABC_2_ACB_exec_t1 \\" FULL_PATH_TO_FOLDER_WITH_INDICES=\\\\\\"$FULL_PATH_TO_FOLDER_WITH_INDICES_0\\\\\\" ; S_FP_TEMPORARY_FILE=\\\\\\"\\\\\\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \\\\\\`\\\\\\" ; wait ; S_SEARCHSTRING=\\\\\\"\\"  \\"\\\\\\" ; nice -n 2 glimpse -i -y -H \\\\\\$FULL_PATH_TO_FOLDER_WITH_INDICES \\\\\\"\\\\\\$S_SEARCHSTRING\\\\\\" | $S_CMD_GNU_SED_0 -e \\\\\\"s/\\\\\\\\(\\\\\\$S_SEARCHSTRING\\\\\\\\)/\\\\\\\\x1b[7m\\\\\\\\x1b[93m\\\\\\\\x1b[41m\\\\\\\\1\\\\\\\\x1b[27m\\\\\\\\x1b[39m\\\\\\\\x1b[49m/Ig\\\\\\" | $S_CMD_GNU_SED_0 -e \\\\\\"s/\\\\\\\\(^.\\\\\\\\+[:]\\\\\\\\)/\\\\\\\\x1b[35m\\\\\\\\1\\\\\\\\x1b[39m/\\\\\\" > \\\\\\$S_FP_TEMPORARY_FILE ; wait ; cat \\\\\\$S_FP_TEMPORARY_FILE ; wait; rm -f \\\\\\$S_FP_TEMPORARY_FILE \\" "
#                 alias awesome_indexing_of_the_wiki="FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS=\\"$FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS_0\\" ; FULL_PATH_TO_FOLDER_WITH_INDICES=\\"$FULL_PATH_TO_FOLDER_WITH_INDICES_0\\" ; rm -f \\$FULL_PATH_TO_FOLDER_WITH_INDICES/.glimps* ; wait ; SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\\"20\\" ; nice -n 5 glimpseindex -M \\$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H  \\$FULL_PATH_TO_FOLDER_WITH_INDICES  \\$FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS "
#                 #------------------------------------
#             fi
#             #----------------------------------------
#         fi
#     fi
#     #----------------------------------------
# } # func_declare_glimpse_search_engine_related_aliases
# 
# func_declare_glimpse_search_engine_related_aliases # runs the function
#
bash_code_example_in_ruby_HEREDOC

s_bash_out=("\e[36m \n"+s_bash.gsub(/^[#][\s]?/,"")+"\n\e[39m")
puts s_bash_out
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="42695625-619d-4a94-921b-4122011077e7"
#==========================================================================
