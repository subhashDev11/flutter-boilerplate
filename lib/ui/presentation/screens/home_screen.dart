import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/theme.dart';
import '../../../cubit/theme_cubit.dart';
import '../widgets/first_screen/info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          const InfoCard(
              title: 'Language',
              content: 'Change App Language',
              icon: Icons.language,
              isPrimaryColor: false,
          ),
          InkWell(
            onTap: (){
              bool isDark = theme.brightness == Brightness.dark;
              BlocProvider.of<ThemeCubit>(context).getTheme(ThemeState(
                  !isDark ? AppThemes.darkTheme : AppThemes.lightTheme));
            },
            child: const InfoCard(
              title: 'Theme',
              content: 'Change App Theme',
              icon: Icons.brightness_2_outlined,
              isPrimaryColor: false,
            ),
          ),
        ],
      ),
    );
  }
}
