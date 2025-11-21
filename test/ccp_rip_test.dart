import 'package:ccp_rip/ccp_rip.dart';
import 'package:test/test.dart';

void main() {
  group('CCP Tests', () {
    // This is just a test CCP number
    final ccp = CCP("0023456789");

    setUp(() {
      // Optional setup before each test
    });

    test('CCP Key and RIP', () {
      expect(ccp.cle, "88");              // Test CCP key
      expect(ccp.ripCle, "41");           // Test last 2 digits of RIP
      expect(ccp.rip.length, greaterThan(10)); // Ensure full RIP string exists
      print('CCP Key: ${ccp.cle}');
      print('Full RIP: ${ccp.rip}');
      print('RIP Key: ${ccp.ripCle}');
    });
  });
}
