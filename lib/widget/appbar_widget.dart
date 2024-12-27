import 'package:flutter/material.dart';
import 'package:flutter_application_3/fetchdata_bloc/fetchdata_bloc.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_bloc.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarWidget extends AppBar {
  AppbarWidget({super.key})
      : super(title: const Text("Currency App"), actions: [
          BlocBuilder<FetchDataBloc, FetchDataState>(
            builder: (context, fetchData) {
              return Row(
                children: [
                  BlocSelector<FetchDataBloc, FetchDataState, bool?>(
                    selector: (state) {
                      if (state is! FetchDataLoadSuccess) {
                        return null;
                      }

                      return state.isRefreshing;
                    },
                    builder: (context, isRefreshing) {
                      if (isRefreshing == null) {
                        return const SizedBox.shrink();
                      }

                      if (isRefreshing) {
                        return const CircularProgressIndicator();
                      }

                      return IconButton(
                        onPressed: () {
                          context
                              .read<FetchDataBloc>()
                              .add(FetchDataRefreshed());
                        },
                        icon: const Icon(Icons.refresh),
                        tooltip: "refresh Data",
                      );
                    },
                  ),
                  IconButton(
                    tooltip: "change Theme",
                    onPressed: () {
                      BlocProvider.of<ThemeAppBloc>(context)
                          .add(ThemeSwitchEvent());
                    },
                    icon: Icon(Theme.of(context).brightness == Brightness.dark
                        ? Icons.dark_mode
                        : Icons.light_mode),
                  ),
                ],
              );
            },
          )
        ]);
}
