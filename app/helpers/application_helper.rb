module ApplicationHelper
  def main_image_url(url, style = :thumb)
    case style
    when :large
      url.sub!(/\/(thumb|large|original)\//, '/large/')
    when :original
      url.sub!(/\/(thumb|large|original)\//, '/original/')
    else
      url.sub!(/\/(thumb|large|original)\//, '/thumb/')
    end
    url
  end
end
