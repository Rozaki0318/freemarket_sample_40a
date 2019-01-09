class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(16)
    ids = Order.pluck(:item_id)
    @items = items.where.not(id: ids)
    $search = Item.ransack(params[:q])
  end

  def new
    @large_categories = Category.find_by_sql(['select * from categories where depth is NULL'])
    @item = Item.new
    @item.images.build
    render layout: 'layout_content'
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :action => "new", :layout => "layout_content"
    end
  end

  def show
    gon.address = current_user.address.present?
    @ids = Order.pluck(:item_id)
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item.id)
    @small_category = @item.category

    if @item.category.depth.include?("/")
      @small_category_depth = @item.category.depth.split("/").last.to_i
      @medium_category = Category.find(@small_category_depth)
      @large_category = Category.find(@medium_category.depth)
    else
      @medium_category = Category.find(@item.category_id) #中カテどまりの商品
      @large_category = Category.find(@medium_category.depth)
    end

    @items = Item.where(user_id: @item.user_id).where.not(id: @item.id).limit(6) # 同じ出品者の商品
    @comments = @item.comments
    @comment = Comment.new
  end

  def option
    @item = Item.find(params[:id])
    @comments = @item.comments
    @comment = Comment.new
  end

  def destroy
    @item = Item.find(params[:id])
    # if @item.user_id == current_user.id
      if @item.destroy
        redirect_to items_path
      else
        redirect_to  option_item(@item)
      end
    # end
  end

  def edit
    @item = Item.find(params[:id])
    @default_category = @item.category
    @default_size = @item.size
    @item.brand == nil ? @default_brand = "" : @default_brand = @item.brand.name
    @depth = @default_category.depth.split("/")
    render layout: 'layout_content'
  end

  def update
    @item = Item.find(params[:id])
    # if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to items_path
      else
        redirect_to edit_item_path(@item)
      end
    # end
  end

  def search
    @search = Item.ransack(params[:q])
    @result = @search.result
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :category_id, :size_id, :brand_id, :shipping_from, :shipping_date, :shipping_fee, :shipping_way, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
