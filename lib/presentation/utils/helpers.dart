import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';
import 'package:url_launcher/url_launcher.dart';

Future<File?> pickFile() async {
 try{
   final result = await FilePicker.platform.pickFiles(
     type: FileType.custom,
     allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
     withData: true,
   );
   if (result != null) {
     final fileSize = result.files.single.size;
     const maxSize = 5 * 1024 * 1024; // 5MB
     if (fileSize > maxSize) {
       throw Exception('File size exceeds 5MB limit');
     }
     File file = File(result.files.single.path!);
     return file;
   } else {
     return null;
   }
 } catch (e) {
    rethrow;
  }
}

Future<void> openUrl({required String url}) async {

  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch URL');
  }
}

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.emailEmptyDesc.tr();
  }
// Regular expression for email validation
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return LocaleKeys.emailValidDesc.tr();
  }
  return null;
}

void updateLanguage(BuildContext context, Locale locale) {
  context.setLocale(locale);
}

String getLanguageFromCode(Locale locale) {
  switch (locale.languageCode) {
    case "en":
      return LocaleKeys.langEnglish.tr();
    case "fr":
      return LocaleKeys.langFrench.tr();
    case "de":
      return LocaleKeys.langGerman.tr();
    case "es":
      return LocaleKeys.langSpanish.tr();
    case "it":
      return LocaleKeys.langItalian.tr();
    default:
      return locale.languageCode;
  }
}


Widget flagWidget(Currency currency) {
  if (currency.flag == null) {
    return Image.asset(
      'no_flag.png'.imagePath, // Make sure you have this image
      package: 'currency_picker',
      width: 27,
    );
  }

  if (currency.isFlagImage) {
    return Image.asset(
      currency.flag!.imagePath,
      package: 'currency_picker',
      width: 27,
    );
  }

  return Text(
    CurrencyUtils.currencyToEmoji(currency),
    style: TextStyle(
      fontSize: 24.sp, // Or widget.theme?.flagSize ?? 25,
    ),
  );
}

extension StringExtensions on String {
  String get imagePath => 'lib/src/res/$this';
}
