import 'package:final_project_edspert/presentation/pages/home/widget/bottom_navigation_bar_app.dart';
import 'package:final_project_edspert/presentation/pages/home/widget/home_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/profile_page.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const _homePage = HomeWidget();
  static const _profilePage = ProfilePage();

  static bool _isCurrentPage(Widget path) {
    return _pageNow == path;
  }

  static String _iconNavTogglePath(Widget path) {
    return "assets/icons/nav_toggle_${_isCurrentPage(path) ? "on" : "off"}";
  }

  static Color _titleColoring(Widget path) {
    return _isCurrentPage(path)
        ? ColorsApp.titleActive
        : ColorsApp.titleDisable;
  }

  static Widget _pageNow = _homePage;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 53,
              child: HomePage._pageNow,
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
                    icon:
                        "${HomePage._iconNavTogglePath(HomePage._homePage)}/home.png",
                    navigationTo: () {
                      HomePage._pageNow = HomePage._homePage;
                      setState(() {});
                    },
                    titleColor: HomePage._titleColoring(HomePage._homePage),
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
                    icon:
                        "${HomePage._iconNavTogglePath(HomePage._profilePage)}/profile.png",
                    navigationTo: () {
                      HomePage._pageNow = HomePage._profilePage;
                      setState(() {});
                    },
                    titleColor: HomePage._titleColoring(HomePage._profilePage),
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
