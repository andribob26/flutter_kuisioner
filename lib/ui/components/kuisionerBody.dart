import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisioner/controllers/kuisionerController.dart';
import 'package:kuisioner/controllers/loadingSearchController.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/ui/isiKuis.page.dart';

class KuisionerBody extends StatefulWidget {
  @override
  _KuisionerBodyState createState() => _KuisionerBodyState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _KuisionerBodyState extends State<KuisionerBody> {
  final box = GetStorage();
  final MainController mainC = Get.find();
  final _debouncer = Debouncer(milliseconds: 100);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<KuisionerController>(
        init: KuisionerController(),
        builder: (_) => Container(
          // color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      hintText: 'Search Contacts',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onChanged: (value) {
                      _debouncer.run(() {
                        mainC.loading.value = !mainC.loading.value;
                        _.searchResult(value);
                      });
                    },
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 0,
                thickness: 3,
                // indent: 20,
                endIndent: 0,
              ),
              Expanded(
                child: Obx(
                  () => (_.dataKuisioner.value.isEmpty || mainC.loading.value)
                      ? Center(
                          child: (mainC.cek.value)
                              ? Text("Tidak di temukan")
                              : CircularProgressIndicator())
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
                                      Icons.book,
                                      size: 50,
                                    ),
                                    title: Text(
                                      "${kuisioner.judulKuisioner}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text("${kuisioner.createdAt}"),
                                    trailing: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    onTap: () {
                                      box.write("id", kuisioner.id);
                                      // _.getProdukById(kuisioner.id);
                                      // print(_.dataKuisionerById);

                                      Get.to(IsiKuisPage());
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
                        ),
                ),
              ),
              // Container(
              //   height: 80,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
