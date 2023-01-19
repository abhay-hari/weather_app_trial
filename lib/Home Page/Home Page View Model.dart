import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_trial/Home%20Page/Home%20Page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


abstract class HomePageViewModel extends State<HomePage> {
  void initState() {
    getCurrentLocation();
    DateFormat.yMMMEd().format(DateTime.now());
    super.initState();
  }

  String domain = "https://api.openweathermap.org/data/2.5/weather?";
  String apiKey = "8d796edef50dd59e2f79071cdb3abe89";

  bool isLoaded = false;
  num temp = 0;
  num pressure = 0;
  num humidity = 0;
  num windSpeed = 0;
  num minTemp = 0;
  num maxTemp = 0;
  String cityName = '';
  TextEditingController cityController = TextEditingController();


  Future<String?> openDialoge() =>
      showDialog<String>(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(" Enter a city",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'Poppins-Medium.ttf',
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                ),
              ),
              backgroundColor: Color(0xff0c171c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              content:
              TextFormField(
                autofocus: true,
                controller: cityController,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    border: InputBorder.none
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0c171c),),
                  onPressed: () {
                    setState(() {
                      cityName = cityController.text;
                      getCityWether(cityName);
                      isLoaded = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'Poppins-Thin.ttf',
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                    ),
                  ),)
              ],
            ),
      );


  getCurrentLocation() async {
    var p = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true,
    );
    if (p != null) {
      getCurrentCityWhether(p);
      print(DateFormat.yMMMd().format(DateTime.now()));
    } else {
      print('Data unavailable');
    }
  }

  getCurrentCityWhether(Position position) async {
    var client = http.Client();
    var uri =
        "${domain}lat=${position.latitude}&lon=${position
        .longitude}&appid=${apiKey}";
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      updateUI(decodedData);
      setState(() {
        isLoaded = true;
      });
    } else {
      print(response.statusCode);
    }
  }

  getCityWether(String cityName) async {
    var client = http.Client();
    var uri = "${domain}q=$cityName&appid=${apiKey}";
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      updateUI(decodedData);
      setState(() {
        isLoaded = true;
      });
    } else if (response.statusCode == 404) {
      setState(() {
        isLoaded = true;
      });
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return Text("Error");
      })));
    } else {
      print(response.statusCode);
    }
  }

  updateUI(var data) {
    setState(() {
      if (data == null) {
        temp = 0;
        pressure = 0;
        humidity = 0;
        windSpeed = 0;
        minTemp = 0;
        maxTemp = 0;

        cityName = 'Not Available';
      } else {
        temp = data['main']['temp'] - 273;
        pressure = data['main']['pressure'] - 273;
        humidity = data['main']['humidity'];
        windSpeed = data['wind']['speed'];
        minTemp = data['main']['temp_min'] - 273;
        maxTemp = data['main']['temp_max'] - 273;
        cityName = data['name'];
      }
    });
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }
}
