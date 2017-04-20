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
url = "https://api.darksky.net/forecast/d19ef5664f3c56194d73d454f4afb89b/#{@lat},#{@lng}"
parsed_data = JSON.parse(open(url).read)


temperature = parsed_data["currently"]["temperature"]
   summarycurrent = parsed_data["currently"]["summary"]
   summarynextsixtyminutes = parsed_data["minutely"]["summary"]
   summarynextseveralhours = parsed_data["hourly"]["summary"]
   summarynextseveraldays = parsed_data["daily"]["summary"]


@current_temperature = temperature

@current_summary = summarycurrent

@summary_of_next_sixty_minutes = summarynextsixtyminutes

@summary_of_next_several_hours = summarynextseveralhours

@summary_of_next_several_days = summarynextseveraldays



    render("forecast/coords_to_weather.html.erb")
  end
end
