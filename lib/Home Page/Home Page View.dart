import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Home Page View Model.dart';



class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Weather",
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily:'Poppins-ExtraLight.ttf',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: false,
          body:Container(
            color: Color(0xff0c171c),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40
                  ),
                  child: SizedBox(
                      height: 44,
                      width: 76,
                      child: Text(DateFormat.yMMMEd().format(DateTime.now()),
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily:'Poppins-Medium.ttf',
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 39,
                      left: 21
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(cityName,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily:'Poppins-Medium.ttf',
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final cityName = await openDialoge();
                          if (cityName==null || cityName.isEmpty) return;
                          setState(() {
                            this.cityName = cityName;
                          });
                          openDialoge(); },
                        child: Text("Change City +",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily:'Poppins-Medium.ttf',
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 57,
                      left: 19),
                  child: Row(
                    children: [
                      Container(
                        height: 184,
                        width: 160,
                        decoration: BoxDecoration(
                          color: DateTime.now().hour>6 && DateTime.now().hour<18
                              ?Color(0xff87A2FF)
                              :Color(0xff2E2E31),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              top:15,
                              left: 14,
                              child: Text("Temperature",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 26,
                              left: 14,
                              child: Text('${temp.toInt()} ',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 62,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 36,
                              right: 32,
                              child: Text("°C",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 69,
                                width: 68,
                                decoration: BoxDecoration(
                                    color: DateTime.now().hour>6 && DateTime.now().hour<18
                                        ?Color(0xffE2C529)
                                        :Color(0xffB9B9B9),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        bottomRight: Radius.circular(12)
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 13,
                                    top: 10,
                                  ),
                                  child: Icon(Icons.thermostat,
                                    color: Color(0xffF6F6F6),
                                    size: 34,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 184,
                        width: 160,
                        decoration: BoxDecoration(
                          color:  DateTime.now().hour>6 && DateTime.now().hour<18
                              ?Color(0xff87A2FF)
                              :Color(0xff2E2E31),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              top:15,
                              left: 14,
                              child: Text("Humidity",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 26,
                              left: 14,
                              child: Text('${humidity.toInt()} ',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 62,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              right: 34,
                              child: Text("%",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 69,
                                width: 68,
                                decoration: BoxDecoration(
                                    color: DateTime.now().hour>6 && DateTime.now().hour<18
                                        ?Color(0xffE2C529)
                                        :Color(0xffB9B9B9),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        bottomRight: Radius.circular(12)
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 13,
                                    top: 10,
                                  ),
                                  child: Icon(Icons.opacity,
                                    color: Color(0xffF6F6F6),
                                    size: 34,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 19,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 184,
                        width: 160,
                        decoration: BoxDecoration(
                          color:  DateTime.now().hour>6 && DateTime.now().hour<18
                              ?Color(0xff87A2FF)
                              :Color(0xff2E2E31),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              top:15,
                              left: 14,
                              child: Text("Cloud Cover",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 26,
                              left: 14,
                              child: Text('${windSpeed.toInt()} ',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 62,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 59,
                              right: 42,
                              child: Text("%",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 69,
                                width: 68,
                                decoration: BoxDecoration(
                                    color: DateTime.now().hour>6 && DateTime.now().hour<18
                                        ?Color(0xffE2C529)
                                        :Color(0xffB9B9B9),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        bottomRight: Radius.circular(12)
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 13,
                                    top: 10,
                                  ),
                                  child: Icon(Icons.cloud,
                                    color: Color(0xffF6F6F6),
                                    size: 34,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 20,),

                      Container(
                        height: 184,
                        width: 160,
                        decoration: BoxDecoration(
                          color: DateTime.now().hour>6 && DateTime.now().hour<18
                              ?Color(0xff87A2FF)
                              :Color(0xff2E2E31),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              top:15,
                              left: 14,
                              child: Text("Pressure",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily:'Poppins-Medium.ttf',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              top: 26,
                              left: 14,
                              child: Container(
                                height: 93,
                                width: 136,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${pressure.toInt()} ',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontFamily:'Poppins-Medium.ttf',
                                          fontSize: 62,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Expanded(
                                      child: Text("Hpa",
                                        style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontFamily:'Poppins-Medium.ttf',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 69,
                                width: 68,
                                decoration: BoxDecoration(
                                    color: DateTime.now().hour>6 && DateTime.now().hour<19
                                        ?Color(0xffE2C529)
                                        :Color(0xffB9B9B9),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        bottomRight: Radius.circular(12)
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 13,
                                    top: 10,
                                  ),
                                  child: Icon(Icons.water,
                                    color: Color(0xffF6F6F6),
                                    size: 34,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
