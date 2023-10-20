#!/usr/bin/env bash
#==========================================================================
# Initial author of this script: 
# This script is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
# Downloadable project home page:
#     
#     http://xnap.sourceforge.net/
#     https://sourceforge.net/projects/xnap/
#
#--------------------------------------------------------------------------
S_VERSION_OF_THIS_FILE="9c4130de-02b2-4d0c-b4a3-d100808185e7"
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------
S_FP_CLONE="$S_FP_DIR/the_clone"
mkdir -p "$S_FP_CLONE"
S_ERR_CODE="$?"
if [ "$S_ERR_CODE" == "0" ]; then
    sync; wait
    cd "$S_FP_CLONE"
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P htdocs
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P libs
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P xdocs
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P xnap
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P xnap2
    cvs -z3 -d:pserver:anonymous@a.cvs.sourceforge.net:/cvsroot/xnap co -P xnap3
    sync; wait
else
    echo ""
    echo "Failed to create the clone folder. S_ERR_CODE==$S_ERR_CODE"
    echo "GUID=='15ecc9c8-40aa-4751-b2a3-d100808185e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1
fi
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
#==========================================================================
