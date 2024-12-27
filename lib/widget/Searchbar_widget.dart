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
            return state.dataList.where((a) {
              return a.idName.toLowerCase().contains(lowerCase);
            }).map((a) {
              return ListTile(
                title: Text(a.idName),
                subtitle: Text(
                    (NumberFormat.currency(symbol: "\$", decimalDigits: 5)
                        .format(a.price))),
                trailing: Text(a.isPin == true ? "isPined!" : ""),
                leading: IconButton(
                    onPressed: () {
                      searchController.closeView(searchController.text);
                      context
                          .read<FetchDataBloc>()
                          .add(FetchDataToggle(idName: a.idName));
                    },
                    icon: Icon(a.isPin == true ?  Icons.push_pin : Icons.push_pin_outlined)),
                // leading: BlocSelector<FetchDataBloc, FetchDataState, bool>(
                //   selector: (state) {
                //     final length = (state as FetchDataLoadSuccess)
                //         .dataList
                //         .where((e) => e.isPin)
                //         .length;
                //     return length < 4;
                //   },
                //   builder: (context, canPinMore) {
                //     if (canPinMore) {
                //       return IconButton(
                //           tooltip: "Pin To Main Screen",
                //           onPressed: () {
                //             searchController.closeView(searchController.text);
                //             context
                //                 .read<FetchDataBloc>()
                //                 .add(FetchDataToggle(idName: a.idName));
                //           },
                //           icon: Icon(a.isPin == true
                //               ? Icons.push_pin
                //               : Icons.push_pin_outlined));
                //     }

                //     return const SizedBox(
                //       width: 40,
                //     );
                //   },
                // ),
              );
            });
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
