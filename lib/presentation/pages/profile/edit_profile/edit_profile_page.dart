import 'package:final_project_edspert/application/users/edit_profile_page/edit_profile_bloc.dart';
import 'package:final_project_edspert/application/users/profile_page/profile_page_bloc.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/users/user.dart';
import 'package:final_project_edspert/presentation/pages/profile/edit_profile/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/edit_profile/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:final_project_edspert/presentation/utils/utils_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double bottomCalc = 40 + 12.5 * 2;
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
          child: BlocProvider(
            create: (context) => EditProfileBloc(),
            child: BlocConsumer<EditProfileBloc, EditProfileState>(
              listener: (context, state) {
                if (state.isSubmited) {
                  Navigator.pop(context);
                  BlocProvider.of<ProfilePageBloc>(context)
                      .add(ProfilePageEventOnRefresh());
                }
              },
              builder: (context, editState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: ColorsApp.backgroundPage,
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
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
                              EditFormFieldWidget(
                                nameField: 'Nama Lengkap',
                                hintText: 'ubah nama anda',
                                initValue: editState.namaLengkap.value,
                                onChanged: (value) => value != null
                                    ? BlocProvider.of<EditProfileBloc>(context)
                                        .add(OnNamaLengkapChanged(value))
                                    : () {},
                                validator: (_) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .state
                                        .namaLengkap
                                        .validators(),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              EditFormFieldWidget(
                                nameField: 'Email',
                                enabled: false,
                                hintText: 'ubah email anda',
                                initValue: editState.emailAddress.value,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              EditDropdownFormFieldWidget(
                                nameField: 'Jenis Kelamin',
                                hintText: 'pilih jenis kelamin',
                                items: UtilsApp.genders,
                                initValue: editState.jenisKelamin.value,
                                validator: (_) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .state
                                        .jenisKelamin
                                        .validators(),
                                onChanged: (value) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .add(OnJenisKelaminChanged(value!)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              EditDropdownFormFieldWidget(
                                nameField: 'Kelas',
                                hintText: 'pilih kelas',
                                items: UtilsApp.classes,
                                initValue: editState.kelas.value,
                                validator: (_) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .state
                                        .kelas
                                        .validators(),
                                onChanged: (value) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .add(OnKelasChanged(value!)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              EditFormFieldWidget(
                                nameField: 'Sekolah',
                                hintText: 'ubah nama sekolah anda',
                                initValue: editState.namaSekolah.value,
                                validator: (_) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .state
                                        .namaSekolah
                                        .validators(),
                                onChanged: (value) =>
                                    BlocProvider.of<EditProfileBloc>(context)
                                        .add(OnNamaSekolahChanged(value!)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: ColorsApp.backgroundPage,
                      height: bottomCalc,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: TextButtonApp.textButtonCustom2(
                          'Perbarui Data',
                          onPressed: () =>
                              BlocProvider.of<EditProfileBloc>(context).add(
                            OnUpdatePressed(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
