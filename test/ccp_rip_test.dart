import 'package:ccp_rip/ccp_rip.dart';
import 'package:test/test.dart';

void main() {
  group('CCP TEST', () {
    //this is just a Test CCP NUMBER
    final ccp = CCP("0023456789");

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(ccp.getCle(), "88");
      expect(ccp.getRipCle(), "41");
      expect(ccp.getRipCle(), "41");
    });
  });
  group('Test Transaction', () {
    //Test Transaction
    final transaction  = Transaction(25000);

    setUp(() {
      // Additional setup goes here.
    });
    test('Second Test', () {
      expect(transaction.getDepositFees(), 78);
      expect(transaction.getCheckoutFees(), 93);
    });
  });
}
