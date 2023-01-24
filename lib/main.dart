import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:instagram/activity_screen.dart';
import 'package:instagram/explore_screen.dart';
import 'package:instagram/feed_screen.dart';
import 'package:instagram/profile_screen.dart';
import 'package:instagram/search_screen.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Instagram'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int screenState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 64,
        elevation: 0,
        title: SvgPicture.network(
          "https://upload.wikimedia.org/wikipedia/commons/2/2a/Instagram_logo.svg",
          height: 54,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Feather.plus_square,
                color: Colors.black,
              ),
              color: Colors.black),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Feather.send,
                color: Colors.black,
              )),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenState,
        onDestinationSelected: (_) {
          setState(() {
            screenState = _;
          });
        },
        destinations: [
          const NavigationDestination(icon: Icon(Feather.home), label: "Home"),
          const NavigationDestination(
              icon: Icon(Feather.search), label: "Seach"),
          const NavigationDestination(
              icon: Icon(Feather.video), label: "Explore"),
          const NavigationDestination(
              icon: Icon(Feather.heart), label: "Activity"),
          const NavigationDestination(
              icon: Icon(Feather.user), label: "Profile"),
        ],
        elevation: 0,
      ),
      body: screenState == 0
          ? const FeedScreen()
          : screenState == 1
              ? const SearchScreen()
              : screenState == 2
                  ? const ExploreScreen()
                  : screenState == 3
                      ? const ActivityScreen()
                      : const ProfileScreen(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
