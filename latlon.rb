# -*- coding: utf-8 -*-

class Latlon
  attr_reader :lat, :lon

  private
  def initialize(lat = nil, lon = nil)
    @lat = lat
    @lon = lon
  end
end


