class DetailsController < ApplicationController
  before_action :set_detail, only: [:edit, :update, :destroy]

   def new
    @detail = Detail.new
   end
   
   def create
      
    if detail_create
      flash[:success] = "4wを登録しました。"
      redirect_to item_path(@detail.item_id)
    else
      flash.now[:danger] = "4wの登録に失敗しました。"
      render 'new'
    end
   end
   
   def edit
   end
   
   def update
    if @detail.update(detail_params)
      flash[:success] = "4wの編集が完了しました。"
      redirect_to item_path(@detail.item_id)
    else
      flash.now[:danger] = "4wの編集に失敗しました。"
      render 'edit'
    end
   end
   
   def destroy
     @detail.destroy
     flash[:success] =  '詳細(番号)を削除しました。'
     redirect_back(fallback_location: item_path(@detail.item_id))
   end 
   
   private
    
   def detail_params
    params.require(:detail).permit(:purchase_date, :place, :person, :reason)
   end
   
   def set_detail
    @detail = Detail.find(params[:id])
   end
   
  def detail_create
    item = Item.find_by(id: params[:id])
    
    unless item.nil? 
      @detail = item.details.build(detail_params)
      @detail.save
      return true
    else
      return false
    end
  end
end
