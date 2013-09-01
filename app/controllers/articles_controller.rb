# coding: utf-8
class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  authorize_actions_for Article, except: [:index, :show]

  expose(:articles) { Article.paginate(page: params[:page]) }
  expose(:article) { params[:id] ? Article.find(params[:id]) : current_user.articles.build(params[:article]) }

  def index
  end

  def show
  end

  def new
  end

  def create
    authorize_action_for article
    if article.save
      flash[:success] = t('messages.saved')
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
    puts params[:article]
    if article.update_attributes(params[:article])
      flash[:success] = t('messages.saved')
      redirect_to article
    else
      render :edit
    end
  end

  def destroy
    authorize_action_for article
  end
end
