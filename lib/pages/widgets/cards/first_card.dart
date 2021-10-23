import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.grey[400]),
                          const SizedBox(width: 5),
                          Text('Cartão de Crédito',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
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
                              Text('Fatura Atual'.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold)),
                              const Text.rich(
                                  TextSpan(text: 'R\$ ', children: [
                                    TextSpan(
                                        text: '600',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ',50'),
                                  ]),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 22)),
                              const Text.rich(
                                TextSpan(
                                    text: 'Limite disponível ',
                                    children: [
                                      TextSpan(
                                          text: 'R\$ 2500,00',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal)),
                                    ],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12)),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        color: Colors.transparent,
                        width: 8,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(color: Colors.orange)),
                            Expanded(
                                flex: 1, child: Container(color: Colors.blue)),
                            Expanded(
                                flex: 2, child: Container(color: Colors.green)),
                          ],
                        )),
                  ),
                )
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
                    Icon(Icons.shopping_cart, color: Colors.grey),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                          'Compra mais recente no supermercado no valor de R\$ 115,18',
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
}
