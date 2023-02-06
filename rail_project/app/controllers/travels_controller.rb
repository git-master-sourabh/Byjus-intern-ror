class TravelsController < ApplicationController
  def index
  end

  def search
      cities= find_city(params[:city])
    unless cities
      flash[:alert] = 'city not found'
      return render action: :index
    end
    @city = cities.first
   

  end

   
# app/controllers/travel_controller.rb
  private

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        # 'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
        'X-RapidAPI-Key' => 'a2225d202emsh9fe647a7b55bdabp15231ajsn33bc7fa46ffe'
      }
    )

    return nil if response.status != 200

    JSON.parse(response.body)
  end

  def find_city(name)
    request_api(
      "https://hotels4.p.rapidapi.com/locations/search/?query=#{URI.encode(name)}"
    )
  end



end
