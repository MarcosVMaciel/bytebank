class Contact {
  final String name;
  final int accounteNumber;

  Contact(this.name, this.accounteNumber);

  @override
  String toString() {
    return 'Contact{name: $name, accounteNumber: $accounteNumber}';
  }
}
