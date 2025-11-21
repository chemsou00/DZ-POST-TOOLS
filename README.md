# 📮 CCP & RIP Calculator — Algeria 🇩🇿

A Dart library for validating and calculating the **CCP Key**, **RIP**, and **Postal Transaction Fees** for accounts in Algérie Poste.

This project is based on the Python library by [mouh2020](https://github.com/mouh2020) and has been fully ported to Dart/Flutter for easy integration.

---

## ✨ Features

| Feature | Description |
|--------|-------------|
| ✔ Compute CCP Key | Validate transfers by using a 2‑digit checksum |
| ✔ Generate RIP Number | Convert a CCP to a full 20‑digit IBAN‑like number |
| ✔ Get RIP Key | Extract last 2 digits from the RIP |
| ✔ Calculate Transfer Fees | Based on Algérie Poste current pricing |
| ✔ Calculate “Checkout / Chèque Cashout” Fees | Based on withdrawal amount |

---

## 📌 What is CCP Key?

CCP accounts in Algeria consist of:


The **key** prevents transfer mistakes.  
This library calculates it automatically.

## Example:
### 🚀 Usage

```dart
import 'package:ccp_rip/ccp_rip.dart';

void main() {

// THIS CCP NUMBER IS JUST A TEST NUMBER IN CODE NOT FOR ANY USE 
  CCP account = CCP("0023456789");

  print("CCP Key: ${account.getCle()}");       // -> 88
  print("RIP: ${account.getRip()}");           // -> 007999990023456789
  print("RIP Key: ${account.getRipCle()}");   // -> 41

  Transaction t = Transaction(25000);
  print("Deposit Fees: ${t.getDepositFees()} DA");
  print("Checkout Fees: ${t.getCheckoutFees()} DA");
}

```

## 🚧 Notes & Limitations

This library does not validate if a CCP truly exists — it only checks structural correctness.

Fee structure may change if Algérie Poste updates pricing.

## 🙏 Credits

This Dart library is based on the Python library by [mouh2020](https://github.com/mouh2020).

We thank them for providing the original CCP/RIP algorithm which made this port possible.

--