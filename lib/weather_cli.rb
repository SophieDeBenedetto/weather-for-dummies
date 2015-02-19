require_relative './forecast.rb'
require_relative './get_dressed.rb'
class WeatherCLI

  attr_accessor :state, :city

  def run
    welcome
    puts "Let's get some info from you first."
    get_location
    GetDressed.new.call(state, city)

  end

  def welcome
    puts "Hey Noah. Don't worry, I'll tell you exactly what to wear today--you don't even have to look out of your window."
  end

  def get_location
    puts "What state are you in?"
    @state = gets.strip
    # binding.pry
    puts "What city are you in?"
    @city = gets.strip.gsub(" ", "_")
  end




end