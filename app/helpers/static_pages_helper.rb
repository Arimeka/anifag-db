module StaticPagesHelper
  def get_image(html)
    doc = Nokogiri::HTML(html)
    unless doc.search('img').empty?     
      doc.search('img').first['src']
    else
      nil
    end
  end
end
