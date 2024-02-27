import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    TextEditingController textSearch = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF2B4162),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2B4162), Color(0xFF12100E)])),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if((textSearch.text).replaceAll(" ", "") == "") {
                          print("null");
                        } else {
                        Navigator.pushReplacementNamed(context, "/loading", arguments: {
                          "userSearch" : textSearch.text,
                        });
                        }

                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(2, 0, 8, 0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: textSearch,
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Location",
                        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network("https://openweathermap.org/img/wn/${info['weather_icon']}@2x.png"),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                info["weather_status_description"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "in ${info['loc_value']}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 14, 25, 0),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  height: 220,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          WeatherIcons.thermometer,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              info['temp_value'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 80),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 15, left: 5),
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ))
                          ],
                        ),
                      ]),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(25, 14, 7, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.windy,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(info["wind_value"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                        )),
                                  Text("KM/H",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        )),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(7, 14, 25, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.humidity,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(info["humidity_value"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                        )),
                                  Container(
                                    padding: EdgeInsets.only(top: 10, left: 5),
                                  child: Text("%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        )),
                                        )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Created by Pras",
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 168, 168), fontSize: 12),
                      ),
                    ),
                    Container(
                        child: Text(
                      "Data provided by OpenWeatherMap",
                      style:
                          TextStyle(color: Color.fromARGB(255, 168, 168, 168), fontSize: 12),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
