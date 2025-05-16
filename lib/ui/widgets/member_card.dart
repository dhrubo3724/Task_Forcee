import 'package:flutter/material.dart';
import 'package:task_force/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member});
  final Member member;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeData.dark().cardColor,
      elevation: 3,
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
              Text(member.name),
            ],
          ),

          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(member.balance.toStringAsFixed(2)),
          ),
        ],
      ),
    );
  }
}
