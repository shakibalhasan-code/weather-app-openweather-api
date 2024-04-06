import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/constant/constant.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/widget/weather_details.dart';

void main(){
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {

  final weatherData;
  const HomeScreen({super.key, this.weatherData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double temperature = 0.0;
  double minTemperature = 0.0;
  double maxTemperature = 0.0;
  double windSpeed = 0.0;
  int humidity = 50;
  String cityName = 'loading';
  String description = 'loading';


  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);

  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temperature = weatherData['main']['temp'];
      minTemperature = weatherData['main']['temp_min'].toDouble();
      maxTemperature = weatherData['main']['temp_max'].toDouble();
      windSpeed = weatherData['wind']['speed'].toDouble();
      humidity = weatherData['main']['humidity'];
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];

    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fill
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: padding.top+20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.50),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.my_location,color: Colors.black,size: 18),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.50),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.search_rounded,color: Colors.black,size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                  child:
                  Column(
                    children: [
                      Text(cityName, style:commonTextStyle ),
                      Text('${temperature.toInt()}°', style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'SFPRO',
                          color: Colors.white
                      ),),
                      Text(description, style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'SFPRO',
                          fontSize: 20
                      ),),
                      SizedBox(height: 20,),

                    ],
                  )
              ),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade100.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text('Weather Today',style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'SFPRO',
                            fontWeight: FontWeight.w500
                        ),),
                        const SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ConditionRow(
                                    icon: 'assets/ic_temp.png',
                                    title: 'Min Temp',
                                    value: '$minTemperature°',
                                  ),
                                ),
                                Expanded(
                                  child: ConditionRow(
                                    icon: 'assets/ic_wind_speed.png',
                                    title: 'Wind Speed',
                                    value: '${windSpeed.toStringAsFixed(1)} Km/h',
                                  ),
                                ),
                                Expanded(
                                  child: ConditionRow(
                                    icon: 'assets/ic_temp.png',
                                    title: 'Max Temp',
                                    value: '$maxTemperature°',
                                  ),
                                ),
                                Expanded(
                                  child: ConditionRow(
                                    icon: 'assets/ic_humidity.png',
                                    title: 'Humidity',
                                    value: '$humidity%',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              )
            ],
          ),
        ),
      )

    );
  }
}



class PcScreen extends StatelessWidget {
  const PcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery
        .of(context)
        .padding;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fill
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Expanded(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dhaka', style:commonTextStyle ),
                    Text('19', style: TextStyle(
                        fontSize: 70,
                        fontFamily: 'SFPRO',
                        color: Colors.white
                    ),),
                    Text('Mostly Clear', style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'SFPRO',
                        fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Image(
                        height: 150,
                        image: AssetImage('assets/weatherPrecipitation.png',))
                  ],
                )
            ),
            Expanded(
                child:Padding(
                  padding: EdgeInsets.only(left: 15,right: 15,bottom: padding.bottom),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              child: Container(
                                width: 70,
                                height: 6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text('Weather Today',style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'SFPRO',
                              fontWeight: FontWeight.w500
                          ),),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white
                              ),
                              child: Row(
                                children: [
                                  Expanded(child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.water_drop_outlined,color: Colors.indigo,),
                                      Text('12.99',style: TextStyle(
                                          color: Colors.indigo
                                      ),)
                                    ],
                                  ),),
                                  Expanded(child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.umbrella_rounded,color: Colors.indigo,),
                                      Text('12.99',style: TextStyle(
                                          color: Colors.indigo
                                      ),)
                                    ],
                                  ),),
                                  Expanded(child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.air,color: Colors.indigo,),
                                      Text('12.99',style: TextStyle(
                                          color: Colors.indigo
                                      ),)
                                    ],
                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

