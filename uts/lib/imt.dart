import 'package:flutter/material.dart';

class RinMasaTubuh extends StatefulWidget {
  @override
  _RinMasaTubuhState createState() => _RinMasaTubuhState();
}

class _RinMasaTubuhState extends State<RinMasaTubuh> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  double _bmiResult = 0.0;
  double _bmrResult = 0.0;
  double _carbohydrateNeeds = 0.0;
  double _fatNeeds = 0.0;
  double _proteinNeeds = 0.0;

  int _selectedGender = 0; // 0: Laki-laki, 1: Perempuan

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    double height = double.tryParse(_heightController.text) ?? 0.0;
    int age = int.tryParse(_ageController.text) ?? 0;

    setState(() {
      _bmiResult = weight / ((height / 100) * (height / 100));
      _bmrResult = _selectedGender == 0
          ? 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
          : 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      _carbohydrateNeeds = _bmrResult * 0.45 / 4;
      _fatNeeds = _bmrResult * 0.25 / 9;
      _proteinNeeds = _bmrResult * 0.3 / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI & Nutrition Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Calculate Your BMI and Nutrition Needs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Select Gender:'),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _selectedGender,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedGender = value ?? 0;
                    });
                  },
                ),
                Text('Laki-laki'),
                Radio(
                  value: 1,
                  groupValue: _selectedGender,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedGender = value ?? 0;
                    });
                  },
                ),
                Text('Perempuan'),
              ],
            ),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
            ),
            TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi Badan (cm)'),
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Umur (tahun)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Results:'),
            Text('BMI: ${_bmiResult.toStringAsFixed(2)}'),
            Text('BMR: ${_bmrResult.toStringAsFixed(2)}'),
            Text(
                'Carbohydrate Needs: ${_carbohydrateNeeds.toStringAsFixed(2)} grams/day'),
            Text('Fat Needs: ${_fatNeeds.toStringAsFixed(2)} grams/day'),
            Text(
                'Protein Needs: ${_proteinNeeds.toStringAsFixed(2)} grams/day'),
          ],
        ),
      ),
    );
  }
}
