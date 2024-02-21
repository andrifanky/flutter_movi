import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';
import 'package:flutter_movi/widgets/bottom_nav_bar_button.dart';
import 'package:flutter_movi/widgets/coming_soon_banner.dart';
import 'package:flutter_movi/widgets/top_movie.dart';
import 'package:provider/provider.dart';

class ThemeNotifier with ChangeNotifier {
  bool darkMode = false;

  changeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeMode = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Movi',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: yellowColor
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: yellowColor
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode.darkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _bottomNavActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context, themeMode),
      drawer: drawer(themeMode),
      body: body(),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  PreferredSizeWidget appBar(BuildContext context, ThemeNotifier themeMode) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        icon: SizedBox(
          height: 24,
          width: 24,
          child: Image.asset('assets/images/icons/ic_menu.png',
            color: themeMode.darkMode ? whiteColor : blackColor
          )
        )
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset('assets/images/icons/ic_profile.png')
          )
        )
      ],
    );
  }

  Widget drawer(ThemeNotifier themeMode) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: IconButton(
                onPressed: () {
                  themeMode.changeMode();
                },
                icon: Icon(themeMode.darkMode ? Icons.light_mode : Icons.dark_mode)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget body() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: defaultMargin),
          child: Text('Coming Soon', style: poppins18SemiBold),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              ComingSoonBanner(banner: 'assets/images/banner/banner_1.png', title: 'A Quiet Place II', releaseDate: 'April 2021'),
              ComingSoonBanner(banner: 'assets/images/banner/banner_1.png', title: 'A Quiet Place II', releaseDate: 'April 2021')
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: defaultMargin),
          child: Text('Top Movies', style: poppins18SemiBold),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopMovie(cover: 'assets/images/cover/free_guy_cover.png', title: 'Free Guy', genre: 'Comedy'),
              TopMovie(cover: 'assets/images/cover/the_dark_knight_cover.png', title: 'The Dark Knight', genre: 'Action'),
              TopMovie(cover: 'assets/images/cover/guns_akimbo_cover.png', title: 'Guns Akimbo', genre: 'Comedy'),
              TopMovie(cover: 'assets/images/cover/free_guy_cover.png', title: 'Free Guy 2', genre: 'Comedy'),
              TopMovie(cover: 'assets/images/cover/the_dark_knight_cover.png', title: 'The Dark Knight 2', genre: 'Action'),
              TopMovie(cover: 'assets/images/cover/guns_akimbo_cover.png', title: 'Guns Akimbo 2', genre: 'Comedy')
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomNavBar() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomNavBarButton(
            icon: 'assets/images/icons/ic_home.png',
            label: 'Home',
            color: bottomNavBarIconColor(0),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 0;
              });
            }
          ),
          BottomNavBarButton(
            icon: 'assets/images/icons/ic_explore.png',
            label: 'Explore',
            color: bottomNavBarIconColor(1),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 1;
              });
            }
          ),
          BottomNavBarButton(
            icon: 'assets/images/icons/ic_you.png',
            label: 'You',
            color: bottomNavBarIconColor(2),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 2;
              });
            }
          )
        ],
      ),
    );
  }

  Color bottomNavBarIconColor(index) {
    if (index == _bottomNavActiveIndex) {
      return yellowColor;
    }
    return greyColor;
  }
}
