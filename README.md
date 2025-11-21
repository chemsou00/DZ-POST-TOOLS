# 📮 CCP & RIP Calculator — Algeria 🇩🇿

A Dart library for validating and calculating the **CCP Key**, **RIP**, and **Postal Transaction Fees** for accounts in Algérie Poste.

This project is based on the Python library by [mouh2020](https://github.com/mouh2020) and has been fully ported to Dart/Flutter for easy integration.

---

## ✨ Features

| Feature | Description |
|--------|-------------|
| ✔ Compute CCP Key | Validate transfers using a 2‑digit checksum (`cle` getter) |
| ✔ Generate RIP Number | Convert a CCP to a full RIP string (`rip` getter) |
| ✔ Get RIP Key | Extract last 2 digits from the RIP (`ripCle` getter) |
| ✔ Calculate Deposit Fees | Based on Algérie Poste current pricing (`depositFees` getter) |
| ✔ Calculate Checkout Fees | Based on withdrawal amount (`checkoutFees` getter) |

---

## 📌 What is CCP Key?

CCP accounts in Algeria consist of:

```
XXX XXX XXX-X
```

The **clé** prevents transfer mistakes.  
This library calculates it automatically.

---

## 🚀 Usage Example

```dart
import 'package:ccp_rip/ccp_rip.dart';

void main() {
  // THIS CCP NUMBER IS JUST A TEST NUMBER IN CODE, NOT FOR ANY USE
  final account = CCP("0023456789");

  // Access getters instead of methods
  print("CCP Key: ${account.cle}");       // -> 88
  print("RIP: ${account.rip}");           // -> full RIP string
  print("RIP Key: ${account.ripCle}");    // -> last 2 digits

  final depositTransaction = Transaction(25000);
  print("Deposit Fees: ${depositTransaction.depositFees} DA");
  print("Checkout Fees: ${depositTransaction.checkoutFees} DA");
}
```

---

## 🚀 Advanced Usage

You can also calculate multiple transactions and CCPs easily:

```dart
final ccpList = ["1234567890", "9876543210"];
for (var number in ccpList) {
  final account = CCP(number);
  print("CCP: $number | Clé: ${account.cle} | RIP: ${account.rip} | RIP Clé: ${account.ripCle}");
}

final transactions = [10000, 50000, 2000000];
for (var amount in transactions) {
  final t = Transaction(amount.toDouble());
  print("Amount: $amount | Deposit Fees: ${t.depositFees} | Checkout Fees: ${t.checkoutFees}");
}
```

---
## 📦 How to use in your Flutter app

Add the package to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  ccp_rip:
    git:
      url: https://github.com/chemsou00/DZ-POST-TOOLS.git
      ref: main
```
---

## 🚧 Notes & Limitations

- This library **does not validate if a CCP truly exists** — it only checks structural correctness.
- Fee structure may change if Algérie Poste updates pricing.
- All calculations are based on publicly known formulas, not on live banking data.

---

## 🙏 Credits

This Dart library is based on the Python library by [mouh2020](https://github.com/mouh2020).  
We thank them for providing the original CCP/RIP algorithm which made this Dart/Flutter port possible.

