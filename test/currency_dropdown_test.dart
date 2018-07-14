import 'package:test/test.dart';
import 'package:currency_dropdown/currency_dropdown.dart';

void main() {
  test('Currency dropdown is getting created', () {
    final dropdown = CurrencyDropDown(currencyValue: 'test', onChanged: () {},);
    assert(dropdown != null);
  });
}
