import 'package:ccp_rip/ccp_rip.dart';


void main() {
  CCP account = CCP("0023456789");

  print("CCP Key: ${account.getCle()}");       // -> 88
  print("RIP: ${account.getRip()}");           // -> 007999990023456789
  print("RIP Key: ${account.getRipCle()}");   // -> 41

  Transaction t = Transaction(25000);
  print("Deposit Fees: ${t.getDepositFees()} DA");
  print("Checkout Fees: ${t.getCheckoutFees()} DA");
}
