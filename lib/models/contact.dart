class Contact {
  final int id;
  final String name;
  final int accounteNumber;

  Contact(this.id, this.name, this.accounteNumber);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accounteNumber: $accounteNumber}';
  }
}
