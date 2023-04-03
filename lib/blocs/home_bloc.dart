import 'package:flutter/material.dart';
import 'package:well_feed/home/home_page.dart';

class HomeBloc {
  void toHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
