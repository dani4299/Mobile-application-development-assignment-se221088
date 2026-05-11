import 'package:flutter/material.dart';
import 'utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Variables to hold dropdown choice
  String selectedGender = 'Male'; 
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  void tryRegister() {
    if (_formKey.currentState!.validate()) {
      // ROUTING: Pop goes back to the previous screen (Login)
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: MyUtils.checkEmpty,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: MyUtils.checkEmpty,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                validator: MyUtils.checkPassword,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              
              // DROPDOWN WIDGET
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: genderOptions.map((String choice) {
                  return DropdownMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // SETSTATE USAGE
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: "Gender"),
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: tryRegister,
                child: const Text("SIGN UP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}