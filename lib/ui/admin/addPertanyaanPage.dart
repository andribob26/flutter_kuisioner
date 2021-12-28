import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/controllers/pertanyaanController.dart';

class AddPertanyaanPage extends StatefulWidget {
  @override
  _AddPertanyaanPageState createState() => _AddPertanyaanPageState();
}

class _AddPertanyaanPageState extends State<AddPertanyaanPage> {
  final MainController mainC = Get.find();
  final PertanyaanController _ = Get.find();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> pertanyaanList = [null];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isi Kuisioner"),
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Judul Kuisioner',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                // name textfield
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (v) {
                      if (v.trim().isEmpty) return 'Please enter something';
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add Pertanyaan',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                ..._getFriends(),
                SizedBox(
                  height: 40,
                ),

                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Container(
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
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    mainC.loading.value = !mainC.loading.value;
                                    print(pertanyaanList);
                                    _.simpanPertanyaan(
                                        _nameController.text, pertanyaanList);
                                    pertanyaanList = [null];
                                  }
                                  // // print(_.pilih.value.values);
                                  // List idPertanyaan =
                                  //     _.pilih.value.keys.toList();
                                  // List hasil = _.pilih.value.values.toList();

                                  // _.simpanKuis(namaDosen, idPertanyaan, hasil);
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Simpan",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// get firends text-fields
  List<Widget> _getFriends() {
    List<Widget> pertanyaanTextFields = [];
    for (int i = 0; i < pertanyaanList.length; i++) {
      pertanyaanTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: PertanyaanTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == pertanyaanList.length - 1, i),
          ],
        ),
      ));
    }
    return pertanyaanTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          pertanyaanList.insert(0, null);
        } else
          pertanyaanList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PertanyaanTextFields extends StatefulWidget {
  final int index;
  PertanyaanTextFields(this.index);
  @override
  _PertanyaanTextFieldsState createState() => _PertanyaanTextFieldsState();
}

class _PertanyaanTextFieldsState extends State<PertanyaanTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          _AddPertanyaanPageState.pertanyaanList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) =>
          _AddPertanyaanPageState.pertanyaanList[widget.index] = v,
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
