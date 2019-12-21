class TiketsController < ApplicationController
  def index
    @tikets = Tiket.all
  end

  def show
    @tiket = Tiket.find(params[:id])
  end
end
