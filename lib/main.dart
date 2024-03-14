import 'package:flutter/material.dart';
import 'package:project_1/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/model/change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealPlanModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}