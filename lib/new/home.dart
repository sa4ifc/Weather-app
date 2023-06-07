import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/new/days.dart';
import 'package:weather/new/drawer.dart';
import 'package:weather/new/weather_service.dart';
import 'package:weather/new/bottom_bar.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Config config = Config();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    config = Config();
    getData();
  }

  double temperature = 307.73;
  double temp_min = 307.73;
  double temp_max = 307.73;
 
 
  Future getData() async {
    final data = await config.fetchWeatherData();
    // print(data['list']);

    setState(() {
      temperature = data['list'][0]['main']['temp'];
      temp_min = data['list'][0]['main']['temp_min'];
      temp_max = data['list'][0]['main']['temp_max'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         
        ),
        drawer: DrawerCard(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "${(temperature - 273.15).round().toString()} \u2103",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(100, 0),
                      child: Lottie.asset(
                        'assets/images/data.json',
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text(
                      'Al Hay Al Asher',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  ' ${(temp_min - 273.15).round().toString()} \u2103 /${(temp_min - 273.15).round().toString()} \u2103 Feels like ${(temp_min - 273.15).round().toString()} \u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                              ),
                              Container(
                                child: Text(
                                   DateTime.now().hour > 12 ? '${DateTime.now().hour - 12}:${DateTime.now().minute} pm' : '${DateTime.now().hour}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: 120,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${temps[index]['temp']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        CircleAvatar(
                                          radius: 10.0,
                                          child: Image.asset(
                                            '${temps[index]['img']}',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          '${temps[index]['time']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/humidity.png',
                                              height: 10.0,
                                            ),
                                            Text(
                                              '${temps[index]['temp']}%',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10.0,
                                ),
                                itemCount: temps.length,
                              ),
                            ),
                          ),
                        ),
                      ), //list1
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Today\'s Tempature',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Expect the same as yesterday',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                            ),
                            child: Container(
                                width: double.infinity,
                                height: 210,
                                alignment: Alignment.topLeft,
                                child: daysWidget())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' Sunrise',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '5:21 am',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Image.asset(
                                            'assets/images/sunrise (2).png',
                                            height: 90.0,
                                            width: 90.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ' Sunset',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '6:36 pm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Image.asset(
                                            'assets/images/sunset.png',
                                            height: 90.0,
                                            width: 90.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: bottom_bar(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //list2
            ],
          ),
        ));
  }

  List temps = [
    {
      "img": "assets/images/full-moon.png",
      "time": '3 pm',
      "temp": ' 34°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '4 pm',
      "temp": ' 34°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '5 pm',
      "temp": ' 33°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '6 pm',
      "temp": ' 33°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '7 pm',
      "temp": ' 32°',
    },
    {
      "img": 'assets/images/moon.png',
      "time": '8 pm',
      "temp": ' 31°',
    },
    {
      "img": 'assets/images/moon.png',
      "time": '9 pm',
      "temp": ' 22°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '10pm',
      "temp": ' 20°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '11 pm',
      "temp": '18°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '1 am',
      "temp": '15°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '2 am',
      "temp": '15°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '3 am',
      "temp": '12°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '4 am',
      "temp": '12°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '5 am',
      "temp": '10°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '7 am',
      "temp": ' 12°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '8 am',
      "temp": '15°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '9 am',
      "temp": '17°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '10 am',
      "temp": '19°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '11 am',
      "temp": '25°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '12 pm',
      "temp": '25°',
    },
    {
      "img": "assets/images/full-moon.png",
      "time": '1 pm',
      "temp": '27°',
    },
    {
      "img": "assets/images/moon.png",
      "time": '2 pm',
      "temp": '30°',
    }
  ];
}
