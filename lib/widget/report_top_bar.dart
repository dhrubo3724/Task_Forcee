import 'package:flutter/material.dart';

class ReportTopBar extends StatefulWidget {
  const ReportTopBar({super.key});

  @override
  State<ReportTopBar> createState() => _ReportTopBarState();
}

class _ReportTopBarState extends State<ReportTopBar> {
  List<bool> isSelected = [true, false]; // Default = Expenses
  String selectedMonth = "June";

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Toggle Buttons for Expenses/Income
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(30),
            isSelected: isSelected,
            fillColor: Colors.black,
            selectedColor: Colors.white,
            color: Colors.black,
            constraints: BoxConstraints(minHeight: 40, minWidth: 100),
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = (i == index);
                }
              });
            },
            children: [Text("Expenses"), Text("Income")],
          ),
        ),
        SizedBox(width: 10),
        // Dropdown for Month
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedMonth,
              icon: Icon(Icons.arrow_drop_down),
              items:
                  months.map((String month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
