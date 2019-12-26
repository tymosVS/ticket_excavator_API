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
    gon.points = @tiket[:dig_site_info].match(reg_coordinates)[:points].split(',').map do |point|
      point.split(' ')
    end
  end
end
