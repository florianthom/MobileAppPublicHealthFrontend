import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_state.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';

///
/// Basic bloc regarding the calender
/// useful to track the state of the calender in the context of the whole application
///
/// in redux: 1 bloc = X reducers = 1 reducer-file
///
class TableCalenderBloc extends Bloc<TableCalenderEvent, TableCalenderState> {
  TableCalenderBloc() : super(TableCalenderState(DateTime.now()));

  ///
  /// Override since bloc-pattern needs it to the given event to the appropriate "reducer"
  ///
  @override
  Stream<TableCalenderState> mapEventToState(TableCalenderEvent event) async* {
    if(event is SetSelectedDayEvent)
    {
      yield TableCalenderState(event.daySelected);
    }
  }
}