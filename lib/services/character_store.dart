import 'package:character_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:character_app/models/character.dart';
import 'package:character_app/models/skill.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    List<Skill> availableSkills = allSkills.where((skill) {
      return skill.vocation == character.vocation;
    }).toList();

    character.updateSkill(availableSkills[0]);
    character.saveState();

    FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);

    return;
  }

  // delete character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }

  // initially fetch characters

  void fetchCharactersOnce() async {
    if(_characters.isEmpty) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

}