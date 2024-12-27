import 'package:flutter/material.dart';
import 'package:flutter_application_3/fetchdata_bloc/fetchdata_bloc.dart';
import 'package:flutter_application_3/repository_app/receive_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FetchDataBloc, FetchDataState, List<ReceiveData>>(
      selector: (state) {
        return (state as FetchDataLoadSuccess)
            .dataList
            .where((e) => e.isPin)
            .toList();
      },
      builder: (context, list) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.idName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    children: [
                      Text(
                        NumberFormat.currency(symbol: "\$", decimalDigits: 5)
                            .format(item.price),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<FetchDataBloc>()
                          .add(FetchDataToggle(idName: item.idName));
                    },
                    label: const Text("Remove"),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
