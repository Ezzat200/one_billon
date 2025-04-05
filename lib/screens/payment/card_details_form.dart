
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:one_billon/screens/payment/webpage.dart';


class InvoiceDetailsPage extends StatelessWidget {
  InvoiceDetailsPage({super.key, required this.price});
  final _formKey = GlobalKey<FormState>();
  final double price;

  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل الفاتورة'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تفاصيل الفاتورة',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(label: 'الاسم الأول *', hint: 'الاسم الأول'),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'الاسم الأخير *', hint: 'الاسم الأخير'),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'اسم الشركة (اختياري)',
                      hint: 'اسم الشركة (اختياري)',
                      isRequired: false),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'أدخل رقم جوالك *',
                      hint: 'أدخل رقم جوالك',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال رقم الجوال';
                        } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return 'يرجى إدخال رقم صحيح';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'أدخل بريدك الإلكتروني *',
                      hint: 'أدخل بريدك الإلكتروني',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        } else if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'يرجى إدخال بريد إلكتروني صحيح';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'عنوان الشارع / الحي *',
                      hint: 'رقم المنزل واسم الشارع / الحي'),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'الشقة، الجناح، الوحدة، إلخ. (اختياري)',
                      hint: 'رقم الشقة، الجناح، الوحدة، إلخ. (اختياري)',
                      isRequired: false),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'الرمز البريدي / ZIP *',
                      hint: 'الرمز البريدي / ZIP',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال الرمز البريدي';
                        } else if (value.length < 5) {
                          return 'الرمز البريدي يجب أن يكون 5 أرقام أو أكثر';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  _buildTextField(label: 'المدينة *', hint: 'المدينة'),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // createCharge(context);
                        if (_formKey.currentState!.validate()) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         TapPaymentScreen(price: price),
                          //   ),
                          // );

                          // create a charge
                          createCharge(context);




                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text(
                        'تأكيد الطلب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final String tapApiUrl = "https://api.tap.company/v2/charges";
  final String secretKey = "sk_live_9lGHWd1IfaZnAXq7hO0gpuyr";

  Future<void> createCharge(context) async {
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


  Widget _buildTextField({
    required String label,
    required String hint,
    bool isRequired = true,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          validator: validator ??
              (isRequired
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    }
                  : null),
        ),
      ],
    );
  }

  
}
