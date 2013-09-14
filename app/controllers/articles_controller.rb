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
      if params[:commit] == t('form.save_and_exit')
        redirect_to article
      else
        redirect_to edit_article_path article
      end
    else
      @errors = article.errors.full_messages
      flash[:error] = t("messages.save_error")
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
      if params[:commit] == t('form.save_and_exit')
        redirect_to article
      else
        redirect_to edit_article_path article
      end
    else
      @errors = article.errors.full_messages
      flash[:error] = t("messages.save_error")
      render :edit
    end
  end

  def destroy
    authorize_action_for article
  end
end
