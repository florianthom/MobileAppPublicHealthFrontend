import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_state.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';


class TableCalenderBloc extends Bloc<TableCalenderEvent, TableCalenderState> {
  TableCalenderBloc() : super(TableCalenderState(DateTime.now()));

  @override
  Stream<TableCalenderState> mapEventToState(TableCalenderEvent event) async* {
    if(event is SetSelectedDayEvent)
    {
      yield TableCalenderState(event.daySelected);
    }
  }
}