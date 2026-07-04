import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_strings.dart';
import '../../../models/contact_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/preview_card.dart';

class ContactsBottomSheet extends StatefulWidget {
  const ContactsBottomSheet({
    super.key,
    required this.onAddContact,
  });

  final Function(ContactModel contact) onAddContact;

  @override
  State<ContactsBottomSheet> createState() =>
      _ContactsBottomSheetState();
}

class _ContactsBottomSheetState extends State<ContactsBottomSheet> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: PreviewCard(
                  image: selectedImage,
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                ),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: nameController,
                hintText: AppStrings.enterName,
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: emailController,
                hintText: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: phoneController,
                hintText: AppStrings.enterPhone,
                keyboardType: TextInputType.phone,
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: AppStrings.enterUser,
                onPressed: () {
                  if (selectedImage == null) return;

                  if (nameController.text.trim().isEmpty) return;

                  if (emailController.text.trim().isEmpty) return;

                  if (phoneController.text.trim().isEmpty) return;

                  final contact = ContactModel(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneController.text.trim(),
                    image: selectedImage!.path,
                  );

                  widget.onAddContact(contact);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}