import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, required this.message, required this.time}) : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Bubble tail
              Positioned(
                left: -8,
                bottom: 0,
                child: CustomPaint(
                  painter: _BubbleTailPainter(color: Color(0xfff0f0f0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 60,
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
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  final Color color;
  _BubbleTailPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(8, 6);
    path.lineTo(8, -6);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
