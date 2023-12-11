import 'package:bloc_173/listmap_bloc/list_event.dart';
import 'package:bloc_173/listmap_bloc/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState>{

  ListBloc() : super(ListState(mData: [])){

    on<AddMapEvent>((event, emit) {
      var currData = state.mData;
      currData.add(event.newMap);
      emit(ListState(mData: currData));
    });

    on<FetchAllMap>((event, emit){
      emit(ListState(mData: state.mData));
    });

  }
}