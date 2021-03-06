import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  final Widget? child;

  const CardApp({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: child,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      ),
    );
  }
}
