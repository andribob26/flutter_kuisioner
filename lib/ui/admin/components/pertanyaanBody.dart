import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/pertanyaanController.dart';
import 'package:kuisioner/models/kuisionerModel.dart';
import 'package:kuisioner/ui/admin/addPertanyaanPage.dart';

class PertanyaanBody extends StatefulWidget {
  @override
  _PertanyaanBodyState createState() => _PertanyaanBodyState();
}

class _PertanyaanBodyState extends State<PertanyaanBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(-0.8, 1),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Get.bottomSheet(_addPertanyaan());
            Get.to(
              AddPertanyaanPage(),
            );
          },
        ),
      ),
      body: GetBuilder<PertanyaanController>(
        init: PertanyaanController(),
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Obx(() {
                    return (_.dataKuisioner.value.isEmpty)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: _.dataKuisioner.value.length,
                            itemBuilder: (context, index) {
                              final kuisioner = _.dataKuisioner.value[index];
                              return Column(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.all(1),
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    child: ListTile(
                                      tileColor: Colors.white,
                                      leading: Icon(
                                        Icons.list_alt,
                                        size: 50,
                                      ),
                                      title: Text(
                                        "${kuisioner.judulKuisioner}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                          "${kuisioner.pertanyaan.length} Pertanyaan"),
                                      trailing: PopupMenuButton(
                                        onSelected: (value) {
                                          if (value == "Detail") {
                                            print("masuk");
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DialogDetailList(
                                                  kuisioner: kuisioner,
                                                );
                                              },
                                            );
                                          } else {
                                            Get.defaultDialog(
                                              title: "Peringatan",
                                              radius: 5,
                                              middleText:
                                                  "Yakin ingin menghapus?",
                                              onConfirm: () {
                                                _.deleteKuisioner(kuisioner.id);
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
                                              value: 'Detail',
                                              child: Text('Detail'),
                                            ),
                                            const PopupMenuItem(
                                              value: 'Delete',
                                              child: Text('Delete'),
                                            ),
                                          ];
                                        },
                                      ),
                                      onTap: () {
                                        // Get.to(IsiKuisPage(),
                                        //     arguments:
                                        //         dosen.namaDosen.toString());
                                      },
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[200],
                                    height: 0,
                                    thickness: 2,
                                    // indent: 20,
                                    endIndent: 0,
                                  ),
                                ],
                              );
                            },
                          );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DialogDetailList extends StatelessWidget {
  final KuisionerModel kuisioner;

  const DialogDetailList({
    Key key,
    @required this.kuisioner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'List Pertanyaan',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300.0, // Change as per your requirement
            child: ListView.builder(
              itemCount: kuisioner.pertanyaan.length,
              itemBuilder: (BuildContext context, int index) {
                final pertanyaan = kuisioner.pertanyaan[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        '${pertanyaan.judulPertanyaan}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 30,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container _addPertanyaan() {
//   final pertanyaanC = Get.find<PertanyaanController>();
//   final TextEditingController pertanyaan = TextEditingController();
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
//               "Tambah Pertanyaan",
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
//                     Text("Pertanyaan :"),
//                     Expanded(
//                         child: TextFormField(
//                       controller: pertanyaan,
//                       maxLines: 5,
//                     )),
//                   ],
//                 ),
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
//                     pertanyaanC.addPertanyaan(pertanyaan: pertanyaan.text);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.only(top: 16, bottom: 16),
//                     width: double.infinity,
//                     child: Center(
//                       child: Text(
//                         "Tambah",
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
