import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/controllers/signinController.dart';
import 'package:kuisioner/ui/signupPage.dart';

class SignInPage extends StatelessWidget {
  final MainController mainC = Get.put(MainController());
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SigninController>(
        init: SigninController(),
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: "username",
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: password,
                            obscureText: _.hidePass.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _.hidePass.value = !_.hidePass.value;
                                },
                                icon: Icon(Icons.visibility),
                              ),
                              hintText: "password",
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.grey[200])),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                value: _.role,
                                hint: Text("Role"),
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Mahasiswa"),
                                    value: "mahasiswa",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Admin"),
                                    value: "admin",
                                  ),
                                ],
                                onChanged: (value) {
                                  _.setRole(value);
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Obx(
                            () => Material(
                              color: Colors.transparent,
                              child: (mainC.loading.value)
                                  ? InkWell(
                                      child: Container(
                                        // padding: EdgeInsets.only(
                                        //     top: 16, bottom: 16),
                                        width: double.infinity,
                                        child: Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        print(_.role);
                                        mainC.loading.value =
                                            !mainC.loading.value;
                                        _.loadLogin(username.text,
                                            password.text, _.role);
                                      },
                                      child: Container(
                                        // padding: EdgeInsets.only(
                                        //     top: 16, bottom: 16),
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            "Masuk",
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
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     border: Border.all(
                        //       width: 2,
                        //       color: Colors.green,
                        //     ),
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   child: Material(
                        //     color: Colors.transparent,
                        //     child: InkWell(
                        //       onTap: () {
                        //         Get.to(SignUpPage());
                        //       },
                        //       child: Container(
                        //         padding: EdgeInsets.only(top: 16, bottom: 16),
                        //         width: double.infinity,
                        //         child: Center(
                        //           child: Text(
                        //             "Sign Up",
                        //             style: TextStyle(
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.green),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
