#!/usr/bin/env ruby
# encoding: UTF-8

require 'rubygems'
require 'nokogiri'

file = File.open("./tels.html")
html = Nokogiri::HTML(file)
file.close

out_file = File.open("./raz.txt", "w")
html.css('tr').each do |line|

    wiki = "| "
    line.css('th').each do |head|
        wiki += "*" + head + "* |"
    end

    line.css('td').each do |data|
        wiki += data.content + " | "
    end
    out_file << wiki + "\n"
end
out_file.close
