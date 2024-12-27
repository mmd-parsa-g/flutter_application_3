import 'package:flutter/material.dart';
import 'package:flutter_application_3/fetchdata_bloc/fetchdata_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({super.key});

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataBloc, FetchDataState>(
      builder: (context, state) {
        if (state is FetchDataLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FetchDataLoadFailure) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<FetchDataBloc>().add(FetchDataLoaded());
                  },
                  icon: const Icon(Icons.refresh)),
              const Text("Error Internet!"),
            ],
          );
        }
        if (state is FetchDataLoadSuccess) {
          Iterable<Widget> getsaggestions(String query) {
            final lowerCase = query.toLowerCase();
            return state.dataList.where((element) {
              return element.pair.toLowerCase().contains(lowerCase);
            }).map(
              (element) {
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          "https://static.sarrafex.com/${element.iconUrl}",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        element.pair,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        (NumberFormat.currency(
                                symbol: "\$",
                                decimalDigits: element.baseAssetDecimals)
                            .format(element.latestRate)),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: element.yesterdayPriceChangePercent > 0
                              ? Text(
                                  "24h +${element.yesterdayPriceChangePercent}%",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 12),
                                )
                              : Text(
                                  "24h ${element.yesterdayPriceChangePercent}%",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ))
                    ],
                  ),
                  trailing: Text(element.isPin == true ? "isPined!" : ""),
                  leading: IconButton(
                    onPressed: () {
                      searchController.closeView(searchController.text);
                      context
                          .read<FetchDataBloc>()
                          .add(FetchDataToggle(pairName: element.pair));
                    },
                    icon: Icon(element.isPin == true
                        ? Icons.push_pin
                        : Icons.push_pin_outlined),
                  ),
                );
              },
            );
          }

          return SearchAnchor.bar(
              barHintText: "Search Currency",
              searchController: searchController,
              viewHintText: "Search Currency",
              viewTrailing: [
                IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: const Icon(Icons.clear),
                  tooltip: 'delete',
                )
              ],
              suggestionsBuilder: (context, controller) {
                return getsaggestions(controller.text);
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
