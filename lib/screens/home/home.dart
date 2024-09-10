import 'package:character_app/screens/create/create.dart';
import 'package:character_app/screens/home/character_card.dart';
import 'package:character_app/services/character_store.dart';
import 'package:character_app/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    Provider.of<CharacterStore>(context, listen: false)
     .fetchCharactersOnce();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: 'Your Characters'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return CharacterCard(character: value.characters[index],);
                    },
                  );
                }
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const CreateScreen(),
                ));
                },
              child: const StyledHeadline(text: 'Create New Character')),
          ],
        ),
      ),
    );
  }
}
