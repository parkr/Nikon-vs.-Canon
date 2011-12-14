#!/usr/bin/env ruby -wKU

require 'flickraw-cached'
require "#{File.dirname(__FILE__)}/helpers"

SEPARATOR = "\nNikon
------------------------------------------------------------
Canon\n"

FlickRaw.api_key = "88d95a26510271b373cadcdd9e18ab14"
FlickRaw.shared_secret = "8e86dfa5ebf15ef8"

dump = File.open("cameras.txt", "a+")

options = {
  :tags => nil,
  :page => 1,
  :per_page => 10,
  :privacy_filter => 1,
  :media => "photos",
  :accuracy => 3,
  #:machine_tags => "camera:",
  :content_type => 1
}
pages = [5,4,3,2,1]

begin
  
  options[:tags] = "nikon"
  pages.each do |page|
    options[:page] = page
    nikon = flickr.photos.search( options )
                          
    good_nikon = File.open("good_nikon.csv", "a+")
    nikon.each do |p|
      begin
        exif = flickr.photos.getExif(:photo_id => p.id)
        dump.write("#{p.id} taken with a #{exif.camera}\n")
        if exif.camera.include?("Nikon")
          url = FlickRaw.url_b(flickr.photos.getInfo(:photo_id => p.id))
          puts "(#{p.id}) #{p.title}: #{url}"
          if exif.camera.include?("Nikon") && exif.camera.index(/D(\d+)(S?)/) != nil
            good_nikon.write "#{p.id},\"Nikon\",\"#{url}\"\n"
          end
        end
      rescue FlickRaw::FailedResponse
      rescue Timeout::Error, Errno::ETIMEDOUT
      rescue Interrupt
        exit(0)
      end
    end
    nikon = nil
  end

  puts SEPARATOR
 
 
  options[:tags] = "canon"
  pages.each do |page|
    options[:page] = page
    canon = flickr.photos.search( options )
                                
    good_canon = File.open("good_canon.csv", "a+")
    canon.each do |p|
      begin
        exif = flickr.photos.getExif(:photo_id => p.id)
        dump.write("#{p.id} taken with a #{exif.camera}\n")
        if exif.camera.include?("Canon")
          url = FlickRaw.url_b(flickr.photos.getInfo(:photo_id => p.id))
          puts "(#{p.id}) #{p.title}: #{url}"
          if exif.camera.include?("Canon") && Helpers.include?(exif.camera, ["EOS", "Rebel", "Mark"])
            good_canon.write "#{p.id},\"Canon\",\"#{url}\"\n"
          end
        end
      rescue FlickRaw::FailedResponse
      rescue Timeout::Error, Errno::ETIMEDOUT
      rescue Interrupt
        exit(0)
      end
    end
  end
  
  dump.close
  
rescue FlickRaw::FailedResponse => e
  puts "Error #{e.code} - #{e.message} - \n"
  for line in e.backtrace
    puts "\t#{line}"
  end
  puts "\n#{e}"
rescue TypeError => e
  puts "#{e.class}: #{e.message} on line #{e.backtrace[0]}"
rescue Interrupt
  exit(0)
rescue Exception => e
  puts "#{e.class} - #{e.message} - \n"
  for line in e.backtrace
    puts "\t#{line}"
  end
end