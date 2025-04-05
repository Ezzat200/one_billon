import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_billon/screens/payment/webpage.dart';


class ChoosePaymentWay extends StatefulWidget {
  final String amount;
  // final Future<void>  successCallBack;
  ChoosePaymentWay({required this.amount});
  @override
  _ChoosePaymentWayState createState() => _ChoosePaymentWayState();
}

class _ChoosePaymentWayState extends State<ChoosePaymentWay> {
  bool showPhoneText = false;
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  double svgWidth = 30;
  double svgHeight = 30;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    Navigator.pop(context, "normalBack");

    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white,)),

            title: Text(
             "أختر طريقة الدفع"
                 ,
              style: TextStyle(
                color: Colors.white,
                // fontSize: 18,
              ),
            ),
            backgroundColor: Color(0xff007EDB),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /// visa and master card
                    InkWell(
                      onTap: () async {
                        //  bool status= await createPaymentWithCard(context,widget.amount);
                        //  Navigator.pop(context, status);
                        createCharge(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xff007EDB),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                               "بطاقات ائتمان "
                                  ,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Image.asset(
                              "assets/images/vica_card.png",
                              width: svgWidth * 4,
                              height: svgHeight * 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // /// wallet payment
                    // InkWell(
                    //   onTap: ()
                    //   async
                    //   {
                    //     showPhoneText=true;
                    //     setState(() {

                    //     });

                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 80,
                    //     padding: EdgeInsets.symmetric(horizontal: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.green[800],
                    //         borderRadius: BorderRadius.circular(20)
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(languageName=='ar'?"محافظ  \n الكترونية ":"Smart \n wallets"

                    //           ,style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 22,
                    //           ),),

                    //         Expanded(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //             children: [
                    //               SvgPicture.asset(
                    //                 "assets/svg/wallet_paymet_4.svg",
                    //                 width:   svgWidth,
                    //                 height: svgHeight,
                    //               ),
                    //               SvgPicture.asset(
                    //                 "assets/svg/wallet_paymet_3.svg",
                    //                 width:   svgWidth,
                    //                 height: svgHeight,
                    //               ),
                    //               SvgPicture.asset(
                    //                 "assets/svg/wallet_paymet_2.svg",
                    //                 width:   svgWidth,
                    //                 height: svgHeight,
                    //               ),
                    //               SvgPicture.asset(
                    //                 "assets/svg/wallet_paymet_1.svg",
                    //                 width:   svgWidth,
                    //                 height: svgHeight,
                    //               ),
                    //             ],
                    //           ),
                    //         ),

                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 30,
                    ),
                    // showPhoneText == false
                    //     ? SizedBox()
                    //     : Column(
                    //         children: [
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           MyTextField(
                    //               controller: phoneController,
                    //               hintText: languageName == "ar"
                    //                   ? 'ادخل رقم الهاتف للمحفظة الالكترونية'
                    //                   : "Enter phone number form Wallet",
                    //               prefixIconPath: Res.mobile_phone,
                    //               validate: (value) {
                    //                 if (value!.isEmpty) {
                    //                   return languageName == "ar"
                    //                       ? 'رقم الهاتف لا يمكن ان يكون فارغ'
                    //                       : "Phone number cannot be empty";
                    //                 }
                    //                 return null;
                    //               }),
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           MyBtnRegister(
                    //               title: languageName == "ar"
                    //                   ? 'ادفع الان'
                    //                   : "Pay Now",
                    //               onTaped: () async {
                    //                 final form = formKey.currentState!;

                    //                 if (form.validate()) {
                    //                   bool status =
                    //                       await createPaymentWithWallet(
                    //                           context,
                    //                           widget.amount,
                    //                           phoneController.text);
                    //                   Navigator.pop(context, status);
                    //                 }
                    //               }),
                    //         ],
                    //       ),
                    // SizedBox(
                    //   height: 30,
                    // ),

                    /* /// kiosk payment
                    InkWell(
                      onTap: ()
                      async
                      {
                        String  bill_reference= await createPaymentWithKiosk(context,widget.amount);
                        Navigator.pop(context, bill_reference);

                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(languageName=='ar'?"ماكينات  \n الدفع ":"Payment \n machines"

                              ,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),),

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/machine_paymet_1.svg",
                                    width:   svgWidth,
                                    height: svgHeight,
                                  ),
                                  SvgPicture.asset(
                                    "assets/svg/machine_paymet_2.svg",
                                    width:   svgWidth,
                                    height: svgHeight,
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final String tapApiUrl = "https://api.tap.company/v2/charges";
  final String secretKey = "sk_live_CgFRUlEQKfcwD98ZYNkPVdo7";

  Future<void> createCharge(context) async {
    final url = Uri.parse(tapApiUrl);

    // بيانات العميل والدفع
    final Map<String, dynamic> chargeData = {
      "amount": widget.amount,
      "currency": "USD",
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
}
