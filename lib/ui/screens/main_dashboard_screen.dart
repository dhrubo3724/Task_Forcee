import 'package:flutter/material.dart';

import '../widgets/card_header.dart';

class MainDashboardScreens extends StatefulWidget {
  // Renamed class
  const MainDashboardScreens({super.key});

  @override
  State<MainDashboardScreens> createState() => _MainDashboardScreensState();
}

class _MainDashboardScreensState extends State<MainDashboardScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ProfileAppBar(title: 'Dashboard'), // Using the ProfileAppBar widget with a title
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 340, child: CardHeader()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'see all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text('Today', style: TextStyle(fontSize: 14)),
                  trailing: Text(
                    '৳ 500.00',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
