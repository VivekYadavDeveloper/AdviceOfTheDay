import 'dart:core';
import 'dart:ui';

import 'package:advice_status/API%20Model/api_class.dart';
import 'package:advice_status/API%20Model/model_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatefulWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  late Future<Welcome> futureData;
  @override
  //**Initialisez The From Api Into App */
  void initState() {
    futureData = getApiData();
    super.initState();
  }

  void refreshData() {
    getApiData();
  }

  FutureOr(dynamic Welcome) {
    setState(() {
      refreshData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/Luffy.jpg",
            ),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //**Future Builder Use For Getting Data From APi */
            FutureBuilder<Welcome>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    //** For Glass Effect */
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                        child: Container(
                          width: 500.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white.withOpacity(0.10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText(
                                snapshot.requireData.slip.advice,
                                style: GoogleFonts.akayaTelivigala(
                                  textStyle: const TextStyle(
                                    fontSize: 22.0,
                                    color: Color.fromARGB(255, 36, 35, 35),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50.0,
                    // style: TextStyle(fontSize: 25),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
