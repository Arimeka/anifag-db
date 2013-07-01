class CategoriesController < ApplicationController
  expose(:category) { Category.find(params[:id]) }
  expose(:articles) { category.articles.paginate(page: params[:page]) }

  def show
  end
end
