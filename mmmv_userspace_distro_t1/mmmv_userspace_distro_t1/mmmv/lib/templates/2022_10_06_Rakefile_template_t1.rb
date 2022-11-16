#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: 
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
require "rake"
#--------------------------------------------------------------------------
# require 'pathname'
# ob_pth=Pathname.new(__FILE__).realpath.parent
# s_fp=ob_pth.to_s+"/rakefile_subparts/rakefile_subpart_01.rb"
# require s_fp # loads also the KRL boilerplate
# ob_pth=nil;
# ob_rakefile_subpart_01=Rakefile_subpart_01.new
#--------------------------------------------------------------------------
task :build_devel_deliverables do
   raise(Exception.new("\n\n Subject to completion! \n\n"))
end

task :build_deployment_deliverables do
   raise(Exception.new("\n\n Subject to completion! \n\n"))
end

task :build_for_testing do
   raise(Exception.new("\n\n Subject to completion! \n\n"))
end

task :deploy_for_testing do
   raise(Exception.new("\n\n Subject to completion! \n\n"))
end

task :r => [:build_for_testing,  :deploy_for_testing] do
   # For convenience only. The "r" is derived from the word "run".
end
#--------------------------------------------------------------------------
task :default do
   ar_task_names=Array.new
   Rake.application.tasks.each {|x_task| ar_task_names<<x_task.to_s}
   ar_task_names.sort!
   puts "\nAvailable Rake functions:\n"
   s_1="                "
   ar_task_names.each do |s_task_name|
      puts s_1+s_task_name.to_s
   end # loop
   puts "\n"
end
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="5c249e59-3cf2-4a45-b1cb-31122170a6e7"
#==========================================================================
