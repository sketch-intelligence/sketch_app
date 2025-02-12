// import 'package:flutter/material.dart';
// // import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

// class PayPalWidget extends StatelessWidget {
//   final String clientId;
//   final bool sandboxMode;
//   final String secretKey;
//   final String description;
//   final String note;
//   final Function(Map params) onSuccess;
//   final Function(dynamic error) onError;
//   final Function() onCancel;
//   final List<dynamic> items;
//   final Map<String, dynamic> amountDetails;
//   const PayPalWidget(
//       {super.key,
//       required this.clientId,
//       required this.secretKey,
//       required this.onSuccess,
//       required this.onError,
//       required this.onCancel,
//       required this.items,
//       required this.amountDetails,
//       required this.description,
//       required this.note,
//       required this.sandboxMode});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: PaypalCheckout(
//           sandboxMode: sandboxMode,
//           clientId: clientId,
//           secretKey: secretKey,
//           returnURL: "success.snippetcoder.com",
//           cancelURL: "cancel.snippetcoder.com",
//           transactions: [
//             {
//               "amount": amountDetails,
//               "description": description,
//               // "payment_options": {
//               //   "allowed_payment_method":
//               //       "INSTANT_FUNDING_SOURCE"
//               // },
//               "item_list": {"items": items}
//               // shipping address is not required though
//               //   "shipping_address": {
//               //     "recipient_name": "Raman Singh",
//               //     "line1": "Delhi",
//               //     "line2": "",
//               //     "city": "Delhi",
//               //     "country_code": "IN",
//               //     "postal_code": "11001",
//               //     "phone": "+00000000",
//               //     "state": "Texas"
//               //  },
//             }
//           ],
//           note: note,
//           onSuccess: (Map params) => onSuccess(params),
//           onError: (error) => onError(error),
//           onCancel: () => onCancel()),
//     ));
//   }
// }
