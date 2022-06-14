class Transfers {
  final double value;
  final int accountNumber;

  Transfers(
    this.value,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transfers{value: $value, accountNumber: $accountNumber}';
  }
}
