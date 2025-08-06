// • Upcoming maintenance list• “Soon” calendar strip• Quick-log chips (last 3 assets)• Health badges (green / amber / red)
// App bar: • 🔍 Search all assets• 🤖 AI-assist (optional icon)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_tracker_app/widgets/equipment_card.dart'
    show EquipmentCard;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Searchbox
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: CupertinoSearchTextField(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        placeholder: "Ask a question",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  // Calendar
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height:
                              300, // adjust this value to make the card larger or smaller
                          child: Card.filled(
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Upcoming maintenance',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'CALENDAR HERE',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'Show next upcoming task here as a small bar',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
            // Upcoming maintenance
            Padding(
              padding: EdgeInsetsGeometry.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Upcoming Maintenance",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // Cards for Vehicles
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.73,
                    ),
                    itemBuilder: (context, index) =>
                        EquipmentCard(title: "BMW"),
                    itemCount: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
