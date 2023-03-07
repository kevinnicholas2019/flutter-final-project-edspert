import 'package:final_project_edspert/application/auth/register_page/register_page_bloc.dart';
import 'package:final_project_edspert/application/utils/toggle/toggle_bloc.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/utils_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/toggle_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  static final RegisterPageBloc _bloc = RegisterPageBloc();

  final String? initValueEmail;
  final String? initDisplayName;

  static final ToggleBloc _jenisKelaminToggleBloc = ToggleBloc(
    {for (var gender in UtilsApp.genders) gender: false},
  );
  static String? kelasValue;

  const RegisterPage({super.key, this.initValueEmail, this.initDisplayName});

  @override
  Widget build(BuildContext context) {
    const double bottomCalc = 64 + 30 * 2;
    print(_bloc);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: AppBar(
          iconTheme: const IconThemeData(
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
      body: BlocConsumer<RegisterPageBloc, RegisterPageState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  color: ColorsApp.backgroundPage,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      children: [
                        FormFieldWidget(
                          initValue: initValueEmail,
                          enabled: initValueEmail == null,
                          nameField:
                              'Email${initValueEmail == null ? '' : ' (sudah terisi otomatis)'}',
                          hintText: 'contoh: kevinnicholas2019@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => value != null
                              ? _bloc.add(OnEmailChanged(value))
                              : () {},
                          validator: (_) {
                            return "wqfhjqwfhjwqkfhjkqwhf";
                            // final fails = _bloc.state.emailAddress.failures();
                            // final msgFail = fails.fold(
                            //   "",
                            //   (previousValue, element) =>
                            //       previousValue + element.failedValue,
                            // );
                            // return msgFail == "" ? null : msgFail;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        FormFieldWidget(
                          initValue: initDisplayName,
                          nameField: 'Nama lengkap',
                          hintText: 'contoh: Kevin Nicholas',
                          keyboardType: TextInputType.name,
                          validator: (_) {
                            return "wqfhjqwfhjwqkfhjkqwhf";
                            // final fails = _bloc.state.emailAddress.failures();
                            // final msgFail = fails.fold(
                            //   "",
                            //   (previousValue, element) =>
                            //       previousValue + element.failedValue,
                            // );
                            // return msgFail == "" ? null : msgFail;
                          },
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
                          items: UtilsApp.classes,
                          value: '',
                          onChanged: (String? value) {
                            kelasValue = value;
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
                          height: bottomCalc - 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: ColorsApp.backgroundPage,
                    width: double.infinity,
                    height: bottomCalc - 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: TextButtonApp.textButtonCustom1(
                        'DAFTAR',
                        onPressed: () {
                          print("asd");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
