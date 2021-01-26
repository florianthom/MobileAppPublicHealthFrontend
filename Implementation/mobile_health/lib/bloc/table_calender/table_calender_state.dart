///
/// Represents the state of the connected calender-bloc
///
class TableCalenderState {
  DateTime daySelected;
  TableCalenderState(this.daySelected);

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is TableCalenderState && other.daySelected == daySelected;
  }

  @override
  int get hashCode => daySelected.hashCode;
}