abstract class TableCalenderEvent {}

///
/// Basic event for the given calender-bloc
/// Represents the change of the current day that is selected
///
class SetSelectedDayEvent extends TableCalenderEvent {
  DateTime daySelected;

  SetSelectedDayEvent(this.daySelected);
}
