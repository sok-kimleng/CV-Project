import 'package:flutter/material.dart';

void main() {
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RegisterPage(title: 'Register Form'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool is_password_visible = false;
  bool is_verify_password_visible = false;
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
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Username:   "),
                ),
                SizedBox(width: 300, child: TextField()),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Password:   "),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    //
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          is_password_visible = !is_password_visible;
                          setState(() {});
                        },
                        icon: is_password_visible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: !is_password_visible,
                    obscuringCharacter: "*",
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Verify Password:   "),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    //
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          is_verify_password_visible =
                              !is_verify_password_visible;
                          setState(() {});
                        },
                        icon: is_verify_password_visible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: !is_verify_password_visible,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                OutlinedButton(onPressed: () {}, child: Text("Register")),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
