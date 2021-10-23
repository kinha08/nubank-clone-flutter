import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondCard extends StatefulWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  State<SecondCard> createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard>
    with AutomaticKeepAliveClientMixin {
  bool _showState = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
                child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.attach_money, color: Colors.grey[400]),
                              const SizedBox(width: 5),
                              Text('Conta',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showState = !_showState;
                              });
                            },
                            child: SvgPicture.asset(
                                !_showState
                                    ? 'assets/icons/eye-off.svg'
                                    : 'assets/icons/eye.svg',
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Saldo disponível',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                              _showState
                                  ? const Text.rich(
                                      TextSpan(
                                        text: 'R\$ 2500,00',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22))
                                  : Container(
                                      width: 150,
                                      height: 32,
                                      color: Colors.grey[400]),
                            ]),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                )),
              ],
            )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const [
                    Icon(Icons.credit_card, color: Colors.grey),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                          'Compra mais recente no supermercado no valor de R\$ 27,47',
                          style: TextStyle(color: Colors.black)),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
