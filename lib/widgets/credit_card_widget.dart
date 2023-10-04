import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final double totalBalance;
  final double totalIncome;
  final double totalExpenses;

  CreditCardWidget({
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpenses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 320,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(47, 125, 121, 0.3),
            offset: Offset(0, 6),
            blurRadius: 12,
            spreadRadius: 6,
          ),
        ],
        color: const Color.fromARGB(255, 47, 125, 121),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              '\$ ${totalBalance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  icon: Icons.arrow_downward,
                  label: 'Income',
                  amount: totalIncome,
                ),
                _buildInfoColumn(
                  icon: Icons.arrow_upward,
                  label: 'Expenses',
                  amount: totalExpenses,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildInfoColumn({
    required IconData icon,
    required String label,
    required double amount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: const Color.fromARGB(255, 85, 145, 141),
              child: Icon(
                icon,
                color: Colors.white,
                size: 19,
              ),
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '\$ ${amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

