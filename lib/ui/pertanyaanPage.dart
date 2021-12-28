import 'package:flutter/material.dart';

class PertanyaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kuisioner"),
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
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Dosen : OkCoy",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    int no = index + 1;
                    return ListTile(
                      leading: Text("$no"),
                      title: Text(
                          "Lkasjdhakd jahsdkashdalkhdll alsdhalsdhladha aldhaldl?"),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
