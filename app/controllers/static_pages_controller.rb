class StaticPagesController < ApplicationController
  expose(:articles) { Article.limit(3) }
  expose(:results) { advanced_search(params[:query],params[:page]) }

  def home
  end

  def search
  end
end
