import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {

  HomepageBloc() : super(_HomePageInitial(index: 0)) {
    on<HomepageEvent>((event, emit) {
      if(event is PageChangeEvent){
        emit(_HomePageInitial(index: event.index));
      }
    });
    
  }

 
}
