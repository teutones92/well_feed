import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:well_feed/home/home_page.dart';
import 'package:well_feed/home/item_page.dart';
import 'package:well_feed/home/second_page.dart';
import 'package:well_feed/models/g_user_data/g_user_data_model.dart';
import 'package:well_feed/models/yoga_poses_model/yoga_poses_model.dart';
import 'package:well_feed/services/auth_google/auth_google.dart';

class HomeBloc {
  final String urlBase = 'https://yoga-api-nzy4.onrender.com/v1/poses';
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

  void goToSecondPage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          index: index,
          bloc: this,
        ),
      ),
    );
  }

  void goTiItemPage(BuildContext context, YogaPosesModel item) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemPage(bloc: this, item: item),
        ));
  }

  Future<List<YogaPosesModel>> fetchYogaData() async {
    final List<YogaPosesModel> listTemp = [];
    final dio = Dio();
    final Response<List> resp = await dio.getUri(
        options: Options(contentType: 'Aplication/json'), Uri.parse(urlBase));

    if (resp.statusCode == 200) {
      for (var element in resp.data!) {
        listTemp.add(YogaPosesModel.fromJson(element));
      }
    }
    return listTemp;
  }
}
