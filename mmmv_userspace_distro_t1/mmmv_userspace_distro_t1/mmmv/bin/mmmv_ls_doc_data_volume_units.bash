#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
#S_FP_ORIG="`pwd`" 
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
    S_FP_ATTIC="$MMMV_USERSPACE_DISTRO_T1_HOME/attic"
else
    S_FP_ATTIC="/home/mmmv/mmmv_userspace_distro_t1/attic"
fi
#--------------------------------------------------------------------------
S_FP_IBM_PRODUCT_MANUAL_PDF="$S_FP_ATTIC/documentation/third_party_documentation/Computer_Science/ABC/data_units/2021_xx_xx_IBM_Storage_Insights_Product_Manual.pdf"
SB_IBM_PRODUCT_MANUAL_PRESENT="f" # domain: {"t","f"}
if [ -e "$S_FP_IBM_PRODUCT_MANUAL_PDF" ]; then
    if [ -d "$S_FP_IBM_PRODUCT_MANUAL_PDF" ]; then
        echo ""
        echo "The path"
        echo ""
        echo "    $S_FP_IBM_PRODUCT_MANUAL_PDF"
        echo ""
        if [ -h "$S_FP_IBM_PRODUCT_MANUAL_PDF" ]; then
            echo "references a symlink to a folder"
        else
            echo "references a folder"
        fi
        echo -e "but\e[31m a file is expected\e[39m."
        echo "GUID=='0e84d632-6a97-4d83-b229-d002a0c096e7'"
        echo ""
        exit 1 
    else
        SB_IBM_PRODUCT_MANUAL_PRESENT="t"
    fi
fi
#--------------------------------------------------------------------------
func_display_doc() {
    #--------------------
    echo ""
    echo "The following data has been copy-pasted from"
    echo ""
    echo "    https://www.ibm.com/docs/en/SSQRB8/pdf/storage-insights-documentation.pdf"
    if [ "$SB_IBM_PRODUCT_MANUAL_PRESENT" == "t" ]; then
        echo "    local copy: $S_FP_IBM_PRODUCT_MANUAL_PDF"
    fi
    echo ""
    echo "chapter \"Units of measurement for storage data\", "
    echo "PDF-file page 120, visual page 63. The orignal HTML version "
    echo "of that document resides at:"
    echo ""
    echo "    https://www.ibm.com/docs/en/storage-insights?topic=overview-units-measurement-storage-data"
    echo ""
    echo -e "kibibyte\e[33m KiB 2^10\e[39m kilobyte KB 10^3"
    echo -e "mebibyte\e[33m MiB 2^20\e[39m megabyte MB 10^6"
    echo -e "gibibyte\e[33m GiB 2^30\e[39m gigabyte GB 10^9"
    echo -e "tebibyte\e[33m TiB 2^40\e[39m terabyte TB 10^12"
    echo -e "pebibyte\e[33m PiB 2^50\e[39m petabyte PB 10^15"
    echo -e "exbibyte\e[33m EiB 2^60\e[39m exabyte  EB 10^18"
    echo ""
    echo "GUID=='ace24f11-8d50-4969-a529-d002a0c096e7'"
    echo ""
    #--------------------
} # func_display_doc

func_display_doc

#--------------------------------------------------------------------------
#cd "$S_FP_ORIG"
exit 0 
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="27ad897b-cdea-4bc7-8129-d002a0c096e7"
#==========================================================================
