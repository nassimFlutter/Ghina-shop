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

  /// `E-mail is required`
  String get email_required_validation {
    return Intl.message(
      'E-mail is required',
      name: 'email_required_validation',
      desc: '',
      args: [],
    );
  }

  /// `E-mail must contains @`
  String get email_contain_validation {
    return Intl.message(
      'E-mail must contains @',
      name: 'email_contain_validation',
      desc: '',
      args: [],
    );
  }

  /// `E-mail must be\n a valid email address`
  String get email_address_validation {
    return Intl.message(
      'E-mail must be\n a valid email address',
      name: 'email_address_validation',
      desc: '',
      args: [],
    );
  }

  /// `phone is required`
  String get phone_required_validation {
    return Intl.message(
      'phone is required',
      name: 'phone_required_validation',
      desc: '',
      args: [],
    );
  }

  /// `The Mobile must be between 8\n and 15 digits`
  String get phone_length_validation {
    return Intl.message(
      'The Mobile must be between 8\n and 15 digits',
      name: 'phone_length_validation',
      desc: '',
      args: [],
    );
  }

  /// `Full name is required`
  String get name_required_validation {
    return Intl.message(
      'Full name is required',
      name: 'name_required_validation',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_required_validation {
    return Intl.message(
      'Password is required',
      name: 'password_required_validation',
      desc: '',
      args: [],
    );
  }

  /// `The Password must be\n at least 6 characters.`
  String get password_length_validation {
    return Intl.message(
      'The Password must be\n at least 6 characters.',
      name: 'password_length_validation',
      desc: '',
      args: [],
    );
  }

  /// `this is required`
  String get this_required_validations {
    return Intl.message(
      'this is required',
      name: 'this_required_validations',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get password_confirm_validation {
    return Intl.message(
      'Confirm password is required',
      name: 'password_confirm_validation',
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

  /// `Added to Wishlist`
  String get added_to_wishlist {
    return Intl.message(
      'Added to Wishlist',
      name: 'added_to_wishlist',
      desc: '',
      args: [],
    );
  }

  /// `No internet`
  String get no_internet {
    return Intl.message(
      'No internet',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `No Added Address`
  String get no_added_address {
    return Intl.message(
      'No Added Address',
      name: 'no_added_address',
      desc: '',
      args: [],
    );
  }

  /// `Add Address for a Faster Checkout`
  String get add_address_for_a_faster_checkout {
    return Intl.message(
      'Add Address for a Faster Checkout',
      name: 'add_address_for_a_faster_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get add_address {
    return Intl.message(
      'Add Address',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Old Password*`
  String get old_password_ {
    return Intl.message(
      'Old Password*',
      name: 'old_password_',
      desc: '',
      args: [],
    );
  }

  /// `new Password*`
  String get new_password_ {
    return Intl.message(
      'new Password*',
      name: 'new_password_',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password*`
  String get confirm_password_ {
    return Intl.message(
      'Confirm Password*',
      name: 'confirm_password_',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully\nChanged Your Password`
  String get changed_password_dialog {
    return Intl.message(
      'You have successfully\nChanged Your Password',
      name: 'changed_password_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Change Password Error`
  String get change_password_error {
    return Intl.message(
      'Change Password Error',
      name: 'change_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `About Best Price`
  String get about_best_price {
    return Intl.message(
      'About Best Price',
      name: 'about_best_price',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Full Name*`
  String get full_name_ {
    return Intl.message(
      'Full Name*',
      name: 'full_name_',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number*`
  String get mobile_number_ {
    return Intl.message(
      'Mobile Number*',
      name: 'mobile_number_',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get email_ {
    return Intl.message(
      'Email*',
      name: 'email_',
      desc: '',
      args: [],
    );
  }

  /// `Message*`
  String get message_ {
    return Intl.message(
      'Message*',
      name: 'message_',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get error {
    return Intl.message(
      'error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Reach Out to Us`
  String get reach_out_to_us {
    return Intl.message(
      'Reach Out to Us',
      name: 'reach_out_to_us',
      desc: '',
      args: [],
    );
  }

  /// `edit Account`
  String get edit_account {
    return Intl.message(
      'edit Account',
      name: 'edit_account',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Has been\nsuccessfully updated`
  String get success_update_message {
    return Intl.message(
      'Your Account Has been\nsuccessfully updated',
      name: 'success_update_message',
      desc: '',
      args: [],
    );
  }

  /// `Update Account`
  String get update_account {
    return Intl.message(
      'Update Account',
      name: 'update_account',
      desc: '',
      args: [],
    );
  }

  /// `Update Account Error`
  String get update_account_error {
    return Intl.message(
      'Update Account Error',
      name: 'update_account_error',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Has not \nsuccessfully updated`
  String get failure_update_message {
    return Intl.message(
      'Your Account Has not \nsuccessfully updated',
      name: 'failure_update_message',
      desc: '',
      args: [],
    );
  }

  /// `update`
  String get update {
    return Intl.message(
      'update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get my_addresses {
    return Intl.message(
      'My Addresses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get add_new_address {
    return Intl.message(
      'Add New Address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `show more`
  String get show_more {
    return Intl.message(
      'show more',
      name: 'show_more',
      desc: '',
      args: [],
    );
  }

  /// `show less`
  String get show_less {
    return Intl.message(
      'show less',
      name: 'show_less',
      desc: '',
      args: [],
    );
  }

  /// `Our Policy`
  String get our_policy {
    return Intl.message(
      'Our Policy',
      name: 'our_policy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Return Policy data .....`
  String get return_policy_data {
    return Intl.message(
      'Return Policy data .....',
      name: 'return_policy_data',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Best Price We respect your privacy and are committed to protecting your personal information. This Privacy Policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information. By using our website or mobile application, you consent to the practices described in this Privacy Policy.Information We CollectPersonal Information: We may collect personal information that you provide to us, such as your name, email address, postal address, phone number, and other similar information.Usage Information: We may collect information about your use of our services, including but not limited to your IP address, device information, browser type, and operating system.`
  String get welcome_policy_message {
    return Intl.message(
      'Welcome to Best Price We respect your privacy and are committed to protecting your personal information. This Privacy Policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information. By using our website or mobile application, you consent to the practices described in this Privacy Policy.Information We CollectPersonal Information: We may collect personal information that you provide to us, such as your name, email address, postal address, phone number, and other similar information.Usage Information: We may collect information about your use of our services, including but not limited to your IP address, device information, browser type, and operating system.',
      name: 'welcome_policy_message',
      desc: '',
      args: [],
    );
  }

  /// `Terminate Account`
  String get terminate_account {
    return Intl.message(
      'Terminate Account',
      name: 'terminate_account',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to terminate your\naccount?`
  String get terminate_message {
    return Intl.message(
      'Do you want to terminate your\naccount?',
      name: 'terminate_message',
      desc: '',
      args: [],
    );
  }

  /// `By terminating account, You will not be able to recover your account.`
  String get terminate_note_message {
    return Intl.message(
      'By terminating account, You will not be able to recover your account.',
      name: 'terminate_note_message',
      desc: '',
      args: [],
    );
  }

  /// `Terminate my Accounts`
  String get terminate_my_accounts {
    return Intl.message(
      'Terminate my Accounts',
      name: 'terminate_my_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Address Title*`
  String get address_title_ {
    return Intl.message(
      'Address Title*',
      name: 'address_title_',
      desc: '',
      args: [],
    );
  }

  /// `Mobile No*`
  String get mobile_no_ {
    return Intl.message(
      'Mobile No*',
      name: 'mobile_no_',
      desc: '',
      args: [],
    );
  }

  /// `Select Area*`
  String get select_area_ {
    return Intl.message(
      'Select Area*',
      name: 'select_area_',
      desc: '',
      args: [],
    );
  }

  /// `Block No*`
  String get block_no_ {
    return Intl.message(
      'Block No*',
      name: 'block_no_',
      desc: '',
      args: [],
    );
  }

  /// `Street*`
  String get street_ {
    return Intl.message(
      'Street*',
      name: 'street_',
      desc: '',
      args: [],
    );
  }

  /// `Avenue`
  String get avenue {
    return Intl.message(
      'Avenue',
      name: 'avenue',
      desc: '',
      args: [],
    );
  }

  /// `Floor No*`
  String get floor_no_ {
    return Intl.message(
      'Floor No*',
      name: 'floor_no_',
      desc: '',
      args: [],
    );
  }

  /// `Flat No*`
  String get flat_no_ {
    return Intl.message(
      'Flat No*',
      name: 'flat_no_',
      desc: '',
      args: [],
    );
  }

  /// `Extra Directions*`
  String get extra_directions_ {
    return Intl.message(
      'Extra Directions*',
      name: 'extra_directions_',
      desc: '',
      args: [],
    );
  }

  /// `Please select an area`
  String get please_select_an_area {
    return Intl.message(
      'Please select an area',
      name: 'please_select_an_area',
      desc: '',
      args: [],
    );
  }

  /// `enter here`
  String get enter_here {
    return Intl.message(
      'enter here',
      name: 'enter_here',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your E-mail`
  String get enter_your_email {
    return Intl.message(
      'Enter your E-mail',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get enter_your_phone {
    return Intl.message(
      'Enter your phone',
      name: 'enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `house no`
  String get house_no {
    return Intl.message(
      'house no',
      name: 'house_no',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Wish list`
  String get wish_list {
    return Intl.message(
      'Wish list',
      name: 'wish_list',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get order_ID {
    return Intl.message(
      'Order ID',
      name: 'order_ID',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
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
