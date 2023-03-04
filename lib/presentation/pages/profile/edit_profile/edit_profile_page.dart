import 'package:final_project_edspert/presentation/pages/profile/edit_profile/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/edit_profile/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:final_project_edspert/presentation/utils/utlis_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double bottomCalc = 40 + 10 * 2;
    return Scaffold(
        appBar: AppBarDefault.make(
          title: 'Edit Akun',
          titleTextStyle: TextStyleApp.largeTextDefault.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: ColorsApp.offWhite,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: ColorsApp.backgroundPage,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      'Data Diri',
                      style: TextStyleApp.largeTextDefault.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const EditFormFieldWidget(
                      nameField: 'Nama Lengkap',
                      hintText: 'ubah nama anda',
                      initValue: 'Kevin Nicholas',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const EditFormFieldWidget(
                      nameField: 'Email',
                      hintText: 'ubah email anda',
                      initValue: 'kevinnicholas2019@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    EditDropdownFormFieldWidget(
                      nameField: 'Jenis Kelamin',
                      hintText: 'pilih jenis kelamin',
                      items: UtilsApp.genders,
                      initValue: 'Laki-laki',
                      onChanged: (String? value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    EditDropdownFormFieldWidget(
                      nameField: 'Kelas',
                      hintText: 'pilih kelas',
                      items: UtilsApp.classes,
                      initValue: 'XII-IPA',
                      onChanged: (String? value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const EditFormFieldWidget(
                      nameField: 'Sekolah',
                      hintText: 'ubah nama sekolah anda',
                      initValue: 'SMAK 2 Penabur',
                    ),
                    const SizedBox(
                      height: bottomCalc,
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
                      vertical: 10,
                    ),
                    child: TextButtonApp.textButtonCustom2('Perbarui Data'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
