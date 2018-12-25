class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).limit(8)
    # @item = @items.find(47)
    @images = Image.includes(:item)
    @image = @images.find(35)
    # @images = Image.includes(:item)
  end

  def new
    @large_categories = Category.find_by_sql(['select * from categories where depth is NULL'])
    # @medium_categories = Category.find_by_sql(['select * from categories where depth regexp "^[0-9]+$" '])
    # @small_categories = Category.find_by_sql(['select * from categories where depth regexp ".+/.+" '])
    @item = Item.new
    @item.images.build
    render layout: 'layout_content'
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :size, :category_id, :shipping_from, :shipping_date, :shipping_fee, :shipping_way, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
