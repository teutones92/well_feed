import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_feed/home/home_page.dart';
import 'package:well_feed/models/g_user_data/g_user_data_model.dart';
import 'package:well_feed/start/start_page.dart';

import 'blocs/home_bloc.dart';
import 'services/auth_google/auth_google.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkingIfLogedin();
  runApp(const MyApp());
}

GUserDataModel? userData;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    final AuthGoogle authGoogle = AuthGoogle();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: userData != null
          ? HomePage(
              userData: userData, homeBloc: homeBloc, authGoogle: authGoogle)
          : StartPage(authGoogle: authGoogle, homeBloc: homeBloc),
    );
  }
}

Future<void> checkingIfLogedin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getKeys().isNotEmpty) {
    userData = GUserDataModel(
        displayName: prefs.getString('displayName')!,
        id: prefs.getString('id')!,
        email: prefs.getString('email')!,
        photoUrl: prefs.getString('photoUrl')!);
  }
}
