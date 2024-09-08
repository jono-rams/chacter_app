import 'package:flutter/material.dart';
import 'package:chacter_app/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});

  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Text(character),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
