import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location2.dart';
import 'package:worldtime/pages/choose_region.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  title: 'World Time',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/location2': (context) => ChooseLocation2(),
    '/region': (context) => ChooseRegion(),
  },
));
