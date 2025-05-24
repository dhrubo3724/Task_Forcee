import 'package:flutter/material.dart';
import 'package:task_force/ui/widgets/total_card_widget.dart';

import '../../models/member.dart';
import '../../models/total_data.dart';
import '../screens/expenses_add_screen.dart';
import 'member_card.dart';

class DashboardContent extends StatelessWidget {
  DashboardContent({super.key});

  final List<Member> members = [
    Member(name: 'Alice', balance: 1500.00),
    Member(name: 'Bob', balance: 2500.00),
    Member(name: 'Charlie', balance: 1000.00),
    Member(name: 'David', balance: 3000.00),
    Member(name: 'Eve', balance: 2000.00),
  ];

  final TotalData totalData = TotalData(
    totalBalance: 10000.00,
    totalDeposit: 12000.00,
    totalExpense: 2000.00,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Welcome User'), // Example dynamic text
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddExpenseScreenUIOnly(),
                      ),
                    );
                  },

                  child: Text('Add +'),
                ),
              ],
            ),
            SizedBox(height: 10),
            TotalCard(totalData: totalData), // Passing total data
            SizedBox(height: 10),
            Text(
              'Members',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: members.length, // Using the actual number of members
                itemBuilder:
                    (BuildContext context, int index) => MemberCard(
                      member: members[index],
                    ), // Passing member data
              ),
            ),
          ],
        ),
      ),
    );
  }
}
