import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/models/home_view_data/home_view_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userData, required this.homeBloc});
  final GoogleSignInAccount? userData;
  final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 0, bottom: 8),
          child: CircleAvatar(
            child: userData == null
                ? const Icon(Icons.person_2)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(userData!.photoUrl.toString(),
                        fit: BoxFit.fill),
                  ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userData != null ? userData!.displayName! : 'Guess'),
            Text(
              userData != null ? userData!.email : '',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.green.shade800),
            child: Image.asset(
              'assets/bkg_well_feed.png',
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '5',
                    style: TextStyle(fontSize: size.height / 4.5),
                  ),
                  SizedBox(
                    width: size.height / 4,
                    child: Text(
                      style: TextStyle(fontSize: size.height / 30),
                      'strategies to success'.toUpperCase(),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                children:
                    List.generate(HomeViewData.homeviewData.length, (index) {
                  final item = HomeViewData.homeviewData[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
                    child: Card(
                      elevation: 3,
                      color: item.color,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          leading: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.title),
                          subtitle: Text(
                            item.content,
                            // softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
