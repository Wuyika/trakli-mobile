import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';
import 'package:trakli/presentation/home_screen.dart';

void main() {
  testWidgets('HomeScreen has an AppBar with title Trakli',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify the AppBar title
    expect(find.text(LocaleKeys.appName.tr()), findsOneWidget);
  });

  testWidgets('HomeScreen has a Text widget with Welcome to Trakli',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify the Text widget
    expect(find.text(LocaleKeys.welcomeText.tr()), findsOneWidget);
  });
}
