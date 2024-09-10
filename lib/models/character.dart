import 'package:character_app/models/skill.dart';
import 'package:character_app/models/stats.dart';
import 'package:character_app/models/vocation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Character with Stats {

  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  int pointsCopy = 0;
  Map<String, int> statsCopy = {};

  // getters
  bool get isFav => _isFav;

  // methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // Character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name' : name,
      'slogan' : slogan,
      'isFav' : _isFav,
      'vocation' : vocation.toString(), //"Vocation.{e.g ninja}"
      'skills' : skills.map((s) => s.id).toList(),
      'stats' : statsAsMap,
      'points' : points,
    };
  }

  // Character from firestore
  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      id: snapshot.id,
      vocation: Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((s) => s.id == id);
      character.updateSkill(skill);
    }

    // set isFav
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    // assign stats and points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;

  }

}
