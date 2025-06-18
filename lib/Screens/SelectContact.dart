import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:chatapp/Screens/IndividualPage.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "A full stack developer", id: 1),
    ChatModel(name: "Balram", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Flutter Developer...........", id: 2),
    ChatModel(name: "Saket", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Web developer...", id: 3),
    ChatModel(name: "Bhanu Dev", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "App developer....", id: 4),
    ChatModel(name: "Collins", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Raect developer..", id: 5),
    ChatModel(name: "Kishor", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Full Stack Web", id: 6),
    ChatModel(name: "Testing1", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Example work", id: 7),
    ChatModel(name: "Testing2", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Sharing is caring", id: 8),
    ChatModel(name: "Divyanshu", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: ".....", id: 9),
    ChatModel(name: "Helper", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "Love you Mom Dad", id: 10),
    ChatModel(name: "Tester", icon: "person.svg", isGroup: false, time: "", currentMessage: "", status: "I find the bugs", id: 11),
  ];
  String searchQuery = "";
  final ChatModel currentUser = ChatModel(
    name: "You",
    icon: "person.svg",
    isGroup: false,
    time: "",
    currentMessage: "",
    status: "Online",
    id: 0,
  );

  void _addContact(String name, String status) {
    final exists = contacts.any((c) => c.name.toLowerCase() == name.toLowerCase());
    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contact "$name" already exists!')),
      );
      return;
    }
    setState(() {
      contacts.add(ChatModel(
        name: name,
        icon: "person.svg",
        isGroup: false,
        time: "",
        currentMessage: "",
        status: status,
        id: contacts.length + 1,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredContacts = searchQuery.isEmpty
        ? contacts
        : contacts.where((c) => c.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${contacts.length} contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => CreateGroup()));
                    },
                    child: ButtonCard(
                      icon: Icons.group,
                      name: "New group",
                    ),
                  );
                } else if (index == 1) {
                  return ButtonCard(
                    icon: Icons.person_add,
                    name: "New contact",
                  );
                }
                final contact = filteredContacts[index - 2];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualPage(
                          chatModel: contact,
                          sourchat: currentUser,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey[200],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        contact.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contact.status),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String newName = "";
          String newStatus = "";
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add New Contact"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Name"),
                      onChanged: (value) => newName = value,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Status"),
                      onChanged: (value) => newStatus = value,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (newName.isNotEmpty && newStatus.isNotEmpty) {
                        _addContact(newName, newStatus);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
