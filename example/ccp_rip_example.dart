import 'package:ccp_rip/ccp_rip.dart';

void main() {
  // THIS CCP NUMBER IS JUST A TEST NUMBER IN CODE, NOT FOR ANY USE
  final account = CCP("0023456789");

  // Access getters instead of methods
  print("CCP Key: ${account.cle}"); // -> 88
  print("RIP: ${account.rip}"); // -> full RIP string
  print("RIP Key: ${account.ripCle}"); // -> last 2 digits

  final depositTransaction = Transaction(25000);
  print("Deposit Fees: ${depositTransaction.depositFees} DA");
  print("Checkout Fees: ${depositTransaction.checkoutFees} DA");
}
