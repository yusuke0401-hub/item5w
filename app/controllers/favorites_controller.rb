class FavoritesController < ApplicationController
  def create
  @item = Item.find_or_initialize_by(code: params[:item_code])
  #initialize_by = 見つからなかった場合Item.newする
    
  unless @item.persisted?
  #すでに保存されてあるか確認
    results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
    @item = Item.new(read(results.first))
    @item.save
  end
    current_user.like(@item)
    flash[:success] = '商品を Like しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    current_user.unlike(@item)
    flash[:success] = '商品の Like を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
