import 'package:flutter/material.dart';
import 'package:flutter_application_3/fetchdata_bloc/fetchdata_bloc.dart';
import 'package:flutter_application_3/main/scroll_app.dart';
import 'package:flutter_application_3/widget/Searchbar_widget.dart';
import 'package:flutter_application_3/widget/appbar_widget.dart';
import 'package:flutter_application_3/widget/gridview_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCurrencyApp extends StatefulWidget {
  const HomeCurrencyApp({super.key});

  @override
  State<HomeCurrencyApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeCurrencyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 20, right: 8, left: 8),
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: const SearchbarWidget(),
              ),
            ),
          ),
          BlocSelector<FetchDataBloc, FetchDataState, bool?>(
            selector: (state) {
              if (state is FetchDataLoadSuccess) {
                return state.dataList.where((e) => e.isPin).isNotEmpty;
              }

              return null;
            },
            builder: (context, isHaveData) {
              if (isHaveData == null) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox.shrink(),
                );
              }

              if (isHaveData) {
                return const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GridViewWidget(),
                  ),
                );
              }

              return const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Wellcome to the App Please Pin Currency"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
