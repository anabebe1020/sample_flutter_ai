import 'package:flutter/material.dart';
import 'package:flutter_ai/features/home/view/home_page.dart';
import 'package:flutter_ai/features/route/model/routes.dart';
import 'package:flutter_ai/features/search/view/search_page.dart';
import 'package:flutter_ai/features/settings/view/settings_page.dart';

final List<RouteModel> routesForRootNav = [
  RouteModel(
    path: '/home',
    name: 'Home',
    page: HomePage(),
    nav: RouteNavModel(label: 'Home', icon: Icon(Icons.home)),
  ),
  RouteModel(
    path: '/search',
    name: 'Search',
    page: SearchPage(),
    nav: RouteNavModel(label: 'Search', icon: Icon(Icons.search)),
  ),
  RouteModel(
    path: '/settings',
    name: 'Settings',
    page: SettingsPage(),
    nav: RouteNavModel(label: 'Settings', icon: Icon(Icons.settings)),
  ),
];
