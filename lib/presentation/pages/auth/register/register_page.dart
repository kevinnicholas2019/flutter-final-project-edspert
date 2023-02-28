import 'package:final_project_edspert/presentation/pages/auth/register/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
          color: const Color(0xFFF0F3F5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: ListView(
            children: [
              const FormFieldWidget(
                nameField: 'Email',
                hintText: 'contoh: kevinnicholas2019@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              const FormFieldWidget(
                nameField: 'Nama lengkap',
                hintText: 'contoh: Kevin Nicholas',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Jenis kelamin',
                style: TextStyleApp.largeTextDefault.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ToggleButtons(
                textStyle: TextStyleApp.largeTextDefault.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                fillColor: ColorsApp.secondary,
                selectedColor: ColorsApp.offWhite,
                hoverColor: ColorsApp.secondary.withOpacity(0.15),
                borderColor: ColorsApp.line,
                borderRadius: BorderRadius.circular(8.0),
                constraints: const BoxConstraints(
                  minWidth: 9.02,
                  minHeight: 0,
                ),
                renderBorder: false,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2 -
                        (9.02 / 2),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Laki-laki',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2 -
                        (9.02 / 2),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Perempuan',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                isSelected: [
                  true,
                  false,
                  false,
                ],
                onPressed: (index) => {},
              ),
              const SizedBox(
                height: 24,
              ),
              DropdownFormFieldWidget(
                nameField: 'Kelas',
                hintText: 'pilih kelas',
                items: const [
                  'SMP 1',
                  'SMP 2',
                  'SMP 3',
                  'SMA 1',
                  'SMA 2 IPA',
                  'SMA 2 IPS',
                  'SMA 3 IPA',
                  'SMA 3 IPS',
                ],
                value: '',
                onChanged: (String? value) {
                  print(value);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const FormFieldWidget(
                nameField: 'Nama sekolah',
                hintText: 'nama sekolah',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          )),
    );
  }
}
