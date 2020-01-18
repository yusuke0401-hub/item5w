class ToppagesController < ApplicationController
  def index
    @items = Item.order('updated_at DESC').page(params[:page]).per(6)
  end
end
