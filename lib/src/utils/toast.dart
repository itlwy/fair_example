import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum _ToastPosition {
  center,
  top,
  bottom,
}

class Toast {
  static void show(String msg, BuildContext context, {int duration = 1}) {
    _ToastView.dismiss();
    _ToastView.show(msg, context, duration, _ToastPosition.center,
        Color(0xAA000000), Colors.white, 8, null);
  }

  static void showWidget(Widget child, BuildContext context) {
    _ToastView.dismiss();
    _ToastView.showChild(child, context);
  }

  static void showIconToast(String msg, Widget icon, BuildContext context,
      {int duration = 1}) {
    _ToastView.dismiss();
    _ToastView.showIconToast(
      msg,
      icon,
      context,
      duration,
      _ToastPosition.center,
      Color(0xAA000000),
      Colors.white,
      8,
      null,
    );
  }

  static void dismiss() {
    _ToastView.dismiss();
  }
}

class _ToastView {
  static final _ToastView _singleton = _ToastView._internal();

  factory _ToastView() {
    return _singleton;
  }

  _ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void show(
      String msg,
      BuildContext context,
      int duration,
      _ToastPosition position,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => Positioned(
          top: position == _ToastPosition.top ? 50 : null,
          bottom: position == _ToastPosition.bottom ? 50 : null,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(backgroundRadius),
                      border: border,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.fromLTRB(40, 18, 40, 18),
                    child: Text(msg,
                        softWrap: true,
                        style: TextStyle(fontSize: 16, color: textColor)),
                  )),
            ),
          )),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);

    await new Future.delayed(Duration(seconds: duration));
    dismiss();
  }

  static void showChild(Widget child, BuildContext context) {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = Color(0xAA000000);

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => child,
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
  }

  ///上面是图标，下面是文字
  static void showIconToast(
      String msg,
      Widget icon,
      BuildContext context,
      int duration,
      _ToastPosition position,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => Positioned(
          top: position == _ToastPosition.top ? 50 : null,
          bottom: position == _ToastPosition.bottom ? 50 : null,
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  width: 144,
                  height: 128,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xCC000000)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 6),
                        child: icon,
                      ),
                      Text(msg,
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  )),
            ),
          )),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);

    await new Future.delayed(Duration(seconds: duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}
