# == Schema Information
#
# Table name: articles_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ArticlesCategory < ActiveRecord::Base
  attr_accessible :category_id

  belongs_to :article
  belongs_to :category
end
