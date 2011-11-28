#!/usr/bin/env ruby -wKU

require 'csv'

class String
  def isnumeric
    /^[\d]+(\.[\d]+){0,1}$/ === self
  end
end

class Array
  def to_sql_string
    self.map do |v|
      unless v.isnumeric
        "'#{v}'"
      else
        v
      end
    end.join(',')
  end
  def to_sql_cols
    self.map do |c|
      "`#{c}`"
    end.join(',')
  end
end

def insert_query(stuff)
  unless stuff.is_a? Hash
    raise ArgumentError, "Function `insert_query` accepts a Hash of column names and values"
  end
  "INSERT IGNORE INTO `#{TABLE_NAME}` (#{stuff.keys.to_sql_cols}) VALUES (#{stuff.values.to_sql_string});"
end

TABLE_NAME = "nikon-canon"

ids = []

CSV.foreach("good_canon.csv") do |row|
  puts insert_query({:photo_id => row[0], :brand => row[1], :url => row[2]}) if row[0] && !ids.include?(row[0])
  ids << row[0]
end

CSV.foreach("good_nikon.csv") do |row|
  puts insert_query({:photo_id => row[0], :brand => row[1], :url => row[2]}) if row[0] && !ids.include?(row[0])
  ids << row[0]
end

puts "\n# Converted #{ids.size} rows from CSV to SQL."