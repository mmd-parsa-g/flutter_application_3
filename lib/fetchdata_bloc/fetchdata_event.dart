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
  final String idName;

  const FetchDataToggle({required this.idName});

  @override
  List<Object> get props => [idName];
}

class FetchDataRefreshed extends FetchDataEvent {}
