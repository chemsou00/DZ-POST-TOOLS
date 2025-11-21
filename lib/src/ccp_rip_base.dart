/// A class to handle CCP (Compte Chèques Postaux) operations.
class CCP {
  /// The CCP number as a string.
  final String ccp;

  /// Creates a CCP instance.
  ///
  /// Example:
  /// ```dart
  /// var myCCP = CCP('002345678');
  /// ```
  CCP(this.ccp);

  /// Returns the check key (clé) of the CCP as a 2-digit string.
  ///
  /// Example:
  /// ```dart
  /// var cle = myCCP.cle; // "42"
  /// ```
  String get cle {
    final padded = ccp.padLeft(10, '0');
    final digits = padded.split('').map(int.parse).toList();
    int total = 0;
    int index = 9;

    for (int weight = 4; weight < 14; weight++) {
      total += digits[index] * weight;
      index--;
    }

    return (total % 100).toString().padLeft(2, '0');
  }

  /// Returns the full RIP string.
  ///
  /// Example:
  /// ```dart
  /// var fullRip = myCCP.rip; // full RIP string
  /// ```
  String get rip => _calculateRip();

  /// Returns the RIP check key (last 2 digits) as a 2-character string.
  ///
  /// Example:
  /// ```dart
  /// var ripCle = myCCP.ripCle; // last 2 digits of RIP
  /// ```
  String get ripCle => rip.substring(rip.length - 2).padLeft(2, '0');

  /// Internal method to calculate the full RIP string.
  String _calculateRip() {
    final ccpInt = int.parse(ccp);
    final remainder = (ccpInt * 100) % 97;

    int checkValue;
    if (remainder + 85 > 97) {
      checkValue = 97 - (remainder + 85 - 97);
    } else {
      checkValue = 97 - (remainder + 85);
    }

    return "00799999${ccpInt.toString().padLeft(10, '0')}$checkValue";
  }
}

/// A class to calculate transaction fees for deposits and checkouts.
class Transaction {
  /// Transaction amount in the local currency.
  final double amount;

  /// Creates a Transaction instance.
  ///
  /// Example:
  /// ```dart
  /// var t = Transaction(15000);
  /// ```
  Transaction(this.amount);

  /// Returns the fees for a deposit (transfer).
  ///
  /// Example:
  /// ```dart
  /// var depositFees = t.depositFees;
  /// ```
  double get depositFees => _calculateFees(TransactionType.transfer);

  /// Returns the fees for a checkout.
  ///
  /// Example:
  /// ```dart
  /// var checkoutFees = t.checkoutFees;
  /// ```
  double get checkoutFees => _calculateFees(TransactionType.checkout);

  /// Internal method to calculate fees based on transaction type.
  double _calculateFees(TransactionType type) {
    switch (type) {
      case TransactionType.transfer:
        return (amount / 5000).ceil() * 12 + 18;
      case TransactionType.checkout:
        int units = (amount / 1000).ceil();
        if (amount <= 18000) {
          return units * 2 + 18;
        } else if (amount <= 1000000) {
          return units * 3 + 18;
        } else {
          units = ((amount - 1000000) / 1000).ceil();
          return units * 6 + 3018;
        }
    }
  }
}

/// Transaction types for internal fee calculations.
enum TransactionType { transfer, checkout }
