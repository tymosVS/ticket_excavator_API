class TiketsController < ApplicationController
  before_action :mapbox_key, only: [:show]

  def index
    @tikets = Tiket.all
  end

  def show
    @tiket = Tiket.find(params[:id])
    dig_site_info
  end

  private

  def mapbox_key
    gon.map = ENV['MAPBOX_KEY']
    
  end

  def dig_site_info
    gon.points = @tiket[:dig_site_info].match(/\((?<points>(\-?\d+(\.\d+)?\s\-?\d+(\.\d+)?(\,)?)+)/)[:points].split(',').map { |a| a.split(' ') }
  end
end
