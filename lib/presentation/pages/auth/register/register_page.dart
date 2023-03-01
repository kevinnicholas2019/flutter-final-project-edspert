import 'package:final_project_edspert/application/utils/toggle/toggle_bloc.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/toggle_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static final ToggleBloc _jenisKelaminToggleBloc = ToggleBloc(const {
    'Laki-laki': false,
    'Perempuan': false,
  });

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double bottomCalc = 64 + 30 * 2;
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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: ColorsApp.backgroundPage,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
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
                  SizedBox(
                    height: 45,
                    child: ToggleWidget(
                      bloc: _jenisKelaminToggleBloc,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DropdownFormFieldWidget(
                    nameField: 'Kelas',
                    hintText: 'pilih kelas',
                    items: const [
                      'I',
                      'II',
                      'III',
                      'IV',
                      'V',
                      'VI',
                      'VII',
                      'VIII',
                      'IX',
                      'X',
                      'XI-IPA',
                      'XI-IPS',
                      'XII-IPA',
                      'XII-IPS',
                    ],
                    value: '',
                    onChanged: (String? value) {},
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
                    height: bottomCalc - 20,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: bottomCalc,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: TextButtonApp.textButtonCustom1('DAFTAR'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
