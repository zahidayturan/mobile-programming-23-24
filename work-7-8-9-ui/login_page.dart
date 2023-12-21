import 'package:flutter/material.dart';
import 'package:mobile_odev_2/item_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  bool _passwordVisible = false;
  void initState() {
    _passwordVisible = false;
  }
  final _formKeyUserName = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        toolbarHeight: 50,
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: Center(
          child: buildText(context, "New User? Create Account",
              Colors.black, 15, FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: size.height-100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      "assets/logo.png",
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildTextFormField(
                        context, "User Name", _formKeyUserName, userNameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildTextFormField(
                        context, "Email", _formKeyEmail, emailController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildTextFormField(context, "Password",
                        _formKeyPassword, passwordController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildText(context, "Forgot Password",
                        Colors.blue, 15, FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildButton(context, "Login", Colors.white, 18,
                        FontWeight.bold, size),
                  ),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildTextFormField(BuildContext context, String hintText, Key key,
      TextEditingController controller) {
    return Form(
      key: key,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          if (hintText == "Email" && value.contains("@") == false) {
            return 'Please enter correct $hintText';
          }
          if(hintText == "Password" && value.length < 6){
            return "Please enter minimum 6 characters";
          }
          ///bu şekilde validate işlemleri arttırılabilir
          ///veya RegExp ile kapsamlı bir çözüm olabilir
          return null;
        },
        obscureText: hintText == "Password" ? !_passwordVisible : false,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.blueAccent),
            suffixIcon: hintText =="Password" ? IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(_passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark),
            ) : null,
            border: const OutlineInputBorder(borderSide: BorderSide(width: 4))),
      ),
    );
  }

  Widget buildText(BuildContext context, String text, Color color, double size,
      FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size, height: 1, fontWeight: fontWeight),
    );
  }

  Widget buildButton(BuildContext context, String text, Color color,
      double size, FontWeight fontWeight, Size sizeDevice) {
    return ElevatedButton(
      onPressed: () {
        if (_formKeyUserName.currentState!.validate() &&
            _formKeyEmail.currentState!.validate() &&
            _formKeyPassword.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.blueAccent,
                content: Text(
                  'Email : ${emailController
                      .text}\nPassword : ${passwordController.text}',
                  style: const TextStyle(fontSize: 16, height: 1),
                )),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemList(title: userNameController.text)),
          );
        }
      },
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))))),
      child: SizedBox(
        width: sizeDevice.width / 2,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                height: 1,
                fontWeight: fontWeight,
                color: color,
                fontSize: size),
          ),
        ),
      ),
    );
  }
}