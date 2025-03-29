// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get create_account {
    return Intl.message(
      'Create New Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get moreDetails {
    return Intl.message(
      'More Details',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Blogs`
  String get blogs {
    return Intl.message(
      'Blogs',
      name: 'blogs',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Please Login First`
  String get please_login_first {
    return Intl.message(
      'Please Login First',
      name: 'please_login_first',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get introduction {
    return Intl.message(
      'Subject',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_username {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_username',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get please_enter_phone {
    return Intl.message(
      'Please enter your phone number',
      name: 'please_enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get Enter_a_valid_phone_number {
    return Intl.message(
      'Enter a valid phone number',
      name: 'Enter_a_valid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get please_confirm_password {
    return Intl.message(
      'Please confirm your password',
      name: 'please_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Create an account.`
  String get createAccount {
    return Intl.message(
      'Create an account.',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Get the Service`
  String get Get_the_services {
    return Intl.message(
      'Get the Service',
      name: 'Get_the_services',
      desc: '',
      args: [],
    );
  }

  /// `Submit Data`
  String get Submit_Data {
    return Intl.message(
      'Submit Data',
      name: 'Submit_Data',
      desc: '',
      args: [],
    );
  }

  /// `The data has been successfully submitted`
  String get The_data_has_been_successfully_submitted {
    return Intl.message(
      'The data has been successfully submitted',
      name: 'The_data_has_been_successfully_submitted',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during submission`
  String get An_error_occurred_during_submission {
    return Intl.message(
      'An error occurred during submission',
      name: 'An_error_occurred_during_submission',
      desc: '',
      args: [],
    );
  }

  /// `The data has been successfully updated!`
  String get The_data_has_been_successfully_updated {
    return Intl.message(
      'The data has been successfully updated!',
      name: 'The_data_has_been_successfully_updated',
      desc: '',
      args: [],
    );
  }

  /// `Save Data`
  String get save_data {
    return Intl.message(
      'Save Data',
      name: 'save_data',
      desc: '',
      args: [],
    );
  }

  /// `Edit Data`
  String get Edit_data {
    return Intl.message(
      'Edit Data',
      name: 'Edit_data',
      desc: '',
      args: [],
    );
  }

  /// `Please log in first to access our exclusive services`
  String get Please_log_in_first_to_access_our_exclusive_services {
    return Intl.message(
      'Please log in first to access our exclusive services',
      name: 'Please_log_in_first_to_access_our_exclusive_services',
      desc: '',
      args: [],
    );
  }


  /// `Sections`
  String get Sections {
    return Intl.message('Sections', name: 'Sections', desc: '', args: []);

  /// `✅ Logged in successfully!`
  String get login_success {
    return Intl.message(
      '✅ Logged in successfully!',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `❌ No user found for that email.`
  String get user_not_found {
    return Intl.message(
      '❌ No user found for that email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `❌ Wrong password provided.`
  String get wrong_password {
    return Intl.message(
      '❌ Wrong password provided.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `❌ Email address is not valid.`
  String get invalid_email {
    return Intl.message(
      '❌ Email address is not valid.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `❌ This user account has been disabled.`
  String get user_disabled {
    return Intl.message(
      '❌ This user account has been disabled.',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `❌ Too many attempts. Try again later.`
  String get too_many_requests {
    return Intl.message(
      '❌ Too many attempts. Try again later.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `❌ No internet connection.`
  String get network_request_failed {
    return Intl.message(
      '❌ No internet connection.',
      name: 'network_request_failed',
      desc: '',
      args: [],
    );
  }

  /// `❌ Incorrect email or password. Please try again.`
  String get default_error {
    return Intl.message(
      '❌ Incorrect email or password. Please try again.',
      name: 'default_error',
      desc: '',
      args: [],
    );
  }

  /// `❌ An unexpected error occurred.`
  String get unexpected_error {
    return Intl.message(
      '❌ An unexpected error occurred.',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `✅ Logged out successfully`
  String get logoutSuccess {
    return Intl.message(
      '✅ Logged out successfully',
      name: 'logoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get deleteAccountConfirm {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Account has been deleted successfully.`
  String get accountDeleted {
    return Intl.message(
      'Account has been deleted successfully.',
      name: 'accountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in again to delete your account.`
  String get reloginToDelete {
    return Intl.message(
      'You need to sign in again to delete your account.',
      name: 'reloginToDelete',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect.`
  String get invalidCredentials {
    return Intl.message(
      'The email or password is incorrect.',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy`
  String get enjoy {
    return Intl.message(
      'Enjoy',
      name: 'enjoy',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
