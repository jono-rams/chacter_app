import 'package:character_app/models/character.dart';
import 'package:character_app/screens/profile/profile.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:character_app/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${character.vocation.image}',
              width: 80.0,
            ),

            const SizedBox(width: 20.0),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeadline(text: character.name),
                StyledText(text: character.vocation.title),
              ],
            ),

            const Expanded(
              child: SizedBox(),
            ),

            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => Profile(character: character),
                ));
              },
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
