// TODO: Put public facing types in this file.

class CCP {
  String ccp;

  CCP(this.ccp);

  String getCle() {
    String x = ccp.padLeft(10, '0');
    List<String> values = x.split('');
    int cc = 0;
    int z = 9;

    for (int i = 4; i < 14; i++) {
      cc += int.parse(values[z]) * i;
      z--;
    }

    return (cc % 100).toString().padLeft(2, '0');
  }

  String _calculateRip() {
    int ccpInt = int.parse(ccp);
    int remainder = (ccpInt * 100) % 97;

    int x;
    if (remainder + 85 > 97) {
      x = 97 - (remainder + 85 - 97);
    } else {
      x = 97 - (remainder + 85);
    }

    return "00799999${ccpInt.toString().padLeft(10, '0')}$x";
  }

  String getRip({bool onlyCle = false}) {
    String rip = _calculateRip();
    return onlyCle ? rip.substring(rip.length - 2) : rip;
  }

  String getRipCle() {
    return getRip(onlyCle: true).padLeft(2, '0');
  }
}

class Transaction {
  double amount;

  Transaction(this.amount);

  double _calculateFees(String mode) {
    if (mode == "transfer") {
      return (amount / 5000).ceil() * 12 + 18;
    } else if (mode == "checkout") {
      int z = (amount / 1000).ceil();
      if (amount <= 18000) {
        return z * 2 + 18;
      } else if (amount > 18000 && amount <= 1000000) {
        return z * 3 + 18;
      } else {
        z = ((amount - 1000000) / 1000).ceil();
        return z * 6 + 3018;
      }
    }
    return 0;
  }

  double getDepositFees() => _calculateFees("transfer");
  double getCheckoutFees() => _calculateFees("checkout");
}
