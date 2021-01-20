abstract class TableCalenderEvent {}

///*
class SetSelectedDayEvent extends TableCalenderEvent {
  DateTime daySelected;

  SetSelectedDayEvent(this.daySelected);
}
