import 'dart:ui';

import 'package:app/src/application.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red.withOpacity(0.1),
          child: GestureDetector(
            onPanStart: provider.start,
            onPanUpdate: provider.update,
            onPanEnd: provider.end,
            child: FittedBox(
              child: CustomPaint(
                size: Size(getWidth(80), getHeight(80)),
                painter: DrawPainter(provider.page),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  final List<List<Offset>> page;

  const DrawPainter(this.page);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    for (final line in page) {
      canvas.drawPoints(PointMode.polygon, line, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
