require_relative './forecast.rb'

class GetDressed

  def get_forecast(state, city)
    Forecast.new.call(state,city)
  end

  def reccomend(state, city)
    get_forecast(state, city)
    
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

  def call(state, city)
    reccomend(state,city)
  end


end