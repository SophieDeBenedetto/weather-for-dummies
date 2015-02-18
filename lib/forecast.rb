require 'open-uri'
require 'json'
require 'pry'


require 'pry'
class Forecast

  BASE_URL = "http://api.wunderground.com/api/e3aedba0b8b8d5e5/conditions/q"

  def get_url(state, city)
    "#{BASE_URL}/#{state}/#{city}.json"
  end
  

  def get_json(url)
    JSON.load(open(url))
  end

  
  def get_current_temp(weather_hash)
    temp = weather_hash["current_observation"]["temp_f"]
    # binding.pry
    if temp <= 32
      "cold"
    elsif (33..50).include?(temp)
      "cold-ish"
    elsif (51..65).include?(temp)
      "generally pleasant"
    elsif (65..75).include?(temp)
      "warm"
    else 
      "hot"
    end
  end

  def percipitating? #(weather_hash)
    true
    # percipitation = weather_hash["current_observation"]["weather"]
    # if include?(regex for rain, snow, sleet, hail)
    #   return true, else return false
  end


  def call(state, city)
    report_and_reccomend(state, city)
  end

  def report_and_reccomend(state, city)
    region_url = get_url(state, city)
    weather_hash = get_json(region_url)
    # binding.pry
    @current_temp = get_current_temp(weather_hash)
    @falling_from_the_sky = percipitating? #(weather_hash)
    
    if @falling_from_the_sky && @current_temp == "cold"
      puts "COLD AND MISERABLE. Wear boots, a BIG jacket, a hat, gloves and bring an umbrella."
    elsif @falling_from_the_sky && @current_temp == "cold-ish"
      puts "Miserable but not that cold. Wear rainboots, thick socks, a sweater and a water-proof jacket."
    elsif @falling_from_the_sky && @current_temp == "generally pleasant"
      puts "Water and other stuff is falling from the sky! Bring an umbrella and wear some rainboots."
    elsif @falling_from_the_sky && (@current_temp == "warm" || get_current_temp == "hot")
      puts "Raining. : ( Bring an umbrella!"
    elsif !@falling_from_the_sky && @current_temp == "cold"
      puts "FREEZING. Wear a warm jacket, a hat, gloves and warm boots."
    elsif !@falling_from_the_sky && @current_temp == "cold-ish"
      puts "Pretty cold. Wear a warm jacket and sweater."
    elsif !@falling_from_the_sky && @current_temp == "generally pleasant"
      puts "Generally pleasant. Wear a jacket and a light sweater."
    elsif !@falling_from_the_sky && @current_temp == "warm"
      puts "Beautiful day! Wear a t-shirt and a light sweater."
    elsif !@falling_from_the_sky && @current_temp == "hot"
      puts "HOT AND GROSS. Wear as little clothing as possible."
    end
  end

end




















