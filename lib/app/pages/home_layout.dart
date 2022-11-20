import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/widgets.dart';

import 'dashboard/dashboard_page.dart';
import 'dsa_list/dsa_list_page.dart';
import 'dsa_routes/dsa_routes_page.dart';

class HomeLayout extends StatefulWidget {
  /// default constructor
  const HomeLayout({
    super.key,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardPage(),
          DsaRoutesPage(),
          DsaListPage(),
          DsaListPage(),
        ],
      ),
      bottomNavigationBar: FloatingBottomBar(
        onItemSelected: (index) => pageController.jumpToPage(index),
        items: [
          BottomElevenItem(
            label: 'Dashboard',
            icon: FontAwesomeIcons.house,
          ),
          BottomElevenItem(
            label: 'Routes',
            icon: FontAwesomeIcons.barsProgress,
          ),
          BottomElevenItem(
            label: 'Problems',
            icon: FontAwesomeIcons.arrowUpRightDots,
          ),
          BottomElevenItem(
            label: 'Solved',
            icon: FontAwesomeIcons.flagCheckered,
          ),
        ],
      ),
    );
  }
}
