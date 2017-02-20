import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Tip Calculator',
    home: new TipCalculator()
  ));
}

class TipCalculator extends StatelessWidget {

  double billAmount = 0.0;
  double tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {

    // Create app bar
    AppBar appBar = new AppBar(title: new Text("Tip Calculator"));

    // Create first input field
    TextField billAmountField = new TextField(
      labelText: "Bill amount(\$)",
      keyboardType: TextInputType.number,
      onChanged: (InputValue value) {
        try {
          billAmount = double.parse(value.text);
        } catch (exception) {
          billAmount = 0.0;
        }
      }
    );

    // Create another input field
    TextField tipPercentageField = new TextField(
      labelText: "Tip %",
      keyboardType: TextInputType.number,
      hintText: "15",
      onChanged: (InputValue value) {
        try {
          tipPercentage = double.parse(value.text);
        } catch (exception) {
          tipPercentage = 0.0;
        }
      }
    );

    // Create button
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Calculate"),
        onPressed: () {
          // Calculate tip
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

          // Generate dialog
          AlertDialog dialog = new AlertDialog(
            content: new Text("Tip: \$$calculatedTip \n"
                "Total: \$$total")
          );

          // Show dialog
          showDialog(context: context, child: dialog);
        }
    );

    // Create container
    Container container = new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: [ billAmountField, tipPercentageField, calculateButton ]
      )
    );

    return new Scaffold(appBar: appBar, body: container);
  }

}