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
            .where((element) => element.isPin)
            .toList();
      },
      builder: (context, listIsPin) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: listIsPin.length,
          itemBuilder: (context, index) {
            final itemList = listIsPin[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          'https://static.sarrafex.com/${itemList.iconUrl}',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        itemList.pair,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              NumberFormat.currency(
                                      symbol: "\$",
                                      decimalDigits: itemList.baseAssetDecimals)
                                  .format(itemList.latestRate),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          itemList.yesterdayPriceChangePercent > 0
                              ? Text(
                                  "+${itemList.yesterdayPriceChangePercent}%",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 14),
                                )
                              : Text(
                                  "${itemList.yesterdayPriceChangePercent}%",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 14),
                                )
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<FetchDataBloc>()
                          .add(FetchDataToggle(pairName: itemList.pair));
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
