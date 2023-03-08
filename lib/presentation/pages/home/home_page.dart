import 'package:final_project_edspert/application/users/profile_page/profile_page_bloc.dart';
import 'package:final_project_edspert/presentation/pages/home/widget/bottom_navigation_bar_app.dart';
import 'package:final_project_edspert/presentation/pages/home/widget/home_widget.dart';
import 'package:final_project_edspert/presentation/utils/widgets/unsafe_color_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/profile_page.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homePage = const HomeWidget();
  final _profilePage = const ProfilePage();

  bool _isCurrentPage(Widget path) {
    return _pageNow == path;
  }

  String _iconNavTogglePath(Widget path) {
    return "assets/icons/nav_toggle_${_isCurrentPage(path) ? "on" : "off"}";
  }

  Color _titleColoring(Widget path) {
    return _isCurrentPage(path)
        ? ColorsApp.titleActive
        : ColorsApp.titleDisable;
  }

  late UnsafeColorWidget _pageNow;

  @override
  void initState() {
    _pageNow = _homePage;
    BlocProvider.of<ProfilePageBloc>(context).add(ProfilePageEventOnRefresh());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: _pageNow.unsafeColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 53,
              child: _pageNow,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 53,
                color: ColorsApp.backgroundPage,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBarApp(
                floatingActionButton: FloatingActionButton.large(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RouterApp.diskusiSoalPage,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage("assets/icons/Quiz icon.png"),
                      color: ColorsApp.offWhite,
                    ),
                  ),
                ),
                listBottomNavigationBarItemApp: [
                  BottomNavigationBarItemApp(
                    title: "Home",
                    icon: "${_iconNavTogglePath(_homePage)}/home.png",
                    navigationTo: () {
                      _pageNow = _homePage;
                      setState(() {});
                    },
                    titleColor: _titleColoring(_homePage),
                  ),
                  BottomNavigationBarItemApp(
                    title: "Diskusi Soal",
                    navigationTo: () => Navigator.pushNamed(
                      context,
                      RouterApp.diskusiSoalPage,
                    ),
                    titleColor: ColorsApp.titleDisable,
                  ),
                  BottomNavigationBarItemApp(
                    title: "Profile",
                    icon: "${_iconNavTogglePath(_profilePage)}/profile.png",
                    navigationTo: () {
                      _pageNow = _profilePage;
                      setState(() {});
                    },
                    titleColor: _titleColoring(_profilePage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
