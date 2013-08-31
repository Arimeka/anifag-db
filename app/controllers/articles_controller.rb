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
    authorize_action_for article
    if article.save
      redirect_to article
    else
      render :new
    end
  end

  def edit
    authorize_action_for article
  end

  def update
    authorize_action_for article
  end

  def destroy
    authorize_action_for article
  end
end
