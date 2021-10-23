import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  const MyDotsApp(
      {Key? key,
      required this.currentIndex,
      required this.top,
      required this.showMenu})
      : super(key: key);

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 7,
                height: 7,
                decoration:
                    BoxDecoration(color: getColor(0), shape: BoxShape.circle)),
            const SizedBox(width: 7),
            AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 7,
                height: 7,
                decoration:
                    BoxDecoration(color: getColor(1), shape: BoxShape.circle)),
            const SizedBox(width: 7),
            AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 7,
                height: 7,
                decoration:
                    BoxDecoration(color: getColor(2), shape: BoxShape.circle)),
          ],
        ),
      ),
    );
  }
}
