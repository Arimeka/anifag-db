# coding: utf-8
class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  authorize_actions_for Article, except: [:index, :show]

  expose(:articles) { Article.paginate(page: params[:page]) }
  expose(:article) { params[:id] ? Article.find(params[:id]) : Article.new(params[:article]) }

  def index
  end

  def show
  end

  def new
  end

  def create
    if article.save
      redirect_to article
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
