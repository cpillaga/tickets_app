import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tickets_app/utils/stripe_values.dart';

class StripeAPI {
  StripeAPI._();
  static final StripeAPI api = StripeAPI._();

  Future<bool> makePayment(int valor) async {
    try {
      //String? paymentIntentClientSecret = await createPaymentIntent(10, 'usd');
      String? paymentIntentClientSecret = await createPaymentIntent(valor, 'usd');
      if (paymentIntentClientSecret == null) {
        return false;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Dev",
        ),
      );
      await processPayment();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> createPaymentIntent(int amount, String currency) async {
    //int amountInCents = amount * 100;

    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {'amount': amount, 'currency': 'usd'};

      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          method: 'POST',
          contentType: Headers.formUrlEncodedContentType,
          headers: {"Authorization": "Bearer $stripeSecretKey", "Content-Type": 'application/x-www-form-urlencoded'},
        ),
      );

      if (response.data != null) {
        return response.data['client_secret'];
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  String calculateAmount(int amount) {
    final total = amount * 100;
    return total.toString();
  }

  Future<void> processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } 
    catch (e) {}
  }
}
