# coding: utf-8
class StaticPagesController < ApplicationController
  expose(:articles) { Article.limit(3) }
  expose(:results) { advanced_search(params[:query],page: params[:page], 
                                     type: params[:type],sort_by: params[:sort_by],
                                     sort_direction: params[:sort_direction]) }

  def home
  end

  def search
    @sort_by = {'По релевантности' => '_score', 'По дате создания' => 'created_at'}
    @sort_direction = {'По возрастанию' => 'asc', 'По убыванию' => 'desc'}
  end
end
