import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final void Function()? onPress;
  MyContainer({this.renk = Colors.white, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: renk),
        margin: EdgeInsets.all(12),
      ),
    );
  }
}
