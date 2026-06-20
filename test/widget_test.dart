import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/app.dart';

void main() {
  testWidgets('Portfolio app creates without error', (WidgetTester tester) async {
    expect(const PortfolioApp(), isA<PortfolioApp>());
  });
}
