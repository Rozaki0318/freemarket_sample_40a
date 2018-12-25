class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.json{ @m_cate = @categories.where('depth = ?', "#{params[:id]}")} if params[:id].present?
      format.json{ @s_cate = @categories.where('depth LIKE(?)', "%/#{params[:key]}")} if params[:key].present?
    end
  end
end
