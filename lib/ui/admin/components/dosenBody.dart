import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/dosenController.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/models/dosenModel.dart';

class DosenBody extends StatelessWidget {
  final DosenController dosenC = Get.put(DosenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(-0.8, 1),
        child: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: () {
            Get.bottomSheet(_addDosen());
          },
        ),
      ),
      body: GetBuilder<DosenController>(
        init: DosenController(),
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Obx(
                    () => (_.dataDosen.value.isEmpty)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 2),
                            itemCount: _.dataDosen.value.length,
                            itemBuilder: (context, index) {
                              final dosen = _.dataDosen.value[index];
                              return Container(
                                margin: EdgeInsets.all(1),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 3),
                                    child: Text("${dosen.namaDosen}"),
                                  ),
                                  subtitle: Text("${dosen.nip}"),
                                  trailing: PopupMenuButton(
                                    onSelected: (value) {
                                      if (value == "Edit") {
                                        Get.bottomSheet(editDosen(
                                          idDosen: dosen.id,
                                          namaDosen: dosen.namaDosen,
                                          nip: dosen.nip,
                                          noTelepon: dosen.noTelepon,
                                          email: dosen.email,
                                        ));
                                      } else {
                                        Get.defaultDialog(
                                          title: "Peringatan",
                                          radius: 5,
                                          middleText: "Yakin ingin menghapus?",
                                          onConfirm: () {
                                            _.deleteDosen(dosen.id);
                                          },
                                          onCancel: () {},
                                          confirmTextColor: Colors.white,
                                          textConfirm: "Ya",
                                          textCancel: "Batal",
                                        );
                                      }
                                    },
                                    itemBuilder: (context) {
                                      return <PopupMenuEntry>[
                                        const PopupMenuItem(
                                          value: 'Edit',
                                          child: Text('Edit'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Delete',
                                          child: Text('Delete'),
                                        ),
                                      ];
                                    },
                                  ),
                                  onTap: () {
                                    print("tambah");
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container editDosen({
    String idDosen,
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  }) {
    final DosenController dosenC = Get.find();
    final MainController mainC = Get.find();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController namadosen =
        TextEditingController(text: namaDosen);
    final TextEditingController nipdosen =
        TextEditingController(text: nip.toString());
    final TextEditingController noTelepondosen =
        TextEditingController(text: noTelepon.toString());
    final TextEditingController emaildosen = TextEditingController(text: email);

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
                  "Edit Data Dosen",
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
                        Text("Nama Dosen"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: namadosen,
                          validator: (value) {
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
                        Text("NIP"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: nipdosen,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Harap masukkan beberapa teks';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Telp"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: noTelepondosen,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Harap masukkan beberapa teks';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: emaildosen,
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (value.isEmpty) {
                              return 'Harap masukkan beberapa teks';
                            }
                            if (!(regex.hasMatch(value))) {
                              return 'Mohon isi email dengan benar';
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(
                    () => Material(
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
                                  int newNip = int.parse(nipdosen.text);
                                  int newTelp = int.parse(noTelepondosen.text);
                                  dosenC.updateDosen(
                                    idDosen: idDosen,
                                    namaDosen: namadosen.text,
                                    nip: newNip,
                                    noTelepon: newTelp,
                                    email: emaildosen.text,
                                  );
                                } else {
                                  print('Form is invalid');
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "Edit",
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
}

Container _addDosen() {
  final DosenController dosenC = Get.find();
  final MainController mainC = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaDosen = TextEditingController();
  final TextEditingController nip = TextEditingController();
  final TextEditingController noTelepon = TextEditingController();
  final TextEditingController email = TextEditingController();

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
                "Tambah Data Dosen",
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
                      Text("Nama Dosen"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: namaDosen,
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
                      Text("NIP"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: nip,
                        validator: (value) {
                          print(value);
                          if (value.isEmpty) {
                            return 'Harap masukkan beberapa teks';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Telp"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: noTelepon,
                        validator: (value) {
                          print(value);
                          if (value.isEmpty) {
                            return 'Harap masukkan beberapa teks';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email"),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                        controller: email,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          print(value);
                          if (value.isEmpty) {
                            return 'Harap masukkan beberapa teks';
                          }
                          if (!(regex.hasMatch(value))) {
                            return 'Mohon isi email dengan benar';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(
                  () => Material(
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
                                int newNip = int.parse(nip.text);
                                int newTelp = int.parse(noTelepon.text);
                                dosenC.addDosen(
                                  namaDosen: namaDosen.text,
                                  nip: newNip,
                                  noTelepon: newTelp,
                                  email: email.text,
                                );
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

// Container _editDosen() {
//   final dosenC = Get.find<DosenController>();
//   final TextEditingController namaDosen = TextEditingController();
//   final TextEditingController nip = TextEditingController();
//   final TextEditingController noTelepon = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   return Container(
//     color: Colors.white,
//     child: SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.only(left: 40, right: 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//               "Edit Data Dosen",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Text("Nama Dosen : "),
//                     Expanded(
//                         child: TextFormField(
//                       decoration: InputDecoration(hintText: "tes"),
//                       controller: namaDosen,
//                     )),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("NIP                  :"),
//                     Expanded(child: TextFormField(controller: nip)),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("Telp                  :"),
//                     Expanded(
//                         child: TextFormField(
//                       controller: noTelepon,
//                     )),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("Email                :"),
//                     Expanded(
//                         child: TextFormField(
//                       controller: email,
//                     )),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 border: Border.all(
//                   width: 2,
//                   color: Colors.white,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     int newNip = int.parse(nip.text);
//                     int newTelp = int.parse(noTelepon.text);
//                     dosenC.addDosen(
//                       namaDosen: namaDosen.text,
//                       nip: newNip,
//                       noTelepon: newTelp,
//                       email: email.text,
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.only(top: 16, bottom: 16),
//                     width: double.infinity,
//                     child: Center(
//                       child: Text(
//                         "Edit",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
