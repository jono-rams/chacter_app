import 'package:character_app/models/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  static final ref = FirebaseFirestore.instance
    .collection('characters')
    .withConverter(
      fromFirestore: Character.fromFirestore,
      toFirestore: (Character c, _) => c.toFirestore()
    );

  // add a new character
  static Future<void> addCharacter(Character c) async {
    await ref.doc(c.id).set(c);
  }

  // get character once
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  // update a character
  static Future<void> updateCharacter(Character c) async {
    await ref.doc(c.id).update({
      'stats' : c.statsAsMap,
      'points' : c.points,
      'skills' : c.skills.map((s) => s.id).toList(),
      'isFav' : c.isFav,
    });
  }

  // delete a character
  static Future<void> deleteCharacter(Character c) async {
    await ref.doc(c.id).delete();
  }

}