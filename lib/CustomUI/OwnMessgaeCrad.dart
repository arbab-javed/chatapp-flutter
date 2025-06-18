import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message, required this.time}) : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Bubble tail for sent message
              Positioned(
                right: -8,
                bottom: 0,
                child: CustomPaint(
                  painter: _OwnBubbleTailPainter(color: Color(0xffdcf8c6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 16,
                  top: 10,
                  bottom: 16,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 16,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.done_all,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OwnBubbleTailPainter extends CustomPainter {
  final Color color;
  _OwnBubbleTailPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    path.moveTo(8, 0);
    path.lineTo(0, 6);
    path.lineTo(0, -6);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
