class ReportItem {
  final String title;
  final String description;
  final DateTime date;
  final double amount; // Example: could be a value related to the report

  ReportItem({
    required this.title,
    required this.description,
    required this.date,
    required this.amount,
  });
}
