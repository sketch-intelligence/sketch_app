import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';

class StripeManager {
  static String publishableKey =
      'pk_test_51PyBjeIYtp0MX6BzLmLOcg9b9JOGOrjXqhWPUzP8RM1GUFhHjjVShBjLZ2O4D83NarsaoCIiOGKFIUCUkzbobimQ00V9hXdj0j';
  static String secretKey =
      'sk_test_51PyBjeIYtp0MX6Bzx44j4TRk27ZIvOBkHTKoVv5nFoafIdF4r7zZAJCRBnVphKy5YveswwM6Vl6DOG6KGqmnGL1b00OHQ1n2Hi';
  static Future<Map<String, dynamic>?> createPaymentIntent({
    required String amount,
    required String currency,
    required BuildContext context,
  }) async {
    try {
      final body = {
        'amount': (int.parse(amount) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      Dio dio = Dio();
      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: body,
        options: Options(headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': "application/x-www-form-urlencoded",
        }),
      );
      debugPrint(
          '[post: https://api.stripe.com/v1/payment_intents] data : $body');

      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      if (response.statusCode == 200) {
        return response.data; // Return the entire response data
      } else {
        Dialogs.showErrorSnackBar(
            context: context,
            message: "We're sorry, but we're unable to serve your request.");
        debugPrint('Error in response: ${response.data}');
        return null;
      }
    } catch (error) {
      Dialogs.showErrorSnackBar(
          context: context,
          message: "We're sorry, but we're unable to serve your request.");
      debugPrint('Error in createPaymentIntent: ${error.toString()}');
      return null;
    }
  }

  static Future<void> makePayment(
      {required String amount,
      required String currency,
      required BuildContext context,
      VoidCallback? onSuccess}) async {
    try {
      // Step 1: Create a PaymentIntent
      final paymentIntent = await createPaymentIntent(
          amount: amount, currency: currency, context: context);

      if (paymentIntent == null) {
        // Dialogs.showErrorSnackBar(
        //     context: context, message: "Error: Payment Intent creation failed");
        // debugPrint('Error: Payment Intent creation failed');
        return;
      }

      final clientSecret = paymentIntent['client_secret'];
      final paymentMethodId = paymentIntent['id'];

      // Step 2: Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Sketch',
        ),
      );

      // Step 3: Display the payment sheet
      try {
        await Stripe.instance.presentPaymentSheet();

        // Step 4: After successful payment, call your server API
        debugPrint('Payment completed successfully');
        await postPaymentDetailsToServer(
            paymentMethod: paymentMethodId,
            amount: (int.parse(amount) * 100).toString(),
            context: context,
            onSuccess: onSuccess);
      } catch (e) {
        // Handle cancellation or errors in presenting the payment sheet
        if (e is StripeException) {
          debugPrint(
              'Payment canceled by user or failed: ${e.error.localizedMessage}');
          Dialogs.showSnackBar(
            context: context,
            message: "Payment canceled or failed",
            typeSnackBar: AnimatedSnackBarType.error,
          );
        } else {
          debugPrint('Unexpected error in payment: $e');
          Dialogs.showSnackBar(
            context: context,
            message: "Unexpected error occurred",
            typeSnackBar: AnimatedSnackBarType.error,
          );
        }
      }
    } catch (error) {
      debugPrint('Error in makePayment: ${error.toString()}');
    }
  }

  static Future<void> postPaymentDetailsToServer(
      {required String paymentMethod,
      required String amount,
      required BuildContext context,
      VoidCallback? onSuccess}) async {
    try {
      final body = {
        'userId': CacheHelper.userID,
        'amount': double.parse(amount),
      };

      Dio dio = Dio();
      final response = await dio.post(
        'http://192.168.1.90:8080/balance/add',
        data: body,
        options: Options(headers: {
          'Authorization': 'Bearer ${CacheHelper.token!}',
          'Content-Type': "application/json",
        }),
      );
      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      if (response.statusCode == 200) {
        debugPrint('Payment details successfully sent to the server');
        // Handle success response
        Dialogs.showSnackBar(
          context: context,
          message: "Payment Successful",
          typeSnackBar: AnimatedSnackBarType.success,
        );
        // double newBalance =
        //     (double.parse(amount) / 100) + (CacheHelper.balance!);
        // CacheHelper.setBalance(newBalance);
        //Navigation.pop();
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        Dialogs.showErrorSnackBar(
            context: context,
            message: "something went wrong ,please try again later");
        debugPrint('Error in response: ${response.data}');
      }
    } catch (error) {
      Dialogs.showErrorSnackBar(
          context: context,
          message:
              "Error: Failed to send payment details ,please try again later");
      debugPrint('Error in postPaymentDetailsToServer: ${error.toString()}');
    }
  }

  static displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
        (value) {
          debugPrint('displayPaymentSheetdisplayPaymentSheet');
        },
      ).onError(
        (error, stackTrace) {
          Dialogs.showErrorSnackBar(
              context: context, message: "Error: Payment creation failed");
          debugPrint('onError in then in  presentPaymentSheet $error ');
        },
      );
    } on StripeException catch (error) {
      Dialogs.showErrorSnackBar(
          context: context, message: "Error: Payment Intent creation failed");
      debugPrint('StripeException in displayPaymentSheet in catch $error ');
    }
  }
}
