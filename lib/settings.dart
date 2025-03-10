import 'package:flutter/material.dart';
import 'package:one_billon/shared/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsScreen extends StatefulWidget {
  final Function(Locale) setLocale;

  const SettingsScreen({super.key, required this.setLocale});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _currentLanguage = 'en'; // اللغة الافتراضية

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('language') ?? 'en';
    });
  }

  Future<void> _changeLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);

    Locale newLocale = Locale(langCode);
    widget.setLocale(newLocale);

    setState(() {
      _currentLanguage = langCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.translate('settings'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.translate('language'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('English'),
              leading: Radio(
                value: 'en',
                groupValue: _currentLanguage,
                onChanged: (value) {
                  _changeLanguage(value as String);
                },
              ),
            ),
            ListTile(
              title: Text('العربية'),
              leading: Radio(
                value: 'ar',
                groupValue: _currentLanguage,
                onChanged: (value) {
                  _changeLanguage(value as String);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
