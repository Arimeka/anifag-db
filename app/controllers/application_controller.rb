class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def advanced_search(query, options={})
      str = query if query.present?
      fields = params[:search_in].keys if params[:search_in]

      search = Tire.search ["#{Rails.env}-articles"] do
        query { string str, fields: fields } if str
        sort { by options[:sort_by] || 'created_at', options[:sort_direction] || 'desc' }
        filter :term, '_type' => options[:type] if options[:type]
        page = (options[:page] || 1).to_i
        search_size = options[:per] || 10
        from (page -1) * search_size
        size search_size
      end

      search.results
    end
end
