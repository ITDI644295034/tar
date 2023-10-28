import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/airing_page.dart';
import 'package:flutter_application_4/page/detailAiring.dart';
import 'package:flutter_application_4/page/detailPop.dart';
import 'package:flutter_application_4/page/pop_page.dart';
import 'package:flutter_application_4/page/vdo_page.dart';

class AppRoute {
  static const homeRoute = 'home';
  static const airingRoute = 'airingRoute';
  static const popularRoute = 'popularRoute';
  static const detailAiringRoute = 'detailUp';
  static const detailPopRoute = 'detailPop';
  static const clipPopRoute = 'clipPop';
  final _route = <String, WidgetBuilder>{
    airingRoute:(context) => AiringPage(),
    detailAiringRoute:(context) => AiringDetailPage(),
    clipPopRoute:(context) => VideoPage(),
    popularRoute:(context) => PoppularPage(),
    detailPopRoute:(context) => PopularDetailPage(),
  };

  get routeAll => _route;
}
