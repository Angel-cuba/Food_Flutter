class Weather {
  final String? name;
  final String? main;
  final String? weather;
  final String? wind;
  Weather({
    this.weather,
    this.name,
    this.main,
    this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      weather: json['weather'],
      main: json['main'],
      wind: json['wind'],
    );
  }

  // static List<Weather> WeathersFromSnapshot(List snapshot) {
  //   return snapshot.map((data) {
  //     return Weather.fromJson(data);
  //   }).toList();
  // }
}
