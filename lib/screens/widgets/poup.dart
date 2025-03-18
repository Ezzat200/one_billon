import 'package:flutter/material.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/shared/color.dart';

void dialog(BuildContext context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: DialogBody());
    },
  );
}

class DialogBody extends StatelessWidget {
  const DialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff000000).withOpacity(0.8),
        child: Center(
            child: Stack(clipBehavior: Clip.none, children: [
          Container(
              width: 288,
              height: 135,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 3, color: ColorManager.primary)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                S
                    .of(context)
                    .Please_log_in_first_to_access_our_exclusive_services,
                style: TextStyle(
                    color: Color(0xff414141),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ))),
          Positioned(
            bottom: -20,
            left: 30,
            right: 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Center(
                  child: Image.asset('assets/images/arrow_popup.png'),
                ),
              ),
            ),
          )
        ])),
      ),
    );
  }
}
