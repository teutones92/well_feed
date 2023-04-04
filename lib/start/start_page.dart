import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/info/information_start/information_start.dart';
import 'package:well_feed/services/auth_google/auth_google.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeBloc homeBloc = HomeBloc();
    final AuthGoogle authGoogle = AuthGoogle();
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width / 1,
              height: size.height / 3,
              child: Image.asset(
                'assets/logo/well_feed_logo.png',
                fit: BoxFit.scaleDown,
                // width: size.width / 5,
                // height: size.height / 5,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () =>
                          authGoogle.signInWithGoogle(homeBloc, context),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.g_mobiledata_rounded,
                            color: Colors.green,
                          ),
                          Text(
                            'Continue with google',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => homeBloc.toHomePage(context, userData: null),
                  child: const Text(
                    'Continue as a guess',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height / 5,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    height: size.height / 5,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          InformationStart.informationStartData.length,
                          (index) {
                            final i =
                                InformationStart.informationStartData[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    '${i.title}:',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(i.content),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.question_mark_rounded),
      ),
    );
  }
}
