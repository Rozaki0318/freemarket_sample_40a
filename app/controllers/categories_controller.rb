class CategoriesController < ApplicationController
  def index
  end

  def select_top
    respond_to do |format|
      format.json{ @m_cate = Category.where('depth = ?', "#{params[:id]}")} if params[:id].present?
    end
  end

  def select_mid
    respond_to do |format|
      format.json{ @s_cate = Category.where('depth LIKE(?)', "%/#{params[:id]}")} if params[:id].present?
    end
  end

end
