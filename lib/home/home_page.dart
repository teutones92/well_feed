import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:well_feed/blocs/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userData, required this.homeBloc});
  final GoogleSignInAccount? userData;
  final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
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
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.green), child: Column()),
        ],
      ),
    );
  }
}
