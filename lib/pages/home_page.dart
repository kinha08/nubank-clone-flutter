import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nubankclone/pages/widgets/bottom_menu/bottom_menu.dart';
import 'package:nubankclone/pages/widgets/menu/menu_app.dart';
import 'package:nubankclone/pages/widgets/my_app_bar.dart';
import 'package:nubankclone/pages/widgets/page_view/my_dots_app.dart';
import 'package:nubankclone/pages/widgets/page_view/page_view_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;
  late int _currentIndex;
  late double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    _yPosition = -1;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == -1) {
      _yPosition = _screenHeight * 0.20 + MediaQuery.of(context).padding.top;
    }
    return Scaffold(
        backgroundColor: Colors.purple[800],
        body: Stack(alignment: Alignment.topCenter, children: [
          MyAppBar(
              showMenu: _showMenu,
              onTap: () {
                setState(() {
                  _showMenu = !_showMenu;
                  _yPosition = _showMenu
                      ? _screenHeight * 0.75 +
                          MediaQuery.of(context).padding.top
                      : _screenHeight * 0.20 +
                          MediaQuery.of(context).padding.top;
                });
              }),
          MenuApp(
            showMenu: _showMenu,
          ),
          BottomMenu(showMenu: _showMenu),
          MyDotsApp(
            showMenu: _showMenu,
            top: _screenHeight * 0.78,
            currentIndex: _currentIndex,
          ),
          PageViewApp(
            showMenu: _showMenu,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            top: _yPosition,
            // !_showMenu
            //     ? _screenHeight * 0.20 + MediaQuery.of(context).padding.top
            //     : _screenHeight * 0.75 + MediaQuery.of(context).padding.top,
            onPanUpdate: (details) {
              double positionBottomLimit =
                  _screenHeight * 0.75 + MediaQuery.of(context).padding.top;
              double positionTopLimit =
                  _screenHeight * 0.20 + MediaQuery.of(context).padding.top;
              double middlePosition = positionBottomLimit - positionTopLimit;
              middlePosition = middlePosition / 2;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + middlePosition - 120
                          ? positionBottomLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition =
                      _yPosition < positionBottomLimit - middlePosition + 50
                          ? positionTopLimit
                          : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
        ]));
  }
}
