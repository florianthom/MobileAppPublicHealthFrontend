abstract class TableCalenderEvent {}

///
/// Basic event for the given calender-bloc
/// Represents the change of the current day that is selected
///
/// in redux: action
///
class SetSelectedDayEvent extends TableCalenderEvent {
  DateTime daySelected;

  SetSelectedDayEvent(this.daySelected);
}