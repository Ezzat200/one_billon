import 'package:flutter/material.dart';

class OpacityManager {
  static double o12 = 12.0;
}

class ColorManager {
  static Color primary = HexColor.fromHex("#FF8D00");
  static Color bgColorF5 = HexColor.fromHex("#F5F5F5");
  static Color bgColorIconDrawer = HexColor.fromHex("#f2f2f2");
  static Color Color555555 = HexColor.fromHex("#555555");
  static const Color Color929292 = Color(0xFF929292);
  static Color ColorE6EFFE = HexColor.fromHex("#E6EFFE");
  static Color Color98 = HexColor.fromHex("#98ADB8");
  static Color ColorE5 = HexColor.fromHex("#E5E5E5");
  static Color ColorFFA500 = HexColor.fromHex("#FFA500");
  static Color Color009A0F = HexColor.fromHex("#009A0F");
  static Color ColorFFD68B = HexColor.fromHex("#FFD68B");
  static Color ColorCFD8DC = HexColor.fromHex("#CFD8DC");
  static Color ColorFC6F2E = HexColor.fromHex("#FC6F2E");
  static Color Color8383 = HexColor.fromHex("#838383");
  static Color primaryblue = HexColor.fromHex("#285480");
  static Color Color3771E0 = HexColor.fromHex("#3771E0");
  static Color ColorB9B9B9 = HexColor.fromHex("#B9B9B9");
  static Color Color25D366 = HexColor.fromHex("#25D366");

  static Color black = HexColor.fromHex("#000000");
  // static Color textFieldSearch = HexColor.fromHex("#F5F5F5");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color greyShade200 = HexColor.fromHex("#EEEEEE");
  static Color bgColorD9 = HexColor.fromHex("#D9D9D9");

  static Color grey = HexColor.fromHex("#808080");
  static Color navbarIconColor = HexColor.fromHex("#FFFFFF");
  static Color bgColor92 = HexColor.fromHex("#D9D9D9");
  static Color greyBlack = const Color(0xff2E3134);
  static Color cff2E3134 = const Color(0xff2E3134);
// up
  static Color bgColor55 = HexColor.fromHex("#F5F5F5");

  // ignore: non_constant_identifier_names
  static Color Colorff2E3134 = const Color(0xff2E3134);
  // ignore: non_constant_identifier_names
  static Color ColorffE6EFFE = const Color(0xffE6EFFE);
  static Color primaryColor = const Color.fromARGB(246, 249, 108, 43);
  static Color amber = const Color.fromRGBO(255, 215, 64, 1);
  // static Color primaryColor = Color(0xffFC6F2E);

  static Color bgColor2E = HexColor.fromHex("#2E3134");
  static Color transparent = Colors.transparent;

  // static Color notificationColorNumber = HexColor.fromHex("");
}

// #F5F5F5
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
