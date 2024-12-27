part of 'fetchdata_bloc.dart';

sealed class FetchDataEvent extends Equatable {
  const FetchDataEvent();

  @override
  List<Object> get props => [];
}

class FetchDataLoaded extends FetchDataEvent {
  @override
  List<Object> get props => [];
}

class FetchDataToggle extends FetchDataEvent {
  final String pairName;

  const FetchDataToggle({required this.pairName});

  @override
  List<Object> get props => [pairName];
}

class FetchDataRefreshed extends FetchDataEvent {}
