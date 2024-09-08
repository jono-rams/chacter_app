import 'package:chacter_app/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:chacter_app/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            const StyledText(text: 'Character List'),
            const StyledHeadline(text: 'Character List'),
            const StyledTitle(text: 'Character List'),
            StyledButton(
              onPressed: () {},
              child: const StyledHeadline(text: 'Create New Character')),
          ],
        ),
      ),
    );
  }
}
