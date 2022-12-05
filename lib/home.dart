import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:project_x/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> datag;
  @override
  void initState() {
    super.initState();

    datag = my_data();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> my_data() {
    return FirebaseFirestore.instance.collection("pro").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: datag,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("data not found"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Text("Loading"),
              ),
            );
          }
          return Scaffold(
            backgroundColor: HexColor("#0d1927"),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: HexColor("#0d1927"),
              title: Text(
                " Zylu Business Solutions Employees",
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: HexColor("#122231"),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Employees Activity",
                                    style: TextStyle(color: Colors.white24),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot snap1) {
                        Map<String, dynamic> data =
                            snap1.data() as Map<String, dynamic>;
                    
                        return Column(
                          children: [
                            (data['status'] == "Active" &&
                                    int.parse(data['years']) > 5)
                                ? Card(
                                    color: HexColor("#0d1927"),
                                    elevation: 2,
                                    shadowColor: Colors.white,
                                    child: ListTile(
                                      trailing: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text("${data['status']}")),
                                      ),
                                      leading: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage("${data['image']}")),
                                      title: Text(
                                        "${data['name'].toString().toUpperCase()}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      subtitle: Text(
                                        "Joined ${data['years']} years ago",
                                        style: TextStyle(
                                            color: Colors.white38, fontSize: 13),
                                      ),
                                    ),
                                  )
                                : Card(
                                    color: HexColor("#0d1927"),
                                    elevation: 2,
                                    shadowColor: Colors.white,
                                    child: ListTile(
                                      trailing: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text("${data['status']}")),
                                      ),
                                      leading: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage("${data['image']}")),
                                      title: Text(
                                        "${data['name'].toString().toUpperCase()}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      subtitle: Text(
                                        "Joined ${data['years']} years ago",
                                        style: TextStyle(
                                            color: Colors.white38, fontSize: 13),
                                      ),
                                    ),
                                  )
                          ],
                        );
                      }).toList()),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
