import 'dart:convert';
import 'package:http/http.dart' as http;

class Config {

Future fetchWeatherData() async {
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=nasr+city&lang=en&appid=b02af426a3fad0d92d3e0b32f9324cf0');
  final response = await http.get(url);
  if(response.statusCode == 200) {
final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data;
  }

  }

  
}

