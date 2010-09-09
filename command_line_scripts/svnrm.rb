#!/usr/bin/env ruby
# == Synopsis 
#   This is a very simple script for removing all .svn folders from your subversion 
#   local repository. 
#
# == Usage 
#   svnrm target_repo_dir
#
#   For help use: svnrm -h
#
# == Options
#   -h, --help          Displays help message
#   -v, --version       Display the version, then exit
#
# == Examples
#   Removes all .svn folders from 'my_project' folder:
#     svnrm ./my_project
#
# == FAQ
#   1. Hey! Haven't you ever heard about Cmdparse or even Thor gems??
#   R. Yes I did. I just like to write the most independent script possible. BTW, native
#      ruby OptionParser already does a lot of the dirty work. :)
#
#   2. Couldn't I just type some shell commands isntead of using this gem?
#   R. Of course you can aways run the following command in order to 
#      do it: 
#        find . -type d -name .svn -exec rm -rf {} \;
#      Or even, a much better approach is to run 'svn export' instead of a 'svn checkout'. :P
#
#   3. So why did I wrote this script? 
#   R. The first reason is very straight: For fun!
#      The second reason is learning a litle bit of ruby-lang. 
#      And last but not least, to provide a simple command line interface for all OSs.
#
# == Author
#   Leonardo Luz Almeida (@leo_luz)
#   leonardo dot la at gmail dot com
#
# == Credits
#   Credits to Todd Weth (http://blog.infinitered.com/entries/show/5) for the command-line
#   application skeleton
#
# == Copyright
#   Copyright (c) 2010 Leonardo Luz. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php

require "fileutils"
require "rdoc/usage"
require "optparse"

include FileUtils

class App

    VERSION = '0.1b'

    def initialize(arguments)
        @arguments = arguments
    end

    def run
        unless parsed_options? && valid_arguments?
            output_usage
        end
        
        clean_svn_folders @arguments.last
    end

private

    def parsed_options?
        options = OptionParser.new
        options.on('-h', '--help') { output_help }
        options.on('-v', '--version') { output_version }
        options.parse!(@arguments) rescue return false

        true
    end

    def valid_arguments?
        unless @arguments.last != nil && File.directory?(@arguments.last)
            output_usage
        end

        true
    end

    def output_usage
        puts RDoc::usage("usage")
    end

    def output_help
        puts RDoc::usage
    end

    def output_version
        puts "svnrm version: #{VERSION}"
        exit 0
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

app = App.new(ARGV)
app.run
