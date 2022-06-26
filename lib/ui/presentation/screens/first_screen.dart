import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/bottom_nav_cubit.dart';
import '../HomeScreen.dart';
import '../widgets/widgets.dart';
import 'about_screen.dart';

const _pageNavigation = [
  HomeScreen(),
  AboutScreen(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>(
        create: (context) => BottomNavCubit(),
        child: Scaffold(
          appBar: const AppBarGone(),

          body: BlocBuilder<BottomNavCubit, int>(
            builder: (context, state) {
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _pageNavigation.elementAt(state));
            },
          ),

          bottomNavigationBar: const BottomNavBar(),
        ));
  }
}
