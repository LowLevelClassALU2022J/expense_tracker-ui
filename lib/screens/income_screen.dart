import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/credit_card_widget.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<String> _categories = ['Salary', 'Business', 'Freelance', 'Others'];
  String _selectedCategory = 'Salary';
  final _incomeController = TextEditingController();

  // Hard-coded financial data (to be replaced with dynamic data later on)
  double _totalBalance = 1500.00;
  double _income = 1000.00;
  double _expense = 500.00;

  void _addCategory(String newCategory) {
    if (newCategory.trim().isNotEmpty) {
      setState(() {
        _categories.add(newCategory);
        _selectedCategory = newCategory;
      });
    }
  }

  Future<void> _showAddCategoryDialog() async {
    final TextEditingController _categoryController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: TextFormField(
            controller: _categoryController,
            decoration: const InputDecoration(
              labelText: 'Category Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addCategory(_categoryController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Income'),
        backgroundColor: const Color(0xFF429690),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 170, // Adjust the height as per your requirement
                child: CreditCardWidget(
                  totalBalance: _totalBalance,
                  totalIncome: _income,
                  totalExpenses: _expense,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _incomeController,
                decoration: const InputDecoration(
                  labelText: 'Income Amount',
                  hintText: 'Enter your income',
                  border: OutlineInputBorder(),
                  prefixIcon:
                      Icon(Icons.attach_money, color: Color(0xFF429690)),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    style: const TextStyle(color: Color(0xFF429690)),
                    items: _categories.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  hintText: 'Enter description',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description, color: Color(0xFF429690)),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showAddCategoryDialog,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF429690),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Add New Category'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle the submission of the income data
                  print('Income: ${_incomeController.text}');
                  print('Category: $_selectedCategory');
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF429690),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Add Income'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
