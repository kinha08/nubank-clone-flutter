import 'package:flutter/material.dart';
import 'package:nubankclone/pages/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;
  const BottomMenu({Key? key, required this.showMenu}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150, end: 150);
    delayAnimation();
  }

  Future<void> delayAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _tween = Tween<double>(begin: 150, end: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 150),
        curve: Curves.bounceOut,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            left: value,
            right: value * -1,
            bottom: 0,
            child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.bottomCenter,
                child: IgnorePointer(
                  ignoring: widget.showMenu,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.showMenu ? 0 : 1,
                    child: Container(
                      height: 100,
                      color: Colors.purple[800],
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ItemMenuBottom(
                                icon: Icons.person_add_alt_1,
                                text: 'Indicar amigos'),
                            ItemMenuBottom(
                                icon: Icons.phone_android,
                                text: 'Recarga de celular'),
                            ItemMenuBottom(icon: Icons.chat, text: 'Cobrar'),
                            ItemMenuBottom(
                                icon: Icons.monetization_on,
                                text: 'Empréstimos'),
                            ItemMenuBottom(
                                icon: Icons.move_to_inbox, text: 'Depositar'),
                            ItemMenuBottom(
                                icon: Icons.mobile_screen_share,
                                text: 'Transferir'),
                            ItemMenuBottom(
                                icon: Icons.format_align_center,
                                text: 'Ajustar limite'),
                            ItemMenuBottom(
                                icon: Icons.chrome_reader_mode, text: 'Pagar'),
                            ItemMenuBottom(
                                icon: Icons.lock, text: 'Bloquear cartão'),
                          ]),
                    ),
                  ),
                )),
          );
        });
  }
}
