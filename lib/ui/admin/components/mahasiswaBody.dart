import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/dosenController.dart';
import 'package:kuisioner/controllers/mahasiswa_controller.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/models/dosenModel.dart';

class MahasiswaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(-0.8, 1),
        child: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: () {
            Get.bottomSheet(_addMhs());
          },
        ),
      ),
      body: GetBuilder<MahasiswaController>(
        init: MahasiswaController(),
        builder: (_) {
          print(_.dataMhs.value.length);
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Obx(
                    () => (_.dataMhs.value.isEmpty)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 2),
                            itemCount: _.dataMhs.value.length,
                            itemBuilder: (context, index) {
                              final mhs = _.dataMhs.value[index];
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
                                    child: Text("${mhs.namaMhs}"),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3, bottom: 5),
                                    child: Text("${mhs.nim}"),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "Peringatan",
                                        radius: 5,
                                        middleText: "Yakin ingin menghapus?",
                                        onConfirm: () {
                                          _.deleteMhs(mhs.idMhs);
                                        },
                                        onCancel: () {},
                                        confirmTextColor: Colors.white,
                                        textConfirm: "Ya",
                                        textCancel: "Batal",
                                      );
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

//   Container editDosen({
//     String idDosen,
//     String namaMhs,
//     int nim,
//     int password,
//     String email,
//   }) {
//     final DosenController mhsC = Get.find();
//     final MainController mainC = Get.find();
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final TextEditingController namadosen =
//         TextEditingController(text: namaMhs);
//     final TextEditingController nipdosen =
//         TextEditingController(text: nim.toString());
//     final TextEditingController noTelepondosen =
//         TextEditingController(text: password.toString());
//     final TextEditingController emaildosen = TextEditingController(text: email);

//     return Container(
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 40, right: 40),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   "Edit Data Dosen",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text("Nama Dosen : "),
//                         Expanded(
//                             child: TextFormField(
//                           controller: namadosen,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Harap masukkan beberapa teks';
//                             }
//                             return null;
//                           },
//                         )),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text("NIP                  : "),
//                         Expanded(
//                             child: TextFormField(
//                           controller: nipdosen,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Harap masukkan beberapa teks';
//                             }
//                             return null;
//                           },
//                           keyboardType: TextInputType.number,
//                         )),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text("Telp                  : "),
//                         Expanded(
//                           child: TextFormField(
//                             controller: noTelepondosen,
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return 'Harap masukkan beberapa teks';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text("Email                : "),
//                         Expanded(
//                             child: TextFormField(
//                           controller: emaildosen,
//                           validator: (value) {
//                             Pattern pattern =
//                                 r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                             RegExp regex = new RegExp(pattern);
//                             if (value.isEmpty) {
//                               return 'Harap masukkan beberapa teks';
//                             }
//                             if (!(regex.hasMatch(value))) {
//                               return 'Mohon isi email dengan benar';
//                             }
//                             return null;
//                           },
//                         )),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     border: Border.all(
//                       width: 2,
//                       color: Colors.white,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Obx(
//                     () => Material(
//                       color: Colors.transparent,
//                       child: (mainC.loading.value)
//                           ? InkWell(
//                               child: Container(
//                                 child: Center(
//                                   child: SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       valueColor: AlwaysStoppedAnimation<Color>(
//                                           Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 final FormState form = _formKey.currentState;
//                                 if (form.validate()) {
//                                   mainC.loading.value = !mainC.loading.value;
//                                   int newNip = int.parse(nipdosen.text);
//                                   int newTelp = int.parse(noTelepondosen.text);
//                                   mhsC.updateDosen(
//                                     idDosen: idDosen,
//                                     namaMhs: namadosen.text,
//                                     nim: newNip,
//                                     password: newTelp,
//                                     email: emaildosen.text,
//                                   );
//                                 } else {
//                                   print('Form is invalid');
//                                 }
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     "Edit",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

  Container _addMhs() {
    final MahasiswaController mhsC = Get.find();
    final MainController mainC = Get.find();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController namaMhs = TextEditingController();
    final TextEditingController nim = TextEditingController();
    final TextEditingController password = TextEditingController();

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
                  "Tambah Data Mahasiswa",
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
                        Text("Nama Mahasiswa"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: namaMhs,
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
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NIM"),
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                          controller: nim,
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
                      height: 10.0,
                    ),
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
                                  int newNip = int.parse(nim.text);
                                  // int newTelp = int.parse(password.text);
                                  mhsC.addMhs(
                                    namaMhs: namaMhs.text,
                                    nim: newNip,
                                    password: password.text,
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
}
// PopupMenuButton(
//                                     onSelected: (value) {
//                                       if (value == "Detail") {
//                                         showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return AlertDialog(
//                                               title: Container(
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(8.0),
//                                                   child: Text(
//                                                     'List Pertanyaan',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                   ),
//                                                 ),
//                                               ),
//                                               content: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Container(
//                                                     height:
//                                                         300.0, // Change as per your requirement
//                                                     child: ListView(
//                                                       children: [
//                                                         Text("tess"),
//                                                         Text("tess"),
//                                                         Text("tess"),
//                                                         Text("tess"),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Align(
//                                                     alignment:
//                                                         Alignment.bottomRight,
//                                                     child: Container(
//                                                       height: 30,
//                                                       width: 75,
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         border: Border.all(
//                                                           width: 2,
//                                                           color: Colors.blue,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20),
//                                                       ),
//                                                       child: InkWell(
//                                                         onTap: () {
//                                                           Get.back();
//                                                         },
//                                                         child: Container(
//                                                           width:
//                                                               double.infinity,
//                                                           child: Center(
//                                                             child: Text(
//                                                               "Kembali",
//                                                               style: TextStyle(
//                                                                   fontSize: 15,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   color: Colors
//                                                                       .blue),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       } else {}
//                                     },
//                                     itemBuilder: (context) {
//                                       return <PopupMenuEntry>[
//                                         const PopupMenuItem(
//                                           value: 'Detail',
//                                           child: Text('Detail'),
//                                         ),
//                                         const PopupMenuItem(
//                                           value: 'Delete',
//                                           child: Text('Delete'),
//                                         ),
//                                       ];
//                                     },
//                                   ),