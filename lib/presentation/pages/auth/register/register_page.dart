import 'package:final_project_edspert/presentation/pages/auth/register/widgets/form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // Initial Selected Value
  static String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  static var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: ColorsApp.titleActive,
            size: 24,
          ),
          title: const Text('Yuk isi data diri'),
          backgroundColor: ColorsApp.background,
          foregroundColor: ColorsApp.titleActive,
          elevation: 20.0,
          shadowColor: ColorsApp.titleActive.withOpacity(0.16),
          titleTextStyle: TextStyleApp.largeText20,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: ListView(
            children: [
              FormFieldWidget(
                nameField: 'Email',
                hintText: 'contoh: kevinnicholas2019@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              FormFieldWidget(
                nameField: 'Nama lengkap',
                hintText: 'contoh: Kevin Nicholas',
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Kelas',
                style: TextStyleApp.largeTextDefault.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                style: TextStyleApp.largeTextDefault.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'pilih kelas',
                  hintStyle: TextStyleApp.largeTextDefault.copyWith(
                    fontSize: 16,
                    color: ColorsApp.placeholder,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorsApp.titleActive, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.line, width: 1.0),
                  ),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                borderRadius: BorderRadius.circular(8.0),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? value) {},
              ),
              SizedBox(
                height: 24,
              ),
              FormFieldWidget(
                nameField: 'Nama sekolah',
                hintText: 'nama sekolah',
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          )),
    );
  }
}
