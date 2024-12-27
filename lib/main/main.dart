import 'package:flutter/material.dart';
import 'package:flutter_application_3/fetchdata_bloc/fetchdata_bloc.dart';
import 'package:flutter_application_3/main/home_app.dart';
import 'package:flutter_application_3/main/scroll_app.dart';


import 'package:flutter_application_3/repository_app/repository.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_bloc.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                FetchDataBloc(RepositoryData())..add(FetchDataLoaded()),
          ),
          
          BlocProvider(
              create: (context) => ThemeAppBloc()..add(InitialThemeSetEvent())),
        ],
        child: const CurrencyApp(),
      ),
    );

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeAppBloc, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: const HomeCurrencyApp(),
        );
      },
    );
  }
}
