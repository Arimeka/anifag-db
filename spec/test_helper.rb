def clear_article_index
  Article.tire.index.delete
  Article.tire.index.create(:mappings => Article.tire.mapping_to_hash)
  Article.tire.index.refresh
end