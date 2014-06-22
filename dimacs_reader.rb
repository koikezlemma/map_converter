# -*- coding: utf-8 -*-

require 'csv'
require_relative 'latlon.rb'
require_relative 'edge_attr.rb'


module DimacsReader
  module_function

  def read_dimacs(file_vertices, file_edges)
    latlon_array = []
    edge_attr_array = []
    # Read vertex file
    CSV.foreach(file_vertices, {col_sep:' '}) do |row|
      if row[0] == "v" then
        latlon_array.push Latlon.new(row[3].to_i, row[2].to_i)
      end
    end
    # Read edge file
    CSV.foreach(file_edges, {col_sep:' '}) do |row|
      if row[0] == "a" then
        edge_attr_array.push EdgeAttr.new(row[1].to_i, row[2].to_i, row[3].to_i)
      end
    end
    return latlon_array, edge_attr_array
  end
end
