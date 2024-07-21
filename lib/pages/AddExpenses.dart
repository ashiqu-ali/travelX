import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class AddExpenses extends StatefulWidget {
  final String? initialPerson;
  final List<String> persons; // Accept the list of persons

  const AddExpenses({super.key, this.initialPerson, required this.persons});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenses> {
  String? _selectedCategory;
  String? _selectedPerson;
  double? _amount;
  bool _shareByAll = false;
  bool _isManualPersonEntry = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _personController = TextEditingController();

  final List<String> _categories = ['Food', 'Travel', 'Entertainment'];

  @override
  void initState() {
    super.initState();
    _selectedPerson = widget.initialPerson;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _personController.dispose();
    super.dispose();
  }

  void _showPersonSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Person'),
          children: widget.persons.map((String person) {
            return SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedPerson = person;
                });
                Navigator.pop(context);
              },
              child: Text(person),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'GoogleFonts',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Expense',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'GoogleFonts',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80.0,
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'travelX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.black),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                value: _selectedCategory,
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: _shareByAll,
                    onChanged: (newValue) {
                      setState(() {
                        _shareByAll = newValue!;
                      });
                    },
                  ),
                  const Text('Expense share by all'),
                ],
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                readOnly: true,
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        final formatDate = DateFormat("dd-MM-yyyy").format(date);
                        setState(() {
                          _dateController.text = formatDate;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _isManualPersonEntry
                        ? TextField(
                      decoration: const InputDecoration(
                        labelText: 'Expense by',
                      ),
                      controller: _personController,
                      onChanged: (value) {
                        _selectedPerson = value;
                      },
                    )
                        : DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedPerson,
                      hint: const Text('Select Person'),
                      items: widget.persons.map((String person) {
                        return DropdownMenuItem<String>(
                          value: person,
                          child: Text(person),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedPerson = newValue;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isManualPersonEntry ? Icons.swap_vert : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isManualPersonEntry = !_isManualPersonEntry;
                        if (_isManualPersonEntry) {
                          _personController.clear();
                        } else {
                          _selectedPerson = widget.initialPerson;
                        }
                      });
                    },
                  ),
                ],
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter amount',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _amount = double.tryParse(value);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Save Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'GoogleFonts',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveExpense() {
    // Handle saving the expense
  }
}

void main() => runApp(
  const AddExpenses(
    initialPerson: 'Ashiqu Ali',
    persons: ['Ashiqu Ali', 'Muzzamil', 'Aarabhi'], // Pass the list of persons
  ),
);
