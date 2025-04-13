import 'package:flutter_stripe/flutter_stripe.dart';
import '../core/constants.dart';

class StripeService {
  static Future<void> initStripe() async {
    Stripe.publishableKey = AppConstants.stripePublishableKey;
    await Stripe.instance.applySettings();
  }

  static Future<void> makePayment(double amount) async {
    // lógica con backend y Stripe
  }
}
