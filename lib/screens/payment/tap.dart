
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:one_billon/screens/payment/webpage.dart';




class TapPaymentScreen extends StatefulWidget {
  final double price;
  const TapPaymentScreen({super.key, required this.price});

  @override
  // ignore: library_private_types_in_public_api
  _TapPaymentScreenState createState() => _TapPaymentScreenState(price: price);
}

class _TapPaymentScreenState extends State<TapPaymentScreen> {
  final double price;


  _TapPaymentScreenState({required this.price}); // مفتاح API السري

  final String tapApiUrl = "https://api.tap.company/v2/charges";
  final String secretKey = "sk_live_CgFRUlEQKfcwD98ZYNkPVdo7";

  Future<void> createCharge() async {
  final url = Uri.parse(tapApiUrl);

  // بيانات العميل والدفع
  final Map<String, dynamic> chargeData = {
    "amount": price,
    "currency": "SAR",
    "threeDSecure": true,
    "save_card": false,
    "description": "Payment for Order #12345",
    "statement_descriptor": "TAP-ORDER",
    "customer": {
      "first_name": "John",
      "last_name": "Doe",
      "email": "john.doe@example.com",
      "phone": {"country_code": "966", "number": "123456789"}
    },
    "source": {"id": "src_all"}, // مصدر الدفع: جميع الخيارات المتاحة
    "redirect": {
      "url": "https:google.com" // الرابط الذي يعاد التوجيه إليه بعد الدفع
    }
  };

  try {
    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/json"
      },
      body: json.encode(chargeData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final redirectUrl = responseData['transaction']['url'];
      print("Redirect to: $redirectUrl");

      // الانتقال إلى صفحة عرض WebView
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewPage(redirectUrl),
        ),
      );
    } else {
      print("Failed to create charge: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap Payment")),
      body: Center(
        child: ElevatedButton(
          onPressed: createCharge,
          child: Text("Pay Now"),
        ),
      ),
    );
  }
}
