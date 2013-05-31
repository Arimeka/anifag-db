# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :title

  has_many :articles_categories, dependent: :destroy
  has_many :articles, through: :articles_categories

  validates :title, :name, presence: true
end
