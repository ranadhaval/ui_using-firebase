import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_x/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  // User ? user;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signingwithgoogle() async {
    try {
      GoogleSignInAccount? googleSigningAccount = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googl_auth =
          await googleSigningAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googl_auth.accessToken, idToken: googl_auth.idToken);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      Navigator.push(context, MaterialPageRoute(builder: (_) => home()));
    } catch (e) {
      print(e.toString());
    }
  }

  signout() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  // AuthClass auth = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                signout();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: Text("Google login"),
                onPressed: () {
                  signingwithgoogle();
                },
              ),
            ),

            Center(
              child: ElevatedButton(
                child: Text("login"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => home()));
                },
              ),
            ),
            // FirebaseAuth.instance.currentUser!.displayName == null
            //     ?Text("data")
            // Text("${FirebaseAuth.instance.currentUser!.email}")
          ],
        ),
      ),
    );
  }
}
