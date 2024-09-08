import 'package:character_app/screens/home/character_card.dart';
import 'package:character_app/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:character_app/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List characters = ['mario', 'luigi', 'peach', 'toad', 'bowser', 'koopa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Characters'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  return CharacterCard(character: characters[index],);
                },
              ),
            ),
            StyledButton(
              onPressed: () {},
              child: const StyledHeadline(text: 'Create New Character')),
          ],
        ),
      ),
    );
  }
}
