class TagsController < ApplicationController
  expose(:articles) { Article.tagged_with(params[:tag]).paginate(page: params[:page]) }

  def show
  end
end
