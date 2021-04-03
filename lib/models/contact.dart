class Contact {
  final int id;
  final String name;
  final int accounteNumber;

  Contact(this.id, this.name, this.accounteNumber);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accounteNumber: $accounteNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accounteNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'accountNumber': accounteNumber,
  };
}
