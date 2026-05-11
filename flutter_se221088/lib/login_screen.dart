import 'package:flutter/material.dart';
import 'utils.dart';
import 'auth_controller.dart';
import 'dashboard_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // FORM HANDLING: This key keeps track of our form
  final _formKey = GlobalKey<FormState>();
  
  // CONTROLLER USAGE
  final AuthController _auth = AuthController();

  String myEmail = '';
  String myPassword = '';
  
  // Variables for setState usage
  bool showPassword = false; 
  bool rememberMe = false; // CHECKBOX usage

  void tryLogin() {
    // VALIDATION: Checks all the TextFields inside the Form
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Saves the typed text into our variables
      
      bool isSuccess = _auth.verifyLogin(myEmail, myPassword);
      
      if (isSuccess) {
        // ROUTING: Pushes to the Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // WIDGET USAGE: txt
              TextFormField(
                decoration: const InputDecoration(labelText: "Enter Email"),
                validator: MyUtils.checkEmpty, // Uses our Utils class
                onSaved: (value) => myEmail = value!,
              ),
              TextFormField(
                obscureText: !showPassword, // Hides text if showPassword is false
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  suffixIcon: IconButton(
                    icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      // SETSTATE USAGE: Updates the UI immediately
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
                validator: MyUtils.checkPassword,
                onSaved: (value) => myPassword = value!,
              ),
              // CHECKBOX WIDGET
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (newValue) {
                      setState(() {
                        rememberMe = newValue!;
                      });
                    },
                  ),
                  const Text("Remember Me"),
                ],
              ),
              const SizedBox(height: 20),
              // WIDGET USAGE: btn
              ElevatedButton(
                onPressed: tryLogin,
                child: const Text("LOGIN"),
              ),
              TextButton(
                onPressed: () {
                  // ROUTING: Go to register screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text("Go to Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}