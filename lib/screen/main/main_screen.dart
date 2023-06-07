import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_report/screen/main/main_cubit.dart';
import 'package:insight_report/screen/main/screen_state.dart';
import 'package:insight_report/screen/master_data/masterdata_screen.dart';
import 'package:insight_report/utils/navigator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, ScreenState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: state.getAppBar(context),
        drawer: const Drawer(
          child: DrawerHeader(
            curve: Curves.bounceIn,
            child: Text(
              "Insight Report",
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.getIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(state.getIndex == 0 ? Icons.dashboard : Icons.dashboard_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(state.getIndex == 1 ? Icons.analytics : Icons.analytics_outlined),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined, color: Colors.transparent),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(state.getIndex == 3 ? Icons.insights : Icons.insights_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(state.getIndex == 4 ? Icons.person : Icons.person_outlined),
              label: "",
            ),
          ],
          onTap: (value) => context.read<MainCubit>().changeScreen(value),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigateTo(context, const MasterDataScreen()),
          child: const Icon(Icons.list_alt, color: Colors.white),
        ),
        body: state.getBody(context),
      );
    });
  }
}
