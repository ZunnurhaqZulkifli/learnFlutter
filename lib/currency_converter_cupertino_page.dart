import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0.00;
  double currentUsdRate = 4.73;
  double total = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * currentUsdRate;
      (result != 0) ? total = result : total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemPurple,
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.abc),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'RM ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: 'Please Enter MYR',
                prefix: const Icon(CupertinoIcons.money_dollar_circle),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 4),
              CupertinoButton(
                minSize: 100,
                onPressed: () {},
                child: TextButton(
                  onPressed: convert,
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: CupertinoColors.systemPurple,
                    foregroundColor: CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Convertebrate',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
