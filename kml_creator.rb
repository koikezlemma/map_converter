# -*- coding: utf-8 -*-

require 'rexml/document'
require 'xml'
require_relative 'latlon.rb'
require_relative 'segment.rb'


module KmlCreator
  module_function

  def create_kml(file_name, segment_array)
    str_alt = "0"
    doc = REXML::Document.new
    doc << REXML::XMLDecl.new('1.0', 'UTF-8')
    kml = doc.add_element("kml", {"xmlns" => "http://www.opengis.net/kml/2.2"})
    placemark = kml.add_element("Placemark")
    multi_geometry = placemark.add_element("MultiGeometry")
    segment_array.each do |segment|
      line_string = multi_geometry.add_element("LineString")
      line_string.add_element("coordinates").add_text(
        (segment.src_latlon.lon.to_f / 1000000 ).to_s + "," +
        (segment.src_latlon.lat.to_f / 1000000 ).to_s + "," + str_alt + ". " +
        (segment.dest_latlon.lon.to_f / 1000000 ).to_s + "," +
        (segment.dest_latlon.lat.to_f / 1000000 ).to_s + "," + str_alt + ". " )
    end
    style = placemark.add_element("Style")
    line_style = style.add_element("LineStyle")
    line_style.add_element("color").add_text "#ff0000ff"
    line_style.add_element("width").add_text "5"
    open(file_name, "w") do |io|
      doc.write(io,2)
    end
  end
end
