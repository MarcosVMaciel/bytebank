import 'package:bytebank/models/contact.dart';

class Transacao {
  final double value;
  final Contact contact;

  Transacao(
    this.value,
    this.contact,
  );

  Transacao.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transação{value: $value, contact: $contact}';
  }
}
