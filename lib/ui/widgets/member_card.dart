import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required member});

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
