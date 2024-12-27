part of 'fetchdata_bloc.dart';

sealed class FetchDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchDataLoadInProgress extends FetchDataState {
  @override
  List<Object?> get props => [];
}

final class FetchDataLoadSuccess extends FetchDataState {
  final List<ReceiveData> dataList;
  final bool isRefreshing;

  FetchDataLoadSuccess({
    required this.dataList,
    this.isRefreshing = false,
  });

  @override
  List<Object?> get props => [dataList, isRefreshing];

  FetchDataLoadSuccess copyWith({
    List<ReceiveData>? dataList,
    bool? isRefreshing,
  }) {
    return FetchDataLoadSuccess(
      dataList: dataList ?? this.dataList,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

final class FetchDataLoadFailure extends FetchDataState {
  final String error;

  FetchDataLoadFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
