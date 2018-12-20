class CategoriesController < ApplicationController
  def index
    @large_category = Category.find_by_sql(['select * from categories where depth is NULL'])

    @medium_category = Category.find_by_sql(['select * from categories where depth regexp "^[0-9]+$" '])

    @small_category = Category.find_by_sql(['select * from categories where depth regexp ".+/.+" '])
  end
end
