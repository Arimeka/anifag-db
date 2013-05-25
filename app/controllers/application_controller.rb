class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def advanced_search(query,page)
      str = query if query.present?
      size = 10
      from = page ? (page.to_i * size) - 1 : 0

      search = Tire.search ["#{Rails.env}-articles"], from: from, size: size do
        query { string str } if str
        sort { by :created_at, 'desc' }
      end

      search.results
    end
end
