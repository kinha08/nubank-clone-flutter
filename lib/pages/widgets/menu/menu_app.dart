import 'package:flutter/material.dart';
import 'package:nubankclone/pages/widgets/menu/item_menu.dart';

class MenuApp extends StatelessWidget {
  final bool showMenu;

  const MenuApp({Key? key, required this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: !showMenu ? 0 : 1,
          child: Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.58,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Link_pra_pagina_principal_da_Wikipedia-PT_em_codigo_QR_b.svg/1200px-Link_pra_pagina_principal_da_Wikipedia-PT_em_codigo_QR_b.svg.png',
                      height: 100,
                      color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text.rich(
                      TextSpan(text: 'Banco ', children: [
                        TextSpan(
                            text: '260 - Nu Pagamentos S.A.',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text.rich(
                      TextSpan(text: 'Agência ', children: [
                        TextSpan(
                            text: '0001',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text.rich(
                      TextSpan(text: 'Conta ', children: [
                        TextSpan(
                            text: '000000-0',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const ItemMenu(
                            icon: Icons.info_outline, text: 'Me ajuda'),
                        const ItemMenu(
                            icon: Icons.person_outline, text: 'Perfil'),
                        const ItemMenu(
                            icon: Icons.settings_outlined,
                            text: 'Configurar conta'),
                        const ItemMenu(
                            icon: Icons.credit_card_outlined,
                            text: 'Configurar Cartão'),
                        const ItemMenu(
                            icon: Icons.store_outlined, text: 'Pedir conta PJ'),
                        const ItemMenu(
                            icon: Icons.phone_android_outlined,
                            text: 'Configurações do app'),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.7, color: Colors.white54)),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.purple[800]),
                                  elevation: MaterialStateProperty.all(0)),
                              child: const Text('SAIR DO APP',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10))),
                        )
                      ],
                    ),
                  )
                ]),
              ))),
    );
  }
}
