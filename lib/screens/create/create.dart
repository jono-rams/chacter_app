import 'package:character_app/models/character.dart';
import 'package:character_app/models/vocation.dart';
import 'package:character_app/screens/create/vocation_card.dart';
import 'package:character_app/shared/styled_button.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:character_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();

    super.dispose();
  }

  // Handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation)
  {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // Submit handler
  void _handleSubmit() {
    if (_nameController.text.trim().isEmpty)
      {
        // TODO: show error dialog
        return;
      }
    if (_sloganController.text.trim().isEmpty)
      {
        // TODO: show error dialog
        return;
      }

    characters.add(
      Character(
        id: int.parse(uuid.v4()),
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: 'Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome Message
              const Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Welcome, new player'),
              ),
              const Center(
                child: StyledText(text: 'Create a name and slogan for your character'),
              ),
              const SizedBox(height: 30.0,),
          
              // input for name and slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2,
                  ),
                  label: StyledText(text: 'Character name')
                ),
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.chat,
                    ),
                    label: StyledText(text: 'Character slogan')
                ),
              ),
              const SizedBox(height: 30.0,),
          
              // Select vocation title
              const Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Choose a vocation'),
              ),
              const Center(
                child: StyledText(text: 'This determines your available skills'),
              ),
              const SizedBox(height: 30.0,),
          
              // Vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),

              // good luck message
              const Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Good luck!'),
              ),
              const Center(
                child: StyledText(text: 'And enjoy the journey...'),
              ),
              const SizedBox(height: 30.0,),
          
              Center(
                child: StyledButton(
                  onPressed: () {_handleSubmit();},
                  child: const StyledHeadline(text: 'Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
