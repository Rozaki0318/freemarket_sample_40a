class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    render layout: 'layout_content'
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path

  end

  def show
  end

  private
  def item_params
    # params.require(:item).require(:images_attributes).require(:"0")[:image]
    # params.require(:item)[:images_attributes] = params.require(:item).require(:images_attributes).require(:"0")[:image]
    params.require(:item).permit(:name, :description, :price, :condition, :shipping_from, :shipping_date, :shipping_fee, :shipping_way, images_attributes: [:image]).merge(user_id: current_user.id)
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end




# params.require(:item).require(:images_attributes).require(:"0")[:image][i]




end
