import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../../../widgets/contact_card.dart';

class ContactsGrid extends StatelessWidget {
  const ContactsGrid({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  final List<ContactModel> contacts;
  final Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: contacts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .58,
        ),
        itemBuilder: (context, index) {
          return ContactCard(
            contact: contacts[index],
            onDelete: () => onDelete(index),
          );
        },
      ),
    );
  }
}