import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_001/application.dart';
import 'package:project_001/firebase_options.dart';
import 'package:project_001/register.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    print("Firebase Initialized");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool is_password_visible = false;

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //create collection
    // await db.collection("collection_test").doc("init").set({});

    //delete collection
    // await db.collection("collection_test").doc("init").delete();

    db.collection("collection_credentials").doc("init").set({});

    db.collection("collection_credentials").add({
      "username": "admin",
      "password": "admin",
    });
    db.collection("collection_credentials").add({
      "username": "user",
      "password": "pass",
    });
    db.collection("collection_credentials").get().then((q) {
      for (var doc in q.docs) {
        print(doc.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Spacer(),
                Text("Username:  "),
                SizedBox(width: 300, child: TextField()),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text("Password:   "),
                SizedBox(
                  width: 300,
                  child: TextField(
                    //
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          //
                          is_password_visible = !is_password_visible;
                          setState(() {});
                        },
                        icon: is_password_visible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: !is_password_visible,
                    obscuringCharacter: '*',
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ApplicationPage(title: "Application Form"),
                      ),
                    );
                  },
                  child: Text("Login"),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage(title: "Register Form"),
                      ),
                    );
                  },
                  child: Text("Register"),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
