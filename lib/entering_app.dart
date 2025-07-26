import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fplayer/src/core/theme/app_theme.dart';
import 'package:fplayer/src/core/theme/blocs/theme_cubit.dart';
import 'package:fplayer/src/di/injection_container.dart';
import 'package:fplayer/src/routing/app_routing.dart';

enteringApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: FPlayerApp(),
    ),
  );
}

class FPlayerApp extends StatelessWidget {
  const FPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'FPlayer',
          themeMode: state is DarkThemeState ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
