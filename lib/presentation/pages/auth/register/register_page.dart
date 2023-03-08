import 'package:final_project_edspert/application/auth/register_page/register_page_bloc.dart';
import 'package:final_project_edspert/application/users/profile_page/profile_page_bloc.dart';
import 'package:final_project_edspert/application/utils/toggle/toggle_bloc.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/dropdown_form_field_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/widgets/text_form_field_widget.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/utils_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/toggle_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final String? initValueEmail;
  final String? initDisplayName;

  const RegisterPage({super.key, this.initValueEmail, this.initDisplayName});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterPageBloc _bloc = RegisterPageBloc();
  final ToggleBloc _jenisKelaminToggleBloc = ToggleBloc(
    {for (var gender in UtilsApp.genders) gender: false},
  );

  @override
  void initState() {
    _bloc.add(OnLoad());
    if (widget.initValueEmail != null && widget.initDisplayName != null) {
      _bloc.add(OnEmailChanged(widget.initValueEmail!));
      _bloc.add(OnNamaLengkapChanged(widget.initDisplayName!));
    }
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _bloc.close();
    await _jenisKelaminToggleBloc.close();
  }

  @override
  Widget build(BuildContext context) {
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
        listener: (context, state) {
          if (state.isSubmited) {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushReplacementNamed(context, RouterApp.homePage);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              color: ColorsApp.backgroundPage,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        children: [
                          FormFieldWidget(
                              initValue: widget.initValueEmail,
                              enabled: widget.initValueEmail == null,
                              nameField:
                                  'Email${widget.initValueEmail == null ? '' : ' (sudah terisi otomatis)'}',
                              hintText: 'contoh: kevinnicholas2019@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => value != null
                                  ? _bloc.add(OnEmailChanged(value))
                                  : () {},
                              validator: (_) =>
                                  _bloc.state.emailAddress.validators()),
                          const SizedBox(
                            height: 24,
                          ),
                          FormFieldWidget(
                              initValue: widget.initDisplayName,
                              nameField: 'Nama lengkap',
                              hintText: 'contoh: Kevin Nicholas',
                              keyboardType: TextInputType.name,
                              onChanged: (value) => value != null
                                  ? _bloc.add(OnNamaLengkapChanged(value))
                                  : () {},
                              validator: (_) =>
                                  _bloc.state.namaLengkap.validators()),
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
                          ToggleWidget(
                            bloc: _jenisKelaminToggleBloc,
                            onPressedCallback: (value) => _bloc.add(
                              OnJenisKelaminChanged(value),
                            ),
                            validator: () {
                              final fails = _bloc.state.jenisKelamin.failures();
                              return fails.map((e) => e.failedValue).toList();
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          DropdownFormFieldWidget(
                              nameField: 'Kelas',
                              hintText: 'pilih kelas',
                              items: UtilsApp.classes,
                              value: '',
                              onChanged: (value) => value != null
                                  ? _bloc.add(OnKelasChanged(value))
                                  : () {},
                              validator: (_) => _bloc.state.kelas.validators()),
                          const SizedBox(
                            height: 24,
                          ),
                          FormFieldWidget(
                              nameField: 'Nama sekolah',
                              hintText: 'nama sekolah',
                              keyboardType: TextInputType.name,
                              onChanged: (value) => value != null
                                  ? _bloc.add(OnNamaSekolahChanged(value))
                                  : () {},
                              validator: (_) =>
                                  _bloc.state.namaSekolah.validators()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 64 + 12.5 * 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 12.5,
                      ),
                      child: TextButtonApp.textButtonCustom1(
                        'DAFTAR',
                        onPressed: () => _bloc.add(OnDaftarPressed()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
