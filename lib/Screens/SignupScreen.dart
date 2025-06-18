import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import '../Model/UserModel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _obscureText = true;
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f6fa),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.blueGrey[100],
                child: Icon(Icons.person_add, size: 48, color: Colors.teal[700]),
              ),
              SizedBox(height: 16),
              Text('Create Account', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal[800])),
              SizedBox(height: 8),
              Text('Sign up to get started', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              SizedBox(height: 32),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 24),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'Enter your name' : null,
                          onChanged: (value) => name = value,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
                          onChanged: (value) => email = value,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          obscureText: _obscureText,
                          validator: (value) => value == null || value.length < 6 ? 'Password must be at least 6 characters' : null,
                          onChanged: (value) => password = value,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          obscureText: _obscureText,
                          validator: (value) => value != password ? 'Passwords do not match' : null,
                          onChanged: (value) => confirmPassword = value,
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[700],
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Prevent duplicate emails
                                final exists = users.any((u) => u.email == email);
                                if (exists) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Email already exists!')),
                                  );
                                  return;
                                }
                                users.add(UserModel(
                                  name: name,
                                  email: email,
                                  password: password,
                                  id: users.length + 1,
                                ));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              }
                            },
                            child: Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text('Already have an account? Login', style: TextStyle(color: Colors.teal[700], fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
} 