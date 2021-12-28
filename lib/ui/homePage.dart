import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/ui/pertanyaanPage.dart';
import 'package:kuisioner/utils/search.dart';

class HomePage extends StatelessWidget {
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
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(PertanyaanPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/tes.jpg"),
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            Align(
                                alignment: Alignment(0.8, -0.9),
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 30,
                                  color: Colors.blue,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      child: Text(
                        "tessss",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "200 Response",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
