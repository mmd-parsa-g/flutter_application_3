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
        final sp = await SharedPreferences.getInstance();
        final pinIds = sp.getStringList('pin_list') ?? [];

        final list = data.map((e) {
          return e.copyWith(
            isPin: pinIds.contains(e.idName),
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
            for (final a in pinState.dataList)
              if (a.idName != event.idName) a else a.copyWith(isPin: !a.isPin)
          ];

          final pinnedIds = [
            ...state.where((e) => e.isPin).map((e) => e.idName)
          ];

          final sp = await SharedPreferences.getInstance();
          sp.setStringList('pin_list', pinnedIds);

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

        final freshedItems = cachedItems.map((e) {
          final newItem = data.firstWhere((i) {
            return e.idName == i.idName;
          }, orElse: () => e);

          return e.copyWith(price: newItem.price);
        });

        emit(FetchDataLoadSuccess(
            dataList: [...freshedItems], isRefreshing: false));
      } catch (e) {
        emit(FetchDataLoadFailure(error: e.toString()));
      }
    });
  }
}
