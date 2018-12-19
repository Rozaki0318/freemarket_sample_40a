class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    render layout: 'layout_content'
  end

  def create
    Item.create(name: item_params[:name], description: item_params[:description], price: item_params[:price], condition: item_params[:condition], shipping_from: item_params[:shipping_from], shipping_date: item_params[:shipping_date], shipping_fee: item_params[:shipping_fee], shipping_way: item_params[:shipping_way], user_id: current_user.id)
  end

  def show
  end

  private
  def item_params
    params.permit(:name, :description, :price, :condition, :shipping_from, :shipping_date, :shipping_fee, :shipping_way)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
