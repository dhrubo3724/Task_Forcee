// === lib/widgets/additional_details.dart ===

import 'package:flutter/material.dart';

class AdditionalDetails extends StatelessWidget {
  final VoidCallback onDone;

  const AdditionalDetails({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Field 1',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Field 2',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onDone, child: const Text('Done')),
        ],
      ),
    );
  }
}
