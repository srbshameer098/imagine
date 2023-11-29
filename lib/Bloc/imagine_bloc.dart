import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/imagine_api.dart';
import '../Repository/ModelClass/ImagineModel.dart';

part 'imagine_event.dart';
part 'imagine_state.dart';

class ImagineBloc extends Bloc<ImagineEvent, ImagineState> {
  ImagineApi imagineApi=ImagineApi();
  late ImagineModel imagineModel;
  ImagineBloc() : super(ImagineInitial()) {
    on<FetchImagine>((event, emit)async {
      emit(ImagineblocLoading());
      try{

        imagineModel =await imagineApi.getTranslate(event.message);
        emit(ImagineblocLoaded());
      }catch(e){
        print(e);
        emit(ImagineblocError());
      }
      // TODO: implement event handler
    });
  }
}
