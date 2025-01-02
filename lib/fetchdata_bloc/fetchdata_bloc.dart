import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/repository_app/receive_data.dart';
import 'package:flutter_application_3/repository_app/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'fetchdata_event.dart';
part 'fetchdata_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  final RepositoryData _repositoryData;
  FetchDataBloc(this._repositoryData) : super(FetchDataLoadInProgress()) {
    on<FetchDataLoaded>((event, emit) async {
      emit(FetchDataLoadInProgress());

      try {
        final data = await _repositoryData.fetchData();
        final sharedPreferences = await SharedPreferences.getInstance();
        final pinIds = sharedPreferences.getStringList('pin_list') ?? [];

        final list = data!.map((element) {
          return element.copyWith(
            isPin: pinIds.contains(element.pair),
          );
        });

        emit(FetchDataLoadSuccess(dataList: [...list]));
      } catch (e) {
        emit(FetchDataLoadFailure(error: e.toString()));
      }
    });
    on<FetchDataToggle>(
      (event, emit) async {
        final pinState = state as FetchDataLoadSuccess;
        if (state is! FetchDataLoadSuccess) {
          return;
        } else if (state is FetchDataLoadSuccess) {
          final state = [
            for (final value in pinState.dataList)
              if (value.pair != event.pairName) value else value.copyWith(isPin: !value.isPin)
          ];

          final pinnedIds = [
            ...state.where((element) => element.isPin).map((element) => element.pair)
          ];

          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setStringList('pin_list', pinnedIds);

          emit(pinState.copyWith(dataList: state));
        }
      },
    );
    on<FetchDataRefreshed>((event, emit) async {
      if (state is! FetchDataLoadSuccess) {
        return;
      }

      try {
        emit((state as FetchDataLoadSuccess).copyWith(isRefreshing: true));
        final cachedItems = (state as FetchDataLoadSuccess).dataList;

        final data = await _repositoryData.fetchData();

        final freshedItems = cachedItems.map((element) {
          final newItem = data!.firstWhere((value) {
            return element.pair == value.pair;
          }, orElse: () => element);

          return element.copyWith(latestRate: newItem.latestRate);
        });

        emit(FetchDataLoadSuccess(
            dataList: [...freshedItems], isRefreshing: false));
      } catch (e) {
        emit(FetchDataLoadFailure(error: e.toString()));
      }
    });
  }
}
