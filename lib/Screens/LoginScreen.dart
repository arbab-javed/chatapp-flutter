import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Dev Stack",
      icon: "person.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "Hi Everyone",
      status: "A full stack developer",
      id: 1,
    ),
    ChatModel(
      name: "Kishor",
      icon: "person.svg",
      isGroup: false,
      time: "13:00",
      currentMessage: "Hi Kishor",
      status: "Flutter Developer...........",
      id: 2,
    ),
    ChatModel(
      name: "Collins",
      icon: "person.svg",
      isGroup: false,
      time: "8:00",
      currentMessage: "Hi Dev Stack",
      status: "Web developer...",
      id: 3,
    ),
    ChatModel(
      name: "Balram Rathore",
      icon: "person.svg",
      isGroup: false,
      time: "2:00",
      currentMessage: "Hi Dev Stack",
      status: "App developer....",
      id: 4,
    ),
    // ChatModel(
    //   name: "NodeJs Group",
    //   icon: "group.svg",
    //   isGroup: true,
    //   time: "2:00",
    //   currentMessage: "New NodejS Post",
    //   status: "Group status...",
    //   id: 5,
    // ),
  ];
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
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
                child: Icon(Icons.lock, size: 48, color: Colors.teal[700]),
              ),
              SizedBox(height: 16),
              Text('Welcome Back!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal[800])),
              SizedBox(height: 8),
              Text('Login to your account', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
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
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
                          onChanged: (value) => email = value,
                        ),
                        SizedBox(height: 18),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          obscureText: true,
                          validator: (value) => value == null || value.length < 6 ? 'Password must be at least 6 characters' : null,
                          onChanged: (value) => password = value,
                        ),
                        SizedBox(height: 28),
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
                                sourceChat = chatmodels[0];
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => Homescreen(
                                              chatmodels: chatmodels,
                                              sourchat: sourceChat,
                                            )));
                              }
                            },
                            child: Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text('Don\'t have an account? Sign Up', style: TextStyle(color: Colors.teal[700], fontWeight: FontWeight.w600)),
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
