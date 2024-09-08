import 'package:character_app/models/vocation.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:character_app/theme.dart';
import 'package:flutter/material.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Vocation img
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80.0,
                colorBlendMode: BlendMode.color,
                color: !selected ? Colors.black.withOpacity(0.8) : Colors.transparent,
              ),
              const SizedBox(width: 10.0,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeadline(text: vocation.title),
                    StyledText(text: vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
