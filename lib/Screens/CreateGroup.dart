import 'package:chatapp/CustomUI/AvtarCard.dart';
import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF128C7E),
            onPressed: () {},
            child: Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupmember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupmember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupmember.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }
}
