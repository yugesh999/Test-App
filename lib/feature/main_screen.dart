import 'package:demo_project/feature/home_screen.dart';
import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../shared/constants/fonts/font_constants.dart';
import '../shared/constants/fonts/size_config.dart';
import '../shared/text_widgets/build_text.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/mainScreen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double height = 0;
  double width = 0;

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Search")),
    Center(child: Text("Profile")),
  ];

  @override
  void initState() {
    super.initState();
    height = SizeConfig.safeBlockVertical ?? 0;
    width = SizeConfig.safeBlockHorizontal ?? 0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: BuildText(text: "Weather App", fontSize: 10.0.large28px()),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[400],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
