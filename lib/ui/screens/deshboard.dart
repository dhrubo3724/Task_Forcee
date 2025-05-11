import 'package:flutter/material.dart';

import '../widgets/total_card_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name'),
                  ElevatedButton(onPressed: () {}, child: Icon(Icons.add)),
                ],
              ),
              SizedBox(height: 10),
              TotalCard(),
              SizedBox(height: 10),
              Text(
                'Members',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int index) => MemberCard(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: Colors.blue,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(onPressed: () {}, child: Text('Deposit')),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(onPressed: () {}, child: Text('Deposit')),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(onPressed: () {}, child: Text('Deposit')),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(onPressed: () {}, child: Text('Deposit')),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
              SizedBox(width: 10),
              Text('Name'),
            ],
          ),

          SizedBox(width: 10),
          Padding(padding: const EdgeInsets.all(8.0), child: Text('৳ 2000.00')),
        ],
      ),
    );
  }
}
