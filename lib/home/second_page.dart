import 'package:flutter/material.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/models/home_view_data/home_view_data.dart';

import '../models/yoga_poses_model/yoga_poses_model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.index, required this.bloc});
  final int index;
  final HomeBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HomeViewData.homeviewData[index].color,
        title: Text(
          HomeViewData.homeviewData[index].title,
        ),
      ),
      body: index == 0 ? YogaView(bloc: bloc) : const SizedBox(),
    );
  }
}

class YogaView extends StatelessWidget {
  const YogaView({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YogaPosesModel>>(
        future: bloc.fetchYogaData(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('no data'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () => bloc.goTiItemPage(context, item),
                    isThreeLine: true,
                    title: Text('English Name: ${item.englishName!}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(item.sanskritName!),
                        ),
                        Text(
                          item.poseDescription!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    leading: Hero(
                        tag: item.id.toString(),
                        child: Image.network(item.urlPng!)),
                  ),
                ),
              );
            },
          );
        });
  }
}
