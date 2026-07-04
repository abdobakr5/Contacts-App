import 'package:contacts_app/controllers/contacts_controller.dart';
import 'package:contacts_app/core/constants/app_assets.dart';
import 'package:contacts_app/core/constants/app_colors.dart';
import 'package:contacts_app/core/constants/app_strings.dart';
import 'package:contacts_app/screens/home/widgets/contacts_bottom_sheet.dart';
import 'package:contacts_app/screens/home/widgets/contacts_grid.dart';
import 'package:contacts_app/screens/home/widgets/floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/empty_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ContactsController controller = ContactsController();

  void _showAddContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      builder: (_) {
        return ContactsBottomSheet(
          onAddContact: (contact) {
            setState(() {
              controller.addContact(contact);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: const CustomAppBar(),
      body: controller.isEmpty
          ? const EmptyContacts()
          : ContactsGrid(
        contacts: controller.allContacts,
        onDelete: (index) {
          setState(() {
            controller.deleteContact(index);
          });
        },
      ),
      floatingActionButton: FloatingButtons(
        isFull: controller.isFull,
        isEmpty: controller.isEmpty,
        onAdd: _showAddContactBottomSheet,
        onDeleteLast: () {
          setState(() {
            controller.deleteLastContact();
          });
        },
      ),
    );
  }
}