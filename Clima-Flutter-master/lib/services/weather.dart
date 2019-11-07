import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '3b185137dbb530f164db160da3c16fa0';
const endpoint = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCurrentWeather({city: null}) async {
    String url = '';

    if (city == null) {
      Location location = Location();
      await location.getLocation();
      url =
          '$endpoint?lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey&units=metric';
    } else {
      url = '$endpoint?q=$city&APPID=$apiKey&units=metric';
    }

    NetworkHelper helper = NetworkHelper(url);
    var weatherData = await helper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
