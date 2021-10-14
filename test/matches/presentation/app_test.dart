import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_football_club/main.dart';

void main() {
  group('App', () {
    testWidgets('contains Bloc\'s Providers', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MultiBlocProvider), findsOneWidget);
    });

    testWidgets('contains MaterialApp widget', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('contains ThemeData widget', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(ThemeData), findsOneWidget);
    });
  });
}
