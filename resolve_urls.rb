#!/usr/bin/env ruby -wKU

require 'flickraw'

FlickRaw.api_key = "88d95a26510271b373cadcdd9e18ab14"
FlickRaw.shared_secret = "8e86dfa5ebf15ef8"

table_name = "nikon-canon"
photo_ids = "6397861653
6397768407
6397961441
6398043351
6398025535"

photo_ids.split("\n").to_a.each do |photo_id|
  begin 
    puts "UPDATE `#{table_name}` SET `url` = \"#{FlickRaw.url_b(flickr.photos.getInfo(:photo_id => photo_id))}\" WHERE `photo_id` = #{photo_id};\n"
  rescue FlickRaw::FailedResponse => e
    puts "DELETE FROM `#{table_name}` WHERE `photo_id` = #{photo_id}; # #{e.message}"
  rescue Interrupt
    exit(0)
  rescue Exception => e
    puts "#{photo_id}: #{e.message}"
  end
end