// lib/features/transactions/screens/add_expense_screen_ui_only.dart
// (Create this file in your project)

import 'package:flutter/material.dart';

class AddExpenseScreenUIOnly extends StatelessWidget {
  const AddExpenseScreenUIOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text('Add New Expense'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- Title Field ---
            TextFormField(
              // controller: _titleController, // No controller
              decoration: const InputDecoration(
                labelText: 'Expense Title*',
                hintText: 'e.g., Lunch, Coffee, Movie tickets',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
              // validator: (value) { ... }, // No validator
            ),
            const SizedBox(height: 16),

            // --- Amount Field ---
            TextFormField(
              // controller: _amountController, // No controller
              decoration: const InputDecoration(
                labelText: 'Amount*',
                hintText: 'e.g., 15.50',
                prefixIcon: Icon(Icons.monetization_on_outlined),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              // validator: (value) { ... }, // No validator
            ),
            const SizedBox(height: 16),

            // --- Category Dropdown ---
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Category*',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category_outlined),
              ),
              // value: _selectedCategory, // No state for selected value
              hint: const Text('Select a category'),
              isExpanded: true,
              items:
                  [
                    // Static example items for UI display
                    'Food & Drinks',
                    'Groceries',
                    'Housing',
                    'Transportation',
                    'Utilities',
                    'Health & Wellness',
                    'Entertainment',
                    'Shopping',
                    'Education',
                    'Other',
                  ].map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                // setState(() { _selectedCategory = newValue; }); // No state change
                print('Category changed to: $newValue (UI only)');
              },
              // validator: (value) { ... }, // No validator
            ),
            const SizedBox(height: 16),

            // --- Date Picker ---
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date*',
                hintText: 'Select a date', // Or display a static date for UI
                // initialValue: DateFormat.yMMMd().format(DateTime.now()), // Example static display
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.calendar_month_outlined),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit_calendar_outlined),
                  onPressed: () {
                    // _pickDate(context); // No date picking logic
                    print('Date picker icon tapped (UI only)');
                  },
                  tooltip: 'Change Date',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Description Field (Optional) ---
            TextFormField(
              // controller: _descriptionController, // No controller
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'e.g., Meeting with client, Birthday gift',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.notes_outlined),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // --- Submit Button ---
            ElevatedButton.icon(
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              label: const Text(
                'Add Expense',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // _submitExpense(); // No submission logic
                print('Add Expense button tapped (UI only)');
              },
              // style: ElevatedButton.styleFrom( ... ), // Apply theme styling if needed
            ),
          ],
        ),
      ),
    );
  }
}
