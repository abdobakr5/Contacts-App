import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactsController extends ChangeNotifier {
  final List<ContactModel> contacts = [];

  List<ContactModel> get allContacts => contacts;

  void addContact(ContactModel contact) {
    if (contacts.length >= 6) return;

    contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }

  void deleteLastContact() {
    if (contacts.isEmpty) return;

    contacts.removeLast();
    notifyListeners();
  }

  bool get isEmpty => contacts.isEmpty;

  bool get isFull => contacts.length >= 6;
}