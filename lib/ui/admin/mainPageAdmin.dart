import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:kuisioner/controllers/adminController.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/ui/admin/components/dosenBody.dart';
import 'package:kuisioner/ui/admin/components/homeBody.dart';
import 'package:kuisioner/ui/admin/components/mahasiswaBody.dart';
import 'package:kuisioner/ui/admin/components/pertanyaanBody.dart';
import 'package:kuisioner/ui/signinPage.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';

class MainPageAdmin extends StatefulWidget {
  @override
  _MainPageAdminState createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  final AdminController adminC = Get.put(AdminController());
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Text> title = [
    Text("Home"),
    Text("List Dosen"),
    Text("List Mahasiswa"),
    Text("Pertanyaan"),
  ];
  final _widgetOptions = [
    HomeBody(),
    DosenBody(),
    MahasiswaBody(),
    PertanyaanBody(),
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
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // adminC.logoutAdmin();
                  Get.offAll(SignInPage());
                },
              )
            ],
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
                  icon: Icon(Icons.thumbs_up_down), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Dosen')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity), title: Text('Mahasiswa')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add), title: Text('Pertanyaan')),
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
