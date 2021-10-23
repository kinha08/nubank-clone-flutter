import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyAppBar({Key? key, required this.showMenu, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        GestureDetector(
          onTap: onTap,
          child: Container(
              color: Colors.purple[800],
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/nubank-logo.png',
                        height: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Lucas Nobre',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18))
                    ],
                  ),
                  Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
                ],
              )),
        ),
      ],
    );
  }
}
