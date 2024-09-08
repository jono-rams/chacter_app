import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({required this.text, super.key});

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.bodyMedium
      ),
    );
  }
}

class StyledHeadline extends StatelessWidget {
  const StyledHeadline({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.headlineMedium
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.titleMedium
      ),
    );
  }
}
