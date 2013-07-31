class ArticleAuthorizer < ApplicationAuthorizer

  def self.default(adjective, user)
    true
  end

  def self.updatable_by?(user)
    resource.author == user || user.has_role?(:editor)
  end

  def self.creatable_by?(user)
    user.has_role?(:writer)
  end

  def self.deletable_by?(user)
    resource.author == user || user.has_role?(:editor)
  end
end