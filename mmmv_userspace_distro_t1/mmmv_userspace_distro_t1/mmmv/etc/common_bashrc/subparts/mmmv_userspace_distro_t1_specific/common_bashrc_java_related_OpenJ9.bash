#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
# S_VERSION_OF_THIS_FILE="468a3b18-347e-421b-b59f-5053808096e7"
#--------------------------------------------------------------------------

#export JAVA_HOME="/home/mmmv/applications/Java/installed/ja_nii_edasi/v2021_03_xx_Java11_OpenJ9/jdk-11.0.10+9"
S_FP_JIT_CACHE_FOLDER="$HOME/.mmmv/Java/OpenJ9/AOT_cache"

#S_FP_APPLICATION_EXECUTABLE=""

#--------------------------------------------------------------------------

# Ahead-of-Time compilation (AOT) related settings:
#     https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xshareclasses/index.html
#     https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xscminaot/index.html
#     https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xaot/index.html
# 
#     -Xshareclasses:help           # lists       documentation to console
#     -Xshareclasses:listAllCaches  # lists state documentation to console
#
#     -Xshareclasses:persistent  # reuses cache content after operating system reboot
#     -Xshareclasses:destroyAll  # empties the cache 
#     -Xshareclasses:readonly    # uses the cache as readonly cache
#
#     -Xaot:count=<a nonnegative integer> # method call count before it gets compiled, 0 compiles on 1. execution
#
#     -Xshareclasses:cacheDir=<directory>
#     -Xshareclasses:adjustmaxaot=<size>     is the same as -Xscmaxaot<size>
#     -Xshareclasses:adjustminaot=<size>     is the same as -Xscminaot<size>
#     -Xshareclasses:adjustmaxjitdata=<size> is the same as -Xcsmaxjitdata<size>
#     -Xshareclasses:adjustminjitdata=<size> is the same as -Xcsminjitdata<size>
#
#     -Xshareclasses:fatal  # The VM does not start if class data sharing 
#                           # fails, for example because there was an error 
#                           # when accessing the cache directory. An error 
#                           # message is generated. This suboption is specified 
#                           # by default unless you use the bootClassesOnly 
#                           # suboption, which is equivalent to 
#                           # -Xshareclasses:bootClassesOnly,nonfatal. 
#
S_AOT_0=" -Xshareclasses -Xscminaot20K -Xscmaxaot200M -Xaot:count=20 -Xshareclasses:persistent"
S_AOT_1=" -Xshareclasses:cacheDir=$S_FP_JIT_CACHE_FOLDER -Xshareclasses:fatal " 
S_AOT_ALL=" $S_AOT_0 $S_AOT_1"

# Just-in-Time compilation (JIT) related settings:
#     https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xcompilationthreads/index.html
#     https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xjit/index.html
#     Feedback about JIT work: 
#         -Xjit:verbose={compileStart} 
#         -Xjit:verbose={compileEnd} 
#         -Xjit:verbose={compilePerformance} 
#         -Xjit:vlog=<vlog_filename>
#             Commandline example: 
#             java -Xjit:verbose,vlog=our_nice_log.txt -version
#     -Xjit:count=<a nonnegative integer> # method call count before it gets compiled, 0 compiles on 1. execution
#     -XcompilationThreads<a whole number in range [1,7]> # JIT can be disabled with -Xint
#     JIT compilation optimisation level domain: 
#         -Xjit:optlevel=[noOpt|cold|warm|hot|veryHot|scorching]
#     -Xjit:enableGPU
#     -Xjit:enableGPU={verbose},vlog=output.txt
#         # Systems must support NVIDIA Compute Unified Device Architecture (CUDA). 
#         # The JIT requires the CUDA Toolkit 7.5 and your GPU device must have 
#         # a minimum compute capability of 3.0.
S_JIT_0=" -XcompilationThreads1 -Xjit:count=100 "
S_JIT_1=" -Xjit:enableGPU"
S_JIT_ALL=" $S_JIT_0 $S_JIT_1"

# https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xss/index.html
# A command that displays the current values:
#     java -verbose:sizes -version
#     -Xiss<size> # initial Java thread stack size, default == 2KiB
#     -Xss<size>  # maximum Java thread stack size, default for 32b systems == 320KiB, default for 64b systems == 1MiB
#     -Xssi<size> # Java thread stack size increment, default == 16KiB
S_THREAD_STACK_SIZE_0=" -Xssi4K "

# https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xargencoding/index.html
S_ENCODING_0=" -Xargencoding:utf8"

# https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xfuture/index.html
# Switches on checks that are stricter than default checks.
S_DEVELOPMENT_MODE_ARGS=" -Xfuture "

# https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xlockword/index.html
# https://blog.openj9.org/2019/04/02/lock-reservation/
# It's about optimisations that are related to threading related locks. Citation:
#     ----citation---start---------
#     In OpenJ9, lock reservation is an optimization of thin/flat locks, 
#     which are represented by the lock-words in the object-monitors. 
#     It exploits the thread locality of Java object locks. 
#     It reduces the need for atomic compare-and-swap (CAS) 
#     operations that stall the CPU.
#     ----citation---end-----------
#     
#     -Xlockword:mode=all      # probabilistically reduces memory usage
#     -Xlockword:mode=default  # enables the runtime optimisations again
#     -Xlockword:nolockword=<class_name> # Removes the lockword from object instances 
#                                        # of the class <class_name>, reducing the space 
#                                        # required for these objects.  However, this action 
#                                        # might have an adverse effect 
#                                        # on synchronization for those objects.
#     -Xlockword:what          # displays the curren lockworld configuration
S_RUNTIME_OPTIMIZATIONS_0=" -Xlockword:mode=default"

# https://www.ibm.com/support/knowledgecenter/SSYKE2_8.0.0/openj9/xaggressive/index.html
S_EXPERIMENTAL_0=" -Xaggressive"

# Options to the right override options to the left.
export OPENJ9_JAVA_OPTIONS=" $S_RUNTIME_OPTIMIZATIONS_0 $S_AOT_ALL $S_JIT_ALL $S_ENCODING_0 $S_THREAD_STACK_SIZE_0 "
#--------------------------------------------------------------------------
#$S_FP_APPLICATION_EXECUTABLE
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="0d5cca47-f42a-4e9b-949f-5053808096e7"
#==========================================================================
