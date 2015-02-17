require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

  SCRAPER_URL = 'http://www.weather.com/weather/today/l/USNY0998:1:US'

  def initialize
    @html = html
    # @weather_index = weather_index
  end

  def html
    @html ||= open(SCRAPER_URL)
  end

  def weather_index
    @weather_index ||= Nokogiri::HTML(html)
  end

end

# weather = Scraper.new
#     binding.pry