/*=========================================================================
 Initial author of this file: Martin.Vahi@softf1.com
 This file is in public domain.
 The following line is a spdx.org license label line:
 SPDX-License-Identifier: 0BSD

     https://stackoverflow.com/questions/150355/programmatically-find-the-number-of-cores-on-a-machine
     https://archive.is/k9X5W

=========================================================================*/
#include <cstdio>
#include <thread>

int main() {
    unsigned int i_n_of_hardware_threads = std::thread::hardware_concurrency();
    if (i_n_of_hardware_threads==0 ) {
        // https://en.cppreference.com/w/cpp/thread/thread/hardware_concurrency
        // ----citation--start-----
        // Number of concurrent threads supported.
        // If the value is not well defined or
        // not computable, returns ​0​.
        // ----citation--end-------
        // archival copy: https://archive.ph/5Le3H
        i_n_of_hardware_threads=1;
    }
    printf("%i",i_n_of_hardware_threads );
} // main

/*=========================================================================
S_VERSION_OF_THIS_FILE="008f261a-d4b0-49b9-81e8-a3a0a0a1b7e7"
=========================================================================*/
