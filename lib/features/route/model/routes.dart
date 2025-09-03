import 'package:flutter/material.dart';

class RouteModel {
  final String path;
  final String name;
  final Widget page;
  final RouteNavModel? nav;

  RouteModel({
    required this.path,
    required this.name,
    required this.page,
    this.nav,
  });
}

class RouteNavModel {
  final String label;
  final Widget icon;

  RouteNavModel({required this.label, required this.icon});
}
