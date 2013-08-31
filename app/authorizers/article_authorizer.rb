class ArticleAuthorizer < ApplicationAuthorizer

  def self.default(adjective, user)
    true
  end

  def updatable_by?(user)
    resource.user == user || user.has_role?(:editor)
  end

  def self.creatable_by?(user)
    user.has_role?(:writer)
  end

  def deletable_by?(user)
    resource.user == user || user.has_role?(:editor)
  end
end