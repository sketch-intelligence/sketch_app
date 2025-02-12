// import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
// import 'package:sketch/core/constant/app_padding/app_padding.dart';
// import 'package:sketch/core/payment/stripe_widget.dart';
// import 'package:sketch/features/Profile/data/cubit/profile_cubit.dart';
// import 'package:sketch/features/payment_imp/repository/payment_repository.dart';
// import 'package:sketch/features/payment_imp/use_case/add_to_balance_use_case.dart';

// import '../../../core/classes/cashe_helper.dart';
// import '../../../core/constant/app_colors/app_colors.dart';
// import '../../../core/payment/pay_pal_widget.dart';
// import '../../../core/ui/dialogs/dialogs.dart';
// import '../../../translations.dart';

// class PaymentMethodsWidget extends StatefulWidget {
//   // final VoidCallback whenSuccess;
//   const PaymentMethodsWidget({super.key});

//   @override
//   State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
// }

// class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
//   bool loadingStripe = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: InkWell(
//             onTap: () async {
//               (context.read<ProfileCubit>().amount.text.isNotEmpty)
//                   ? Navigator.of(context).push(
//                       MaterialPageRoute(
//                           builder: (BuildContext context) => PayPalWidget(
//                                 clientId:
//                                     "AYPHwHQdTHYI2Sgj7IClJKwyci8kiK0Ochx1qZNUZS1SljiX43eyNCdDwKb2sC_HE4Si1m6Nh4Eg4a4-",
//                                 secretKey:
//                                     "EDvVuZ8HKfAw7LOlMhreJbZyma9uSybPpgR04RJpafBAWMfuxRfkfjoroHO6sbTu_t9c2XjW-fyNf-x7",
//                                 onSuccess: (Map params) {
//                                   AddToBalanceUseCase(
//                                           repository: PaymentRepository())
//                                       .call(
//                                           params: AddToBalanceParams(
//                                     amount: 12,
//                                     // double.tryParse(context
//                                     //         .read<ProfileCubit>()
//                                     //         .amount
//                                     //         .text) ??
//                                     //     0.0,
//                                     userId: CacheHelper.userID!,
//                                   ));
//                                   double amount = double.parse(
//                                       context.read<ProfileCubit>().amount.text);
//                                   double newBalance =
//                                       amount + (CacheHelper.balance!);
//                                   CacheHelper.setBalance(newBalance);
//                                   context.read<ProfileCubit>().updateStates();
//                                   // widget.whenSuccess();
//                                   debugPrint("onSuccess: $params");
//                                 },
//                                 onError: (error) {
//                                   debugPrint("onError: $error");
//                                   Navigator.pop(context);
//                                 },
//                                 onCancel: () {
//                                   debugPrint('cancelled:');
//                                 },
//                                 items: [
//                                   {
//                                     "name": "",
//                                     "quantity": 1,
//                                     "price": context
//                                         .read<ProfileCubit>()
//                                         .amount
//                                         .text,
//                                     "currency": "CAD"
//                                   },
//                                 ],
//                                 amountDetails: {
//                                   "total":
//                                       context.read<ProfileCubit>().amount.text,
//                                   "currency": "CAD",
//                                   "details": {
//                                     "subtotal": context
//                                         .read<ProfileCubit>()
//                                         .amount
//                                         .text,
//                                     "shipping": '0',
//                                     "shipping_discount": 0
//                                   }
//                                 },
//                                 description:
//                                     "The payment transaction description.",
//                                 note:
//                                     "Contact us for any questions on your order.",
//                                 sandboxMode: true,
//                               )),
//                     )
//                   : Dialogs.showSnackBar(
//                       context: context,
//                       message: AppLocalizations.of(context)!.fillAmount,
//                       typeSnackBar: AnimatedSnackBarType.error);
//             },
//             child: Container(
//               height: 65,
//               width: 65,
//               decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.primary),
//                   borderRadius: const BorderRadius.all(Radius.circular(8))),
//               child: Center(
//                 child: SvgPicture.asset(
//                   Assets.imagesPaypal,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: AppPaddingSize.padding_30,
//         ),
//         InkWell(
//           // onTap: () async {
//           //   if (context.read<ProfileCubit>().amount.text.isNotEmpty) {
//           //     loadingStripe = true;
//           //     setState(() {});
//           //     await StripeManager.makePayment(
//           //       amount: context.read<ProfileCubit>().amount.text,
//           //       currency: "usd",
//           //       context: context,
//           //       onSuccess: () {
//           //         double amount =
//           //             double.parse(context.read<ProfileCubit>().amount.text);
//           //         double newBalance = amount + (CacheHelper.balance!);
//           //         CacheHelper.setBalance(newBalance);
//           //       },
//           //     );
//           //     loadingStripe = false;
//           //     setState(() {});
//           //   } else {
//           //     Dialogs.showSnackBar(
//           //       message: AppLocalizations.of(context)!.fill_amount,
//           //       typeSnackBar: AnimatedSnackBarType.error,
//           //     );
//           //   }
//           // },
//           onTap: () async {
//             if (context.read<ProfileCubit>().amount.text.isNotEmpty) {
//               loadingStripe = true;
//               setState(() {}); // Show loading indicator

//               await StripeManager.makePayment(
//                 amount: context.read<ProfileCubit>().amount.text,
//                 currency: "usd",
//                 context: context,
//                 onSuccess: () {
//                   double amount =
//                       double.parse(context.read<ProfileCubit>().amount.text);
//                   context
//                       .read<ProfileCubit>()
//                       .updateBalance(amount); // Update balance
//                 },
//               );

//               loadingStripe = false;
//               setState(() {}); // Hide loading indicator
//             } else {
//               Dialogs.showSnackBar(
//                 context: context,
//                 message: AppLocalizations.of(context)!.fillAmount,
//                 typeSnackBar: AnimatedSnackBarType.error,
//               );
//             }
//           },

//           child: loadingStripe
//               ? const CupertinoActivityIndicator()
//               : Container(
//                   height: 65,
//                   width: 65,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.primary),
//                       borderRadius: const BorderRadius.all(Radius.circular(8))),
//                   child: Center(
//                     child: Image.asset(
//                       Assets.imagesStrip,
//                     ),
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }
