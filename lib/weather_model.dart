class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var windDir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var lastUpdate;

  Weather(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.gust,
      required this.humidity,
      required this.lastUpdate,
      required this.pressure,
      required this.pricipe,
      required this.temp,
      required this.uv,
      required this.wind,
      required this.windDir});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["location"]["name"];
    icon = json["current"]["condition"]["icon"];
    condition = json["current"]["condition"]["text"];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    windDir = json['current']['wind_dir'];
    pressure = json['current']['pressure_mb'];
    pricipe = json['current']['precip_mm'];
    lastUpdate = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']["uv"];
    
  }
}
