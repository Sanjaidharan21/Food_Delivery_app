
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/main.dart';

void main() {
  test('Healthy Bites app widget can be created', () {
    const app = HealthyBites();

    expect(app, isA<HealthyBites>());
  });
}
