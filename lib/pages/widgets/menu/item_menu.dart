import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  const ItemMenu({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.white54, width: 0.7),
              top: BorderSide(color: Colors.white54, width: 0.7))),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[800]),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(text, style: const TextStyle(fontSize: 12))
              ],
            ),
            const Icon(Icons.chevron_right, size: 16)
          ],
        ),
      ),
    );
  }
}
