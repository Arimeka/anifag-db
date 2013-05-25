class StaticPagesController < ApplicationController
  expose(:articles) { Article.limit(3) }

  def home
  end
end
