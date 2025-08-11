import 'package:flutter/material.dart';
import 'package:maintenance_tracker_app/widgets/neu_container.dart';

class EquipmentCard extends StatelessWidget {
  final String title;

  const EquipmentCard({super.key, required this.title});

  Widget neuCard(Widget content) =>
      Neu(radius: 14, depth: 3, color: Colors.lime.shade400, child: content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 180, // only fix the width
        child: neuCard(
          Column(
            mainAxisSize: MainAxisSize.min, // height wraps content
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1st row: icons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.directions_car_filled_sharp, size: 35),
                    Icon(
                      Icons.check_circle,
                      size: 35,
                      color: Theme.of(context).colorScheme.primaryFixedDim,
                    ),
                  ],
                ),
              ),
              // 2nd row: title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),

              // 3rd row: mileage
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Flexible(
                    child: Text(
                      "180,000 miles",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Divider(),
              // 4th row: upcoming task
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Flexible(
                      child: Text(
                        "Change oil in X days dfrerferferfrferfre",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // 5th row: action button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      "Last updated: \n04 Aug 2025",
                      style: Theme.of(context).textTheme.labelSmall,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: null,
                    alignment: Alignment.center,
                    icon: LayoutBuilder(
                      builder: (ctx, constraints) => const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(Icons.add, size: 35),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
