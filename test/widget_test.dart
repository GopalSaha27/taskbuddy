
import 'package:flutter_test/flutter_test.dart';

import 'package:taskbuddy/app.dart';

void main() {
  testWidgets('TaskBuddy app loads successfully', (WidgetTester tester) async {
    // Builds the TaskBuddy application.
    await tester.pumpWidget(const TaskBuddyApp());

    // Verifies that the TaskBuddy text is visible.
    expect(find.text('TaskBuddy'), findsOneWidget);
  });
}
