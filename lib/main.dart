import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_project/Business%20Logic%20Layer/theme_cubit.dart';
import 'package:theme_project/Helper/enum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeEnum>(
        builder: (context, theme) {
          return MaterialApp(
            theme: _buildThemeData(theme),
            home: MyHomePage(),
          );
        },
      ),
    );
  }

  ThemeData _buildThemeData(ThemeModeEnum mode) {
    switch (mode) {
      case ThemeModeEnum.light:
        return ThemeData.light();
      case ThemeModeEnum.dark:
        return ThemeData.dark();
      case ThemeModeEnum.reading:
        return ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.red[50],
        );
    }
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Theme'),
        actions: [
          PopupMenuButton<ThemeModeEnum>(
            onSelected: (mode) {
              BlocProvider.of<ThemeCubit>(context).setTheme(mode);
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<ThemeModeEnum>>[
              const PopupMenuItem<ThemeModeEnum>(
                value: ThemeModeEnum.light,
                child: Text('Light Theme'),
              ),
              const PopupMenuItem<ThemeModeEnum>(
                value: ThemeModeEnum.dark,
                child: Text('Dark Theme'),
              ),
              const PopupMenuItem<ThemeModeEnum>(
                value: ThemeModeEnum.reading,
                child: Text('Reading Theme'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Theme Project!',
            ),
          ],
        ),
      ),
    );
  }
}
