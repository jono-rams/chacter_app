import 'package:character_app/models/character.dart';
import 'package:character_app/screens/profile/skill_list.dart';
import 'package:character_app/screens/profile/stats_table.dart';
import 'package:character_app/services/character_store.dart';
import 'package:character_app/shared/styled_button.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:character_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(text: character.name)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // basic info - image, vocation, description
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset('assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeadline(text: character.vocation.title),
                        StyledText(text: character.vocation.description),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // weapon and ability
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryColor
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeadline(text: 'Slogan'),
                    StyledText(text: character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeadline(text: 'Weapon of Choice'),
                    StyledText(text: character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeadline(text: 'Unique Ability'),
                    StyledText(text: character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                  children: [
                    StatsTable(character),
                    SkillList(character),
                  ],
              ),
            ),

            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                 .saveCharacter(character);

                // show snackbar
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: StyledHeadline(text: 'Character saved.'),
                  showCloseIcon: true,
                  backgroundColor: AppColors.secondaryColor,
                  duration: Duration(seconds: 2),
                ));
              },
              child: const StyledHeadline(text: 'Save Character')),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
