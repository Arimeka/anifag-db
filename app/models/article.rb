# coding: utf-8
# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  title       :string(255)      not null
#  description :text             not null
#  permalink   :string(255)      not null
#  source      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :content, :description, :permalink, :source, :title

  include Tire::Model::Search
  include Tire::Model::Callbacks

  validates :title, :content, :description, :permalink, :source, 
                                                        presence: true
  validates :source, allow_blank: true, format: {
    with:    %r{^((http|https):\/\/)*[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$}ix,
    message: 'не соответствует формату URL.'
  }

   default_scope order("created_at DESC")

  def to_param
    "#{id}-#{permalink}"
  end

  def self.search(params)
    tire.search(page: params[:page]) do
      query { string params[:query]} if params[:query].present?
      sort { by :created_at, 'desc' }
    end
  end
end