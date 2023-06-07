
import 'package:flutter/material.dart';
import 'package:weather/new/weather_service.dart';

class daysWidget extends StatefulWidget {
  const daysWidget({key}) : super(key: key);
  @override
  State<daysWidget> createState() => _daysWidgetState();
}

class _daysWidgetState extends State<daysWidget> {
  Config config = Config();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    config = Config();
  }


  List days = ['Saturday', 'Sunday', 'Monday', 'Tuesday'];
  List humidityList = [];
  List temp_min = [];
  List temp_max = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: config.fetchWeatherData(),
        builder: (context, snapshot) {
          
          if (snapshot.hasData && snapshot.data != null) {
            final dataList = snapshot.data['list'];
            for (final data in dataList) {
              humidityList.add(data['main']['humidity']);
              temp_min.add(data['main']['temp_min']);
              temp_max.add(data['main']['temp_max']);

            }
            return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final Document = snapshot.data['list'][index];
                  // print('data is $data');
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${days[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                height: 15,
                                width: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${humidityList[index]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/full-moon.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/images/moon.png',
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '${(temp_min[index] - 273.15).round().toString()} \u2103',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              "/",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Text(
                            '${(temp_max[index] - 273.15).round().toString()} \u2103',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
