import 'package:flutter/material.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // A simple list of data to satisfy the 'l' (ListView) requirement
  final List<String> mySubjects = const [
    "Mobile App Development",
    "Software Re-engineering",
    "Management Information Systems (MIS)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Dashboard"),
        actions: [
          // ROUTING & WIDGET USAGE: btn (Logout button)
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Yeet the user back to the Login Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            // WIDGET USAGE: txt
            child: Text(
              "Welcome back, Daniyal!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            "Here are your classes:",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          
          // WIDGET USAGE: 'l' stands for ListView! 
          // Expanded makes sure the list takes up the rest of the screen
          Expanded(
            child: ListView.builder(
              itemCount: mySubjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.book, color: Colors.blue),
                    title: Text(mySubjects[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Just a simple pop-up message so the button actually does something
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("You tapped on ${mySubjects[index]}")),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}