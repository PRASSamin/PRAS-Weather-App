import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Error extends StatefulWidget {
  const Error({super.key});

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {

    Map<dynamic, dynamic>? userSearch = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;


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
                margin: EdgeInsets.fromLTRB(
                  25, 20, 25, 0
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
                        if ((textSearch.text).replaceAll(" ", "") == "") {
                          print("null");
                        } else {
                          Navigator.pushReplacementNamed(context, "/loading",
                              arguments: {
                                "userSearch": textSearch.text,
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
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  height: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network('https://openweathermap.org/img/wn/10n@4x.png'),
                            Text(
                              "City Not Found",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 15, left: 5),
                                child: Text(
                                  'The city you searched for could not be found',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 186, 186, 186),
                                    fontSize: 18,
                                  ),
                                ))
                          ],
                        ),
                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/loading");
                  },
                  child: Icon(Icons.arrow_back),
                  elevation: 0,
                  hoverColor: Colors.transparent,
                  backgroundColor: Color.fromARGB(255, 43, 65, 98),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
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
                            color: Color.fromARGB(255, 168, 168, 168),
                            fontSize: 12),
                      ),
                    ),
                    Container(
                        child: Text(
                      "Data provided by OpenWeatherMap",
                      style: TextStyle(
                          color: Color.fromARGB(255, 168, 168, 168),
                          fontSize: 12),
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
