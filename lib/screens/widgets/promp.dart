import 'package:flutter/material.dart';

void dialogSuccess(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Card(
          // height: 200,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFFB900)),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/success.png'),
                  Text(
                    message,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff414141)),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
