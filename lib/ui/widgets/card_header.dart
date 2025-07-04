import 'package:flutter/material.dart';
import 'package:task_force/ui/widgets/total_card_widget.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.blue, // Background color for the body
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20,
                  ), // Circular radius for top-left
                  bottomRight: Radius.circular(
                    20,
                  ), // Circular radius for top-right
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [BoxShadow(color: Colors.black26)],

                          // Background color for the header
                        ),
                        child: Icon(Icons.notification_add_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 150,
          left: 50,

          child: SizedBox(height: 190, width: 310, child: TotalCard()),
        ),
      ],
      // child: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //   ),
      //   child: DashboardContent(
      //     // Pass the list of members to the DashboardContent widget
      //   ),
      // ),
    );
  }
}
