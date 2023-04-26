import 'dart:core';

import 'package:advice_status/repo/api_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/advice_screen.dart';
import 'bloc/advice_bloc.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => AdviceRepo(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceBloc(AdviceRepo()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const AdvicePage(),
      ),
    );
  }
}
