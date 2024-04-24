import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KPayment extends StatefulWidget {
  const KPayment({super.key});

  @override
  State<KPayment> createState() => _KPaymentState();
}

class _KPaymentState extends State<KPayment> {
  final TextEditingController _amountController = TextEditingController();

  void initiateKhaltiPayment(BuildContext context, int amount) {
    KhaltiButton(
      config: PaymentConfig(
        amount: amount,
        productIdentity: 'product_id',
        productName: 'Product Name',
        mobile: '123',
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (successModel) {
        print('Payment successful: $successModel');
      },
      onFailure: (failureModel) {
        print('Payment failed: $failureModel');
      },
      onCancel: () {
        print('Payment cancelled.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int amount = 0;
    try {
      amount = int.parse(_amountController.text) * 100;
    } catch (e) {
      amount = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khalti Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
              ),
            ),
            const SizedBox(height: 16),
            KhaltiButton(
              config: PaymentConfig(
                amount: amount,
                productIdentity: 'productID',
                productName: 'ProductName',
              ),
              preferences: [
                PaymentPreference.khalti,
              ],
              onSuccess: (successModel) {
                print('Payment successful: $successModel');
              },
              onFailure: (failureModel) {
                print('Payment failed: $failureModel');
              },
              onCancel: () {
                print('Payment cancelled by the user.');
              },
            ),
          ],
        ),
      ),
    );
  }
}
