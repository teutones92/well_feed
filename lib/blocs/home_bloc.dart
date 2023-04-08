import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:well_feed/home/home_page.dart';
import 'package:well_feed/models/g_user_data/g_user_data_model.dart';
import 'package:well_feed/services/auth_google/auth_google.dart';
import 'package:http/http.dart' as http;

class HomeBloc {
  void toHomePage(BuildContext context,
      {required GUserDataModel? userData, required AuthGoogle authGoogle}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
            userData: userData, homeBloc: this, authGoogle: authGoogle),
      ),
    );
  }

  void fetchYogaData() async {
    var headers = {'Cookie': 'PHPSESSID=9ghjfsm9n84q6fbmseekctiih6'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://generatorfun.com/consumeapi.php?api=837&apisecret=307af7-bb5bfe-9762bc-d53218-e027e8'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    // final dio = Dio();
    // final resp = await dio.getUri(
    //     options: Options(contentType: 'Aplication/json'),
    //     Uri.parse(
    //         'https://generatorfun.com/consumeapi.php?api=837&apisecret=307af7-bb5bfe-9762bc-d53218-e027e8'));

    // final a = resp.toString().split('<tr>');
    // print(a);
  }
}
