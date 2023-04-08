import 'package:flutter/material.dart';
import 'package:well_feed/blocs/home_bloc.dart';
import 'package:well_feed/models/g_user_data/g_user_data_model.dart';
import 'package:well_feed/models/home_view_data/home_view_data.dart';
import 'package:well_feed/services/auth_google/auth_google.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.userData,
      required this.homeBloc,
      required this.authGoogle});
  final GUserDataModel? userData;
  final HomeBloc homeBloc;
  final AuthGoogle authGoogle;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool started = false;

  @override
  void initState() {
    awaitStarted();
    super.initState();
  }

  void awaitStarted() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        started = true;
      });
    });
    await Future.delayed(
      const Duration(milliseconds: 600),
      () {},
    );
  }

  @override
  void dispose() {
    setState(() {
      started = false;
    });
    super.dispose();
  }

  Widget customAnimationPosition({required Widget child}) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      top: started ? 0 : 80,
      child: AnimatedOpacity(
        opacity: started ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                Stack(
                  children: [
                    customAnimationPosition(
                        child: CustomAppBar(
                      userData: widget.userData,
                      authGoogle: widget.authGoogle,
                      homeBloc: widget.homeBloc,
                    )),
                    customAnimationPosition(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: size.height / 4.5,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(10, 5),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: SizedBox(
                                width: size.width / 2,
                                child: Text(
                                  style: TextStyle(
                                    fontSize: size.width / 12,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  'strategies to success'.toUpperCase(),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height / 3.5),
                      child: Column(
                        children: List.generate(
                            HomeViewData.homeviewData.length, (index) {
                          final item = HomeViewData.homeviewData[index];
                          return AnimatedOpacity(
                            opacity: started ? 1 : 0,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 1500),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 25),
                              child: Card(
                                elevation: 3,
                                color: item.color,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    onTap: () => widget.homeBloc
                                        .goToSecondPage(context, index),
                                    leading: Image.asset(
                                      item.imagePath,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 80,
                                    ),
                                    title: Text(
                                      item.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                    ),
                                    subtitle: Text(
                                      item.content,
                                      // softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.userData,
      required this.authGoogle,
      required this.homeBloc});
  final GUserDataModel? userData;
  final AuthGoogle authGoogle;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15),
      child: SizedBox(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: userData == null
                  ? const Icon(Icons.person_2)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(userData!.photoUrl.toString(),
                          fit: BoxFit.fill),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData != null ? userData!.displayName : 'Guess',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    userData != null ? userData!.email : '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  onPressed: () => authGoogle.signOut(context, homeBloc),
                  icon: const Icon(Icons.exit_to_app)),
            ),
          ],
        ),
      ),
    );
  }
}
