require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================
    latitude = @lat
    longitude = @lng


    url= "https://api.darksky.net/forecast/8c1aa49e889d38aac8ccb433b2791c53/" + latitude.to_s + "," + longitude.to_s
   parsed_data = JSON.parse(open(url).read)
   degreesF= parsed_data["currently"]["temperature"]
   summary= parsed_data["currently"]["summary"]


   @current_temperature = degreesF

   @current_summary = summary

   @summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]

   @summary_of_next_several_hours = parsed_data["hourly"]["summary"]

   @summary_of_next_several_days = parsed_data["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
