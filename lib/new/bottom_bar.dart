import 'package:flutter/material.dart';
import 'package:weather/new/weather_service.dart';

class bottom_bar extends StatefulWidget {
  const bottom_bar({super.key});

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
   Config config = Config();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    config = Config();
    getData();
  }
  
  var humidity = 70;
  double wind = 10;
Future getData() async {
    final data = await config.fetchWeatherData();
    // print(data['list']);
    setState(() {

      wind = data['list'][10]['wind']['speed'];
      humidity = data['list'][0]['main']['humidity'];

    });
  
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/uv-index.png',
                                              height: 40.0,
                                              width: 40.0,
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                              'UV index',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '     High',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/wind.png',
                                              height: 40.0,
                                              width: 40.0,
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                              'Wind',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '${wind} km/h',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              'assets/images/humidityy.png',
                                              height: 40.0,
                                              width: 40.0,
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '${humidity}%',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                      ]);
  }
}