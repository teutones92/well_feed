import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:well_feed/home/home_page.dart';

class HomeBloc {
  void toHomePage(BuildContext context,
      {required GoogleSignInAccount? userData}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(userData: userData, homeBloc: this),
      ),
    );
  }
}
