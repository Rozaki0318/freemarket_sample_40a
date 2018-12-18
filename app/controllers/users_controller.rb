class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def choice
    render layout: 'layout_content'
  end

  def logout
  end

end
