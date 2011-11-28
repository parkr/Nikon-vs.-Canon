#!/usr/bin/env ruby -wKU

CANON_FILE = File.join(File.dirname(__FILE__), 'good_canon.csv')
NIKON_FILE = File.join(File.dirname(__FILE__), 'good_nikon.csv')

File.unlink(CANON_FILE) if File.exists? CANON_FILE
File.unlink(NIKON_FILE) if File.exists? NIKON_FILE

File.open(CANON_FILE, 'w+'){|f| f.write("") } 
File.open(NIKON_FILE, 'w+'){|f| f.write("") }