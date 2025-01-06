// import 'package:flutter/material.dart';
// import 'package:flutterwave_standard/flutterwave.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final TextEditingController amountController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   String message = "";
//
//   void _makePayment() async {
//     final amount = amountController.text.trim();
//     final email = emailController.text.trim();
//
//     if (amount.isEmpty || email.isEmpty) {
//       _showSnackBar("Please fill in all fields");
//       return;
//     }
//
//     final flutterwave = Flutterwave.forUIPayment(
//       context: context,
//       publicKey: "FLWPUBK_TEST-XXXXXXXXXXXXXXXXX-X", // Replace with your test/live public key
//       encryptionKey: "FLWSECK_TESTXXXXXXXXXXXXXXXX", // Replace with your test/live encryption key
//       currency: "NGN", // Change currency as needed
//       amount: amount,
//       email: email,
//       fullName: "Test User",
//       txRef: "TX-${DateTime.now().millisecondsSinceEpoch}",
//       narration: "Payment for services",
//       isDebugMode: true, // Set to false in production
//       phoneNumber: "1234567890",
//       acceptCardPayment: true,
//       acceptUSSDPayment: true,
//       acceptAccountPayment: true,
//     );
//
//     try {
//       final response = await flutterwave.initializeForUiPayments();
//       if (response != null && response.status == "success") {
//         setState(() {
//           message = "Payment successful! Ref: ${response.transactionId}";
//         });
//         _showSnackBar(message);
//       } else {
//         setState(() {
//           message = "Payment failed or cancelled!";
//         });
//         _showSnackBar(message);
//       }
//     } catch (e) {
//       setState(() {
//         message = "Error occurred: $e";
//       });
//       _showSnackBar(message);
//     }
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Flutterwave Payment")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: amountController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Amount",
//                 hintText: "Enter amount",
//                 prefixIcon: Icon(Icons.money),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(
//                 labelText: "Email",
//                 hintText: "Enter email",
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _makePayment,
//                 child: const Text("Pay Now"),
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (message.isNotEmpty)
//               Text(
//                 message,
//                 style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }