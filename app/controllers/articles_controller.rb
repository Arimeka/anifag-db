# coding: utf-8
class ArticlesController < ApplicationController
  expose(:articles) { Article.paginate(page: params[:page]) }
  expose(:article) { params[:id] ? Article.find(params[:id]) : Article.new(params[:article]) }

  def index
  end

  def show
  end
end
