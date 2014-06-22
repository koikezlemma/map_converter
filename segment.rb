# -*- coding: utf-8 -*-

class Segment
  attr_reader :src_latlon, :dest_latlon

  private
  def initialize(src_latlon = nil, dest_latlon = nil)
    @src_latlon = src_latlon
    @dest_latlon = dest_latlon
  end
end


