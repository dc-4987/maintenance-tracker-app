import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final String title;

  const EquipmentCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 180, // only fix the width
        child: Card.filled(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                      Icon(Icons.directions_car_filled_sharp, size: 35),
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
                  children: [
                    Flexible(
                      child: Text(
                        "180,000 miles",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Divider(),
                // 4th row: upcoming task
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Change oil in X days dfrerferferfrferfre", // your longer string
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                // 5th row: action button
                // TODO the button will have options to: be able to mark tasks as done, update usage
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
                        builder: (ctx, constraints) => FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                            size: 35,
                          ),
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
      ),
    );
  }
}
