def clear_article_index
  Article.tire.index.delete
  Article.tire.index.create
  Article.tire.index.refresh
end