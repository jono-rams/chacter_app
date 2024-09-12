import 'package:character_app/models/character.dart';
import 'package:character_app/shared/styled_text.dart';
import 'package:character_app/theme.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // available points
          Container(
              color: AppColors.secondaryColor,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.star,
                      color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const StyledText(text: 'Stat points available:'),
                  const Expanded(child: SizedBox()),
                  StyledHeadline(text: widget.character.points.toString())
                ],
              )
          ),

          // stats table
          Table(
              children: widget.character.statsAsFormattedList.map((stat) {
                return TableRow(
                    decoration: BoxDecoration(color: AppColors.secondaryColor.withOpacity(0.5)),
                    children: [

                      // stat title (e.g. health)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StyledHeadline(text: stat['title']!),
                        ),
                      ),

                      // stat value
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StyledHeadline(text: stat['value']!),
                        ),
                      ),

                      // icon to increase stat
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_upward, color: AppColors.textColor),
                          onPressed: () {
                            setState(() {
                              widget.character.increaseStat(stat['title']!);
                              turns += 0.5;
                            });
                          },
                        ),
                      ),

                      // icon to decrease stat
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: GestureDetector(
                          child: const Icon(Icons.arrow_downward, color: AppColors.textColor),
                          onTap: () {
                            setState(() {
                              widget.character.decreaseStat(stat['title']!);
                              turns -= 0.5;
                            });
                          },
                        ),
                      ),

                    ]
                );
              }).toList()
          ),
        ],
      ),
    );
  }
}
