import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdCard extends StatelessWidget {
  const ThirdCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/gift-outline.svg',
            color: Colors.grey,
            height: 40,
          ),
          Column(
            children: [
              const Text('Nubank Rewards',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                'Acumule ponto que nunca expiram e troque por passagens áreas ou por produtos que vocẽ realmente usa.',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: const Text('ATIVE O SEU REWARDS'),
              ))
        ],
      ),
    );
  }
}
