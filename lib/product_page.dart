import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String description;

  const ProductDetailScreen({
    Key? key,
    required this.productName,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.description,
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // States for radio buttons and toggle switches
  String _selectedCupFilling = 'Full';  // Default to 'Full'
  String _selectedMilk = 'Skim Milk';   // Default to 'Skim Milk'
  String _selectedSugar = 'Sugar X1';   // Default to 'Sugar X1'
  bool _isHighPriority = false;         // Default for High Priority

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(widget.productName,style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Hero(
                tag: widget.imageUrl,
                child: Image.asset(widget.imageUrl, height: 200))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      SizedBox(width: 5),
                      Text('${widget.rating} (${widget.reviews})',
                          style: TextStyle(color: Colors.white60)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.white60),
                  ),
                  SizedBox(height: 20),
                  // Cup Filling Options
                  _buildCupFillingOptions(),
                  SizedBox(height: 20),
                  // Milk Choices
                  _buildMilkOptions(),
                  SizedBox(height: 20),
                  // Sugar Choices
                  _buildSugarOptions(),
                  SizedBox(height: 20),
                  // High Priority Toggle
                  _buildHighPriorityToggle(),
                  SizedBox(height: 20),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }

  // Widget for Cup Filling options
  Widget _buildCupFillingOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choice of Cup Filling',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadioOption('Full', _selectedCupFilling, (value) {
              setState(() {
                _selectedCupFilling = value!;
              });
            }),
            _buildRadioOption('1/2 Full', _selectedCupFilling, (value) {
              setState(() {
                _selectedCupFilling = value!;
              });
            }),
            _buildRadioOption('3/4 Full', _selectedCupFilling, (value) {
              setState(() {
                _selectedCupFilling = value!;
              });
            }),
            _buildRadioOption('1/4 Full', _selectedCupFilling, (value) {
              setState(() {
                _selectedCupFilling = value!;
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildMilkOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choice of Milk',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadioOption('Skim Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
            _buildRadioOption('Almond Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
            _buildRadioOption('Soy Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadioOption('Full Cream Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
            _buildRadioOption('Oat Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
            _buildRadioOption('Lactose Free Milk', _selectedMilk, (value) {
              setState(() {
                _selectedMilk = value!;
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSugarOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choice of Sugar',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadioOption('Sugar X1', _selectedSugar, (value) {
              setState(() {
                _selectedSugar = value!;
              });
            }),
            _buildRadioOption('Sugar X2', _selectedSugar, (value) {
              setState(() {
                _selectedSugar = value!;
              });
            }),
            _buildRadioOption('½ Sugar', _selectedSugar, (value) {
              setState(() {
                _selectedSugar = value!;
              });
            }),
            _buildRadioOption('No Sugar', _selectedSugar, (value) {
              setState(() {
                _selectedSugar = value!;
              });
            }),
          ],
        ),
      ],
    );
  }


  Widget _buildHighPriorityToggle() {
    return Row(
      children: [
        Checkbox(
          value: _isHighPriority,
          onChanged: (bool? value) {
            setState(() {
              _isHighPriority = value!;
            });
          },
        ),
        Text(
          'High Priority',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRadioOption(String title, String groupValue, Function(String?) onChanged) {
    return Row(
      children: [
        Radio<String>(
          value: title,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  void submit() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Order Submitted!'),
    ));
  }
}
