/*=========================================================================
 This source file is a heavily modified version of an example from
 https://github.com/eclipse-ecal/fineftp-server/README.md
 Author of the modification: Martin.Vahi@softf1.com

 The following line is a spdx.org license label line:
 SPDX-License-Identifier: MIT

 In the case of this example FTP server usernames and passwords
 are hardcoded at function func_b_declare_users_and_their_access_folders(...).
=========================================================================*/
#include "./../include/fineftp/server.h"
#include <iostream>
#include <string>
#include <thread>
//-------------------------------------------------------------------------

struct Opmem01 {
    fineftp::FtpServer& ob_FTP_server;
    unsigned short int i_FTP_server_IPv4_port_number; // range [0..1023] requires root privileges
}; // struct Opmem01

bool func_b_declare_anonymous_user_and_its_access_folder(Opmem01& obr_opmem,
        const std::string& s_fp_writable_folder) {
    //---------------------------------------------------------------------
    fineftp::FtpServer& ob_FTP_server=obr_opmem.ob_FTP_server;
    //---------------------------------------------------------------------
    bool b_user_registration_succeeded=false;
    // Add the anonymous user. Clients can log in using username "anonymous" or
    // "ftp" with any password. The user will be able to access the folder and
    // upload, download, create or delete files.
    b_user_registration_succeeded=ob_FTP_server.addUserAnonymous(
                                      s_fp_writable_folder,
                                      fineftp::Permission::All);
    //                                fineftp::Permission::DirCreate
    //                                fineftp::Permission::DirDelete
    //                                fineftp::Permission::DirList
    //                                fineftp::Permission::DirRename
    //                                fineftp::Permission::FileAppend
    //                                fineftp::Permission::FileDelete
    //                                fineftp::Permission::FileRead
    //                                fineftp::Permission::FileRename
    //                                fineftp::Permission::FileWrite
    //                                fineftp::Permission::None
    //                                fineftp::Permission::ReadOnly
    //---------------------------------------------------------------------
    if (b_user_registration_succeeded) {
        // The folder path, std::string, is an ASCII string, NOT a Unicode string.
        std::cout << "The folder that is declared to be writable by FTP server anonymous user:" << std::endl;
        std::cout << "    \e[36m" << s_fp_writable_folder << "\e[39m" << std::endl;
    } else {
        std::cout << "\e[31m Failed to register the anonymous user\e[39m. " << std::endl;
    }
    bool b_errors_occurred=(!b_user_registration_succeeded);
    return b_errors_occurred;
    //---------------------------------------------------------------------
} // func_b_declare_anonymous_user_and_its_access_folder

bool declare_password_authenticated_user_and_its_access_folder(Opmem01& obr_opmem,
        const std::string& s_username, const std::string& s_password,
        const std::string& s_fp_writable_folder) {
    //---------------------------------------------------------------------
    fineftp::FtpServer& ob_FTP_server=obr_opmem.ob_FTP_server;
    //---------------------------------------------------------------------
    bool b_user_registration_succeeded=false;
    b_user_registration_succeeded=ob_FTP_server.addUser(s_username,
                                  s_password, s_fp_writable_folder,
                                  fineftp::Permission::All);
    //                            fineftp::Permission::DirCreate
    //                            fineftp::Permission::DirDelete
    //                            fineftp::Permission::DirList
    //                            fineftp::Permission::DirRename
    //                            fineftp::Permission::FileAppend
    //                            fineftp::Permission::FileDelete
    //                            fineftp::Permission::FileRead
    //                            fineftp::Permission::FileRename
    //                            fineftp::Permission::FileWrite
    //                            fineftp::Permission::None
    //                            fineftp::Permission::ReadOnly
    //---------------------------------------------------------------------
    if (b_user_registration_succeeded) {
        // The folder path, std::string, is an ASCII string, NOT a Unicode string.
        std::cout << "The folder that will be writable by FTP server user" << s_username << ":" << std::endl;
        std::cout << "    \e[36m" << s_fp_writable_folder << "\e[39m" << std::endl;
    } else {
        std::cout << "\e[31m Failed to register user\e[39m "<< s_username << " ." << std::endl;
    }
    bool b_errors_occurred=(!b_user_registration_succeeded);
    return b_errors_occurred;
    //---------------------------------------------------------------------
} // declare_password_authenticated_user_and_its_access_folder

