import 'package:flutter/material.dart';

Future<void> replace(BuildContext context, Widget to, Type meta) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
  );
}

Future<void> root(BuildContext context, Widget to, Type meta) async {
  await Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (BuildContext context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
    ModalRoute.withName('/'),
  );
}

Future<void> push(BuildContext context, Widget to, Type meta) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
  );
}

void modal(BuildContext context, Widget to, Type meta) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
      fullscreenDialog: true,
    ),
  );
}

void modalForHideBottom(BuildContext context, Widget to, Type meta) {
  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
      fullscreenDialog: true,
    ),
  );
}
