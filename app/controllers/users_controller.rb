class UsersController < ApplicationController

  before_action :redirect_to_choice, :except => [:choice]
  
  def choice
    render layout: 'layout_content'
  end

  def logout
  end

  def show
    user = User.find(show_params[:id])
    @nickname = user.nickname
  end

  private
  def redirect_to_choice
    user = User.find(show_params[:id])
    redirect_to :action => "choice" unless user.id == current_user.id
  end

  def show_params
    params.permit(:id)
  end

end
