import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print("Амжилттай");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's sign you in",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 44,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Text(
                  "You have been missed!",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _phoneCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Нэвтрэх нэр оруулна уу!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Утасны дугаар"),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Нууц үг оруулна уу!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Нууц үг"),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: _onSubmit,
                child: Text("Нэвтрэх"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