bool func_b_declare_users_and_their_access_folders(Opmem01& obr_opmem) {
    //---------------------------------------------------------------------
    bool b_errors_occurred=true;
    std::string s_username="";
    std::string s_password="";
    //--------------------------------------
    std::string s_fp_writable_folder=""; // Full folder path in ASCII.
    // The folder gets created automatically by the FTP server, but the
    // operating system user that runs the FTP server must have the right
    // to create that folder. The FTP server creates the folder as if it
    // called the "mkdir -p folderpath" in stead of calling
    // the "mkdir folderpath".
    std::string s_fp_writable_folder_prefix="/tmp/FTPuser_";
    //---------------------------------------------------------------------
    s_fp_writable_folder=s_fp_writable_folder_prefix+"anonymous";
    b_errors_occurred=func_b_declare_anonymous_user_and_its_access_folder(
                          obr_opmem, s_fp_writable_folder);
    if (b_errors_occurred) {
        return b_errors_occurred;
    }
    //---------------------------------------------------------------------
    // Adding the same user twice will trigger a runtime error at
    // FTP server startup.
    s_username="turtleleonardo";
    s_password="wow1";
    s_fp_writable_folder=s_fp_writable_folder_prefix+s_username;
    b_errors_occurred=declare_password_authenticated_user_and_its_access_folder(
                          obr_opmem, s_username, s_password,
                          s_fp_writable_folder);
    if (b_errors_occurred) {
        return b_errors_occurred;
    }
    //---------------------------------------------------------------------
    return b_errors_occurred;
    //---------------------------------------------------------------------
} // func_b_declare_users_and_their_access_folders

int main() {
    //---------------------------------------------------------------------
    // The domain of the IPv4 ports: [0,(2^16-1)]=[0,65536].
    // On Linux the IPv4 ports in range [0..1023] can be allocated to
    // an application only by having Linux root user privileges or
    // privileges delegated by Linux root user (the sudo command).
    const unsigned short int i_FTP_server_IPv4_port_number=2121;
    // FTP server access can not be easily tunnelled over SSH or through
    // routers that remap router LAN("Local Area Network") side client
    // IPv4 ports to router WAN("Wide Area Network") side ports(search
    // terms: "Network Address Translation", "NAT"), because according
    // to the FTP protocol an FTP client can request the opening of
    // additional server side ports.
    //
    //     --citation--from--FTP--protocol--definition--RFC959--start---
    //     The User-PI may request the server side to identify a non-default
    //     server side data port with the PASV command.
    //     --citation--from--FTP--protocol--definition--RFC959--end-----
    //     https://www.rfc-editor.org/rfc/rfc959.txt
    //
    //---------------------------------------------------------------------
    const std::string s_FTP_server_IPv4_address="192.168.31.7";
    fineftp::FtpServer ob_FTP_server(s_FTP_server_IPv4_address,
                                     i_FTP_server_IPv4_port_number);
    Opmem01 obr_opmem= {ob_FTP_server,i_FTP_server_IPv4_port_number};
    //---------------------------------------------------------------------
    bool b_errors_occurred=true;
    b_errors_occurred=func_b_declare_users_and_their_access_folders(obr_opmem);
    //--------------------------------------
    if (b_errors_occurred) {
        return 1;
    } else {
        //--------------------------------------
        unsigned short int i_threadpool_size=2;
        ob_FTP_server.start(i_threadpool_size);
        //--------------------------------------
        // Prevent the application from exiting immediately
        for (;;) std::this_thread::sleep_for(std::chrono::milliseconds(100));
        return 0;
        //--------------------------------------
    }
    //---------------------------------------------------------------------
} // main

/*=========================================================================
 S_VERSION_OF_THIS_FILE="7af30626-7dac-480d-8514-61427031aae7"
=========================================================================*/
