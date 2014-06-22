# -*- coding: utf-8 -*-

class EdgeAttr
  attr_reader :cost, :start_vid, :end_vid

  private
  def initialize(start_vid = nil, end_vid = nil, cost = nil)
    @start_vid = start_vid
    @end_vid = end_vid
    @cost = cost
  end
end


