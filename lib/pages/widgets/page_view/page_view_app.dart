import 'package:flutter/material.dart';
import 'package:nubankclone/pages/widgets/cards/card_app.dart';
import 'package:nubankclone/pages/widgets/cards/first_card.dart';
import 'package:nubankclone/pages/widgets/cards/second_card.dart';
import 'package:nubankclone/pages/widgets/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int>? onChanged;
  final bool showMenu;
  final GestureDragUpdateCallback? onPanUpdate;

  const PageViewApp(
      {Key? key,
      required this.top,
      this.onChanged,
      this.onPanUpdate,
      required this.showMenu})
      : super(key: key);

  @override
  State<PageViewApp> createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 150.0);
    delayAnimation();
  }

  Future<void> delayAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _tween = Tween<double>(begin: 150.0, end: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 150),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              top: widget.top,
              height: MediaQuery.of(context).size.height * 0.55,
              right: value * -1,
              left: value,
              child: GestureDetector(
                onPanUpdate: widget.onPanUpdate,
                child: PageView(
                  onPageChanged: widget.onChanged,
                  physics: widget.showMenu
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  children: const [
                    CardApp(child: FirstCard()),
                    CardApp(child: SecondCard()),
                    CardApp(child: ThirdCard()),
                  ],
                ),
              ));
        });
  }
}
