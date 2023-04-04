import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:well_feed/blocs/home_bloc.dart';

class AuthGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signInWithGoogle(HomeBloc homeBloc, BuildContext context) async {
    await _googleSignIn.signIn().then((value) async {
      if (value == null) return;
      await Future.delayed(const Duration(milliseconds: 250)).then((_) {
        if (value.id.isNotEmpty) homeBloc.toHomePage(context, userData: value);
      });
    });

    // if login then go to homeBloc.
  }
}
