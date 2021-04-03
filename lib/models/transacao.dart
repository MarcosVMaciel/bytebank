import 'package:bytebank/models/contact.dart';

class Transacao {
  final double value;
  final Contact contact;

  Transacao(
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transação{value: $value, contact: $contact}';
  }
}
