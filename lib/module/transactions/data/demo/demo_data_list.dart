import 'package:task_force/module/transactions/data/transaction_model.dart';

List<money> geter() {
  money dhrubo = money();
  dhrubo.title = "Dhrubo";
  dhrubo.amount = 1000.0;
  dhrubo.date = DateTime.now();
  dhrubo.isIncome = true;

  money rahul = money();
  rahul.title = "Rahul";
  rahul.amount = 2000.0;
  rahul.date = DateTime.now().subtract(Duration(days: 1));
  rahul.isIncome = false;

  money siyam = money();
  siyam.title = "Siyam";
  siyam.amount = 1500.0;
  siyam.date = DateTime.now().subtract(Duration(days: 2));
  siyam.isIncome = true;

  money tanvir = money();
  tanvir.title = "Tanvir";
  tanvir.amount = 2500.0;
  tanvir.date = DateTime.now().subtract(Duration(days: 3));
  tanvir.isIncome = true;

  money toha = money();
  toha.title = "toha";
  toha.amount = 3000.0;
  toha.date = DateTime.now().subtract(Duration(days: 4));
  toha.isIncome = false;
  return [dhrubo, rahul, siyam, tanvir, toha];
}
