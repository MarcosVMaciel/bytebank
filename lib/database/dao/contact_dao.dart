import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const tableSql = 'CREATE TABLE $_tableName('
      '$_contactId INTEGER PRIMARY KEY, '
      '$_contactName TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _contactId = 'id';
  static const String _contactName = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDataDase();
    Map<String, dynamic> contactMap = toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_contactName] = contact.name;
    contactMap[_accountNumber] = contact.accounteNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDataDase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = toList(result);
    return contacts;
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_contactId],
        row[_contactName],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
