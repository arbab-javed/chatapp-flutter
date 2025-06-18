class ChatModel {
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
  bool select;
  final int id;
  ChatModel({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.status,
    this.select = false,
    required this.id,
  });
}
