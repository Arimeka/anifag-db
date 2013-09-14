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
#  user_id     :integer
#  main_image  :string(255)
#

class Article < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  
  attr_accessible :content, :description, :permalink, :source, :title,
                  :tag_list, :main_image, :category_ids, :tags
  acts_as_taggable

  include Tire::Model::Search
  include Tire::Model::Callbacks

  index_name("#{Rails.env}-articles")

  belongs_to :user
  
  has_many :articles_categories, dependent: :destroy
  has_many :categories, through: :articles_categories

  validates :title, :content, :description, :permalink, presence: true
  validates :source, allow_blank: true, format: {
    with:    %r{^((http|https):\/\/)*[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$}ix,
    message: 'не соответствует формату URL.'
  }

  before_save :sanitize_content

  default_scope order("created_at DESC")

  def to_param
    "#{id}-#{permalink}"
  end

  self.per_page = 10

  def self.search(params)
    tire.search(page: params[:page]) do
      query { string params[:query]} if params[:query].present?
      sort { by :created_at, 'desc' }
    end
  end

  tire.mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
    indexes :content,      :analyzer => 'snowball'
    indexes :description,  :analyzer => 'snowball'
    indexes :created_at,   :type => 'date', :include_in_all => false
  end

  private
    def sanitize_content
      if self.content
        check_css = lambda do |env|
                            node      = env[:node]
                            node_name = env[:node_name]
                            # Don't continue if this node is already whitelisted or is not an element.
                            return if env[:is_whitelisted] || !node.element?
                            parent = node.parent
                            return unless node_name == 'style' || node['style']
                            if node_name == 'style'
                              unless good_css? node.content
                                node.unlink
                                return
                              end
                            else
                              unless good_css? node['style']
                                node.unlink
                                return
                              end
                            end
                            {:node_whitelist => [node]}
                          end
                          
        video_emb = lambda do |env|
                        node      = env[:node]
                        node_name = env[:node_name]
                                          
                        return if env[:is_whitelisted] || !node.element?
                                          
                        return unless node_name == 'iframe' || 
                                      node_name == 'object' || 
                                      node_name == 'param'  || 
                                      node_name == 'embed'
                                          
                        return unless node['src'] =~ /\Ahttps?:\/\/(?:www\.)?(youtube(?:-nocookie)?\.com)|(ustream\.tv)|(vimeo\.com)\//
                      
                        Sanitize.clean_node!(node, {
                          :elements => %w[iframe object param embed],
                      
                          :attributes => {
                            'iframe'  => %w[allowfullscreen frameborder height src width webkitallowfullscreen mozallowfullscreen],
                            'object' => %w[width height],
                            'param' => %w[name value],
                            'embed' => %w[src type allowfullscreen allowScriptAccess width height],
                          }
                        })

                        {:node_whitelist => [node]}
                      end
                          
        self.content = Sanitize.clean(self.content, :elements => ['p', 'blockquote', 'pre', 'h3', 'h4', 'h5', 'h6',
                                              'b', 'i', 'strike', 'ul', 'li', 'span', 'ol',
                                              'img', 'br', 'table', 'tbody', 'thead', 'tr', 
                                              'td', 'th', 'caption', 'a', 'font', 'hr', 'div'],
                                :attributes => {
                                                'a'  => ['href', 'title', 'target'],
                                                'font' => ['color'],
                                                'img' => ['border', 'height', 'src', 'width']
                                                },
                                :transformers => [check_css, video_emb])
      end    
    end
end
