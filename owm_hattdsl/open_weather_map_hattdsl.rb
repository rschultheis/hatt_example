
def weather_for city
  owm.get "/data/2.5/weather?q=#{URI.encode(city)}&APPID=#{appid}"
end

def appid
  hatt_configuration['owm_app_id']
end
