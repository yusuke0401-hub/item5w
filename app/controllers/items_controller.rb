class ItemsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @items = []
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 30,
      })
 
      results.each do |result|
        item = Item.find_or_initialize_by(read(result))
        @items << item
      end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @fav_users = @item.fav_users
    @details = @item.details
  end
  
end



