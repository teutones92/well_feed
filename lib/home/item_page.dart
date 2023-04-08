import 'package:flutter/material.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/models/yoga_poses_model/yoga_poses_model.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.bloc, required this.item});
  final HomeBloc bloc;
  final YogaPosesModel item;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
            Hero(
              tag: item.id.toString(),
              child: Image.network(
                item.urlPng!,
                width: size.width - 15,
                height: size.height / 2.5,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    item.englishName.toString().toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height / 20),
                  ),
                  Text(item.sanskritName!),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.poseDescription!,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
