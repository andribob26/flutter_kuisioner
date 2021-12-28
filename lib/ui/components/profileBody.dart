import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisioner/controllers/dosenController.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/controllers/profilController.dart';
import 'package:kuisioner/ui/signinPage.dart';

class ProfileBody extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (_) {
          print(_.dataProfile.value == null);
          return Container(
            color: Colors.grey[200],
            child: (_.dataProfile.value == null)
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                          'assets/images/akun.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${_.dataProfile.value.namaMhs}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      "${_.dataProfile.value.nim}",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(top: 2.0),
                          children: [
                            Container(
                              margin: EdgeInsets.all(1.0),
                              child: ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Ubah Password",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                leading: Icon(Icons.admin_panel_settings),
                                onTap: () {
                                  Get.bottomSheet(_ubahPass());
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(1.0),
                              child: ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Keluar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                leading: Icon(Icons.logout),
                                onTap: () {
                                  box.remove('idMhs');
                                  Get.offAll(SignInPage());
                                  // _.logout();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

Container _ubahPass({String pass}) {
  final box = GetStorage();
  final ProfileController profileC = Get.find();
  final MainController mainC = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordBaru = TextEditingController();

  return Container(
    color: Colors.white,
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Ganti Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: password,
                        validator: (value) {
                          print(value);
                          if (value.isEmpty) {
                            return 'Harap masukkan beberapa teks';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password Baru"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: passwordBaru,
                        validator: (value) {
                          print(value);
                          if (value.isEmpty) {
                            return 'Harap masukkan beberapa teks';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: (mainC.loading.value)
                        ? InkWell(
                            child: Container(
                              child: Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              final FormState form = _formKey.currentState;
                              if (form.validate()) {
                                mainC.loading.value = !mainC.loading.value;
                                profileC.ubahPassword(box.read("idMhs"),
                                    password.text, passwordBaru.text);
                              } else {
                                print('Form is invalid');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Tambah",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
