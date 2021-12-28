import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/ui/components/kuisionerBody.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:kuisioner/ui/components/profileBody.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Text> title = [
    Text("Kuisioner"),
    Text("List Dosen"),
  ];

  final _widgetOptions = [
    KuisionerBody(),
    ProfileBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: title.elementAt(_selectedIndex),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: GradientBottomNavigationBar(
            backgroundColorStart: Colors.green,
            backgroundColorEnd: Colors.blue,
            fixedColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.thumbs_up_down), title: Text('Kuisioner')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Akun')),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
