
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather/new/weather_service.dart';


  class DrawerCard extends StatefulWidget {
  const DrawerCard({super.key});

  @override
  State<DrawerCard> createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> {

  
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
    return Drawer(
        backgroundColor: HexColor('333739'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:10,bottom: 10),
                    alignment: Alignment.centerRight,
                    child: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30.0,
                    ),
                  ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Text(
                              'Favorite location',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                       
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ],
                    ),
                  
                  Expanded(
                    child: Row(
                        children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    Text(
                                      'El Hay El Asher',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/moon.png',
                                height: 30.0,
                                width: 30.0,
                              ),
                       
                              Text(
                                '${(temperature - 273.15).round().toString()} \u2103',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                  
                ],
              ),
            ),
                    Divider(color: const Color.fromARGB(255, 30, 25, 25),),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_location_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Other locations',
                          style: TextStyle(
                           fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Text(
                          'Saint Cathrine',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                      
                  
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/moon.png',
                           height: 30.0,
                                width: 30.0,
                          ),
                   
                          Text(
                           '20\u2103', style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromARGB(255, 163, 158, 158),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey[700],
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Manage location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                    Divider(color: const Color.fromARGB(255, 30, 25, 25),),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 25.0,
                        ),
                       
                        Text(
                          'Report wrong location',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.headset_mic_outlined,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Contact us',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ;
  }
}


