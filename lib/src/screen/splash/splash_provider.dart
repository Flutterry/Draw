import 'package:app/src/application.dart';

class SplashProvider extends ChangeNotifier {
  final page = <List<Offset>>[];

  Offset? lastPoint;

  void start(DragStartDetails details) {}

  void update(DragUpdateDetails details) {
    if (details.localPosition.dx < 0 ||
        details.localPosition.dy < 0 ||
        details.localPosition.dx > getWidth(80) ||
        details.localPosition.dy > getHeight(80)) {
      lastPoint = null;
      return;
    }
    if (lastPoint == null) page.add([]);
    lastPoint = details.localPosition;
    page.last.add(lastPoint!);
    notifyListeners();
  }

  void end(DragEndDetails details) {
    lastPoint = null;
  }
}
