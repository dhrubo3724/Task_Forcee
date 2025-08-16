import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_force/module/transactions/data/demo/demo_data_list.dart';

import '../../../transactions/data/models/transaction_model.dart';
import '../../../transactions/presentation/cubit/transaction_cubit.dart';
import '../widget/balance_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  double calculateTotal(List<TransactionModel> txns, bool isIncome) {
    return txns
        .where((txn) => txn.isIncome == isIncome)
        .fold(0.0, (sum, txn) => sum + txn.amount);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TransactionCubit(Hive.box<TransactionModel>('transactions'))
                ..loadTransactions(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<TransactionCubit, List<TransactionModel>>(
            builder: (context, txns) {
              final income = calculateTotal(txns, true);
              final expense = calculateTotal(txns, false);
              final balance = income - expense;

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 380,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Good morning',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Jhon Banega Don',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 200,
                            left: 48,
                            child: BalanceCard(
                              label: 'Total Balance',
                              value: balance,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        // final txn = txns[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person),
                            ),
                            // Container(
                            //   height: 40,
                            //   width: 40,
                            //   color: txn.isIncome ? Colors.green : Colors.red,
                            //   child: Icon(
                            //     txn.isIncome
                            //         ? Icons.arrow_upward
                            //         : Icons.arrow_downward,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ),
                          title: Text(
                            geter()[index].title!,
                            style: TextStyle(color: Colors.blue),
                          ), //Text(txn.title),
                          // subtitle: Text(txn.date.toLocal().toString()),
                          // trailing: Text(
                          //   '৳${txn.amount.toStringAsFixed(2)}',
                          //   style: TextStyle(
                          //     color: txn.isIncome ? Colors.green : Colors.red,
                          //   ),
                          // ),
                          subtitle: Text(
                            geter()[index].date!.toLocal().toString(),
                          ),
                          trailing: Text(
                            geter()[index].amount!.toStringAsFixed(2),
                            style: TextStyle(
                              color:
                                  geter()[index].isIncome!
                                      ? Colors.green
                                      : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onTap: () {
                            // Handle tap event, e.g., navigate to transaction details
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TransactionDetailsScreen(txn),
                            //   ),
                            // );
                          },
                        );
                      },
                      childCount:
                          geter()
                              .length, // Use the actual number of transactions
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
