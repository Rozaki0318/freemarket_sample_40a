class CategoriesController < ApplicationController
  def index
    @large_categories = Category.find_by_sql(['select * from categories where depth is NULL'])
    @medium_categories = Category.find_by_sql(['select * from categories where depth regexp "^[0-9]+$" '])
    @small_categories = Category.find_by_sql(['select * from categories where depth regexp ".+/.+" '])
  end
end
