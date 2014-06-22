# -*- coding: utf-8 -*-

require_relative 'dimacs_reader.rb'
require_relative 'segment.rb'
require_relative 'kml_creator.rb'

# ARGV
file_name_vertex = ARGV[0] || "../maps/USA-road-d.NY.co"
file_name_edge = ARGV[1] || "../maps/USA-road-t.NY.gr"
file_name_output = ARGV[2] || "test.kml"

# Read DIMACS file
begin
  latlon_array, edge_attr_array = DimacsReader.read_dimacs(file_name_vertex, file_name_edge)
rescue => e
  $stderr.puts "Failed to read DIMACS file: #{e.message}"
  exit
end

# Create segment array
segment_array = []
edge_attr_array.each do |edge_attr|
  src_latlon = latlon_array[edge_attr.start_vid - 1]
  dest_latlon = latlon_array[edge_attr.end_vid - 1]
  segment_array.push Segment.new(src_latlon, dest_latlon)
end

# Create kml file
begin
  KmlCreator.create_kml(file_name_output, segment_array)
rescue => e
  $stderr.puts "Failed to create KML file: #{e.message}"
  exit
end


