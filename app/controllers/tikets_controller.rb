# frozen_string_literal: true

# Controller for tickets
class TiketsController < ApplicationController
  before_action :mapbox_key

  def index
    @tikets = Tiket.all
  end

  def show
    @tiket = Tiket.find(params[:id])
    @excavator = @tiket.excavator
    dig_site_info
  end

  private

  def mapbox_key
    gon.map = ENV['MAPBOX_KEY']
  end

  def dig_site_info
    reg_coordinates = /\((?<points>(\-?\d+(\.\d+)?\s\-?\d+(\.\d+)?(\,)?)+)/
    points_list = @tiket[:dig_site_info].match(reg_coordinates)[:points]
    gon.points = points_list.split(',').map do |point|
      point.split(' ')
    end
  end
end
