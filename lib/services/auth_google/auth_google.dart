import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/models/g_user_data/g_user_data_model.dart';
import 'package:well_feed/start/start_page.dart';

class AuthGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signInWithGoogle(HomeBloc homeBloc, BuildContext context) async {
    GoogleSignInAccount? user;
    await _googleSignIn.signIn().then((value) async {
      if (value == null) return;
      await Future.delayed(const Duration(milliseconds: 250)).then((_) {
        if (value.id.isNotEmpty) {
          final newValue = GUserDataModel(
              displayName: value.displayName!,
              id: value.id,
              email: value.email,
              photoUrl: value.photoUrl!);
          homeBloc.toHomePage(context, userData: newValue, authGoogle: this);
          user = value;
        }
      });
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null) {
      prefs.setString('email', user!.email);
      prefs.setString('id', user!.id);
      prefs.setString('displayName', user!.displayName!);
      prefs.setString('photoUrl', user!.photoUrl!);
    }
  }

  void signOut(BuildContext context, HomeBloc homeBloc) async {
    await _googleSignIn.isSignedIn().then((si) async {
      if (si) _googleSignIn.disconnect();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                StartPage(homeBloc: homeBloc, authGoogle: this),
          ),
          (route) => true);
    });
  }
}
