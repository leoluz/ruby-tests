#!/usr/bin/env ruby
# == Synopsis 
#   This is a very simple script for removing all .svn folders from your subversion 
#   local repository. Of course you can aways run the following command in order to 
#   do it: 
#      find . -type d -name .svn -exec rm -rf {} \;
#
#   Or even, a much better approach is to run 'svn export' instead of a 'svn checkout'.
#
#   So why did I wrote this script? The first reason is very straight: 
#   - For fun!
#
#   The second reason is learning a litle bit of ruby-lang. 
#
#   And last but not least is to provide a simple command line interface for all OSs.
#
# == Examples
#   Removes all .svn folders from 'my_project' folder:
#     svnrm ./my_project
#
# == Usage 
#   svnrm target_repo
#
#   For help use: svnrm -h
#
# == Options
#   -h, --help          Displays help message
#   -v, --version       Display the version, then exit
#
# == Author
#   Leonardo Luz Almeida (@leo_luz)
#
# == Copyright
#   Copyright (c) 2010 Leonardo Luz. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php

require "fileutils"
require "rdoc/usage"

include FileUtils

class App

    VERSION = '0.0.0.1b'

    def initialize(arguments)
        @arguments = arguments
    end

    def run
        
    end

    def clean_svn_folders(parent_dir)

        cur_dir = Dir.new parent_dir

        cur_dir.each do |dir|
            if dir =~ /[^\.$]/
                file = File.join(parent_dir, dir)
                if File.directory?(file)
                    if dir =~ /\.svn$/
                        FileUtils.rm_rf file
                    else
                        clean_svn_folders file
                    end
                end
            end
        end
    end
end


if ARGV.first == nil 
    puts RDoc::usage("usage")
else
    puts "clean it up"
end
#clean_svn_folders repo 
