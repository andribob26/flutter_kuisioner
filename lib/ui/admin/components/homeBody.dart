import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/dosenController.dart';
import 'package:kuisioner/utils/indicatorChart.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DosenController>(
        init: DosenController(),
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Obx(() {
                    return (_.dataDosen.value.isEmpty)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: _.dataDosen.value.length,
                            itemBuilder: (context, index) {
                              final dosen = _.dataDosen.value[index];
                              int sangatBaik = 0;
                              int baik = 0;
                              int cukup = 0;
                              int kurang = 0;
                              int sangatKurang = 0;
                              for (int i = 0; i < dosen.kuisioner.length; i++) {
                                for (int j = 0;
                                    j < dosen.kuisioner[i].hasilKuis.length;
                                    j++) {
                                  if (dosen.kuisioner[i].hasilKuis[j].sangatBaik
                                      .isNull) {
                                    sangatBaik = 0;
                                  } else {
                                    sangatBaik += dosen
                                        .kuisioner[i].hasilKuis[j].sangatBaik;
                                  }
                                  if (dosen
                                      .kuisioner[i].hasilKuis[j].baik.isNull) {
                                    baik = 0;
                                  } else {
                                    baik +=
                                        dosen.kuisioner[i].hasilKuis[j].baik;
                                  }
                                  if (dosen
                                      .kuisioner[i].hasilKuis[j].cukup.isNull) {
                                    cukup = 0;
                                  } else {
                                    cukup +=
                                        dosen.kuisioner[i].hasilKuis[j].cukup;
                                  }
                                  if (dosen.kuisioner[i].hasilKuis[j].kurang
                                      .isNull) {
                                    kurang = 0;
                                  } else {
                                    kurang +=
                                        dosen.kuisioner[i].hasilKuis[j].kurang;
                                  }
                                  if (dosen.kuisioner[i].hasilKuis[j]
                                      .sangatKurang.isNull) {
                                    sangatKurang = 0;
                                  } else {
                                    sangatKurang += dosen
                                        .kuisioner[i].hasilKuis[j].sangatKurang;
                                  }
                                }
                              }

                              int kinerjaB = sangatBaik + baik + cukup;
                              int kinerjaK = kurang + sangatKurang;

                              return Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: ExpansionTile(
                                      leading: Icon(
                                        Icons.question_answer,
                                      ),
                                      title: Text(
                                        "${dosen.namaDosen}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          title: (kinerjaB > kinerjaK)
                                              ? Text(
                                                  "Kinerja dosen baik",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.green),
                                                )
                                              : Text(
                                                  "Kinerja dosen sangat kurang dan layak di evaluasi",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.red),
                                                ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, bottom: 5),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  textKu(
                                                    textDepan: "Sangat baik : ",
                                                    textBelakang:
                                                        sangatBaik.toString(),
                                                    warna: Colors.green,
                                                  ),
                                                  textKu(
                                                    textDepan: "Baik : ",
                                                    textBelakang:
                                                        baik.toString(),
                                                    warna: Colors.blue,
                                                  ),
                                                  textKu(
                                                    textDepan: "Cukup : ",
                                                    textBelakang:
                                                        cukup.toString(),
                                                    warna: Colors.orange,
                                                  ),
                                                  textKu(
                                                    textDepan: "Kurang : ",
                                                    textBelakang:
                                                        kurang.toString(),
                                                    warna: Colors.red,
                                                  ),
                                                  textKu(
                                                    textDepan:
                                                        "Sangat kurang : ",
                                                    textBelakang:
                                                        sangatKurang.toString(),
                                                    warna: Colors.black,
                                                  ),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   // margin: EdgeInsets.all(1),
                                  //   padding: EdgeInsets.all(10.0),
                                  //   color: Colors.white,
                                  //   child: ListTile(
                                  //     tileColor: Colors.white,
                                  //     leading: Icon(
                                  //       Icons.question_answer,
                                  //       size: 70.0,
                                  //     ),
                                  //     title: Text(
                                  //       "${dosen.namaDosen}",
                                  //       style: TextStyle(
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //     ),
                                  //     subtitle: Padding(
                                  //       padding: const EdgeInsets.only(
                                  //           top: 3, bottom: 5),
                                  //       child: Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           textKu(
                                  //             textDepan: "Sangat baik : ",
                                  //             textBelakang:
                                  //                 sangatBaik.toString(),
                                  //             warna: Colors.green,
                                  //           ),
                                  //           textKu(
                                  //             textDepan: "Baik : ",
                                  //             textBelakang: baik.toString(),
                                  //             warna: Colors.blue,
                                  //           ),
                                  //           textKu(
                                  //             textDepan: "Cukup : ",
                                  //             textBelakang: cukup.toString(),
                                  //             warna: Colors.orange,
                                  //           ),
                                  //           textKu(
                                  //             textDepan: "Kurang : ",
                                  //             textBelakang: kurang.toString(),
                                  //             warna: Colors.red,
                                  //           ),
                                  //           textKu(
                                  //             textDepan: "Sangat kurang : ",
                                  //             textBelakang:
                                  //                 sangatKurang.toString(),
                                  //             warna: Colors.black,
                                  //           ),
                                  //           SizedBox(
                                  //             height: 10,
                                  //           ),
                                  //           (kinerjaB > kinerjaK)
                                  //               ? Text(
                                  //                   "Kinerja dosen baik",
                                  //                   style: TextStyle(
                                  //                       fontSize: 16,
                                  //                       fontWeight:
                                  //                           FontWeight.w600,
                                  //                       color: Colors.green),
                                  //                 )
                                  //               : Text(
                                  //                   "Kinerja dosen sangat kurang dan layak di evaluasi",
                                  //                   style: TextStyle(
                                  //                       fontSize: 16,
                                  //                       fontWeight:
                                  //                           FontWeight.w600,
                                  //                       color: Colors.red),
                                  //                 )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     // trailing: Icon(
                                  //     //   Icons.visibility,
                                  //     // ),
                                  //     onTap: () {
                                  //       // Get.to(IsiKuisPage(),
                                  //       //     arguments:
                                  //       //         dosen.namaDosen.toString());
                                  //     },
                                  //   ),
                                  // ),
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

class textKu extends StatelessWidget {
  final String textDepan;
  final String textBelakang;
  final Color warna;

  const textKu(
      {Key key,
      @required this.textDepan,
      @required this.textBelakang,
      @required this.warna})
      : super(key: key);
  // const textKu({
  //   Key key,
  // }) : super(
  //         key: key,
  //       );

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(style: TextStyle(color: Colors.black54), children: [
      TextSpan(
        text: textDepan,
      ),
      TextSpan(text: textBelakang, style: TextStyle(color: warna)),
    ]));
  }
}
