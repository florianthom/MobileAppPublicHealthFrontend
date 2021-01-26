///
/// Represents the state of the connected calender-bloc
///
class TableCalenderState {
  DateTime daySelected;
  TableCalenderState(this.daySelected);

  ///
  /// Overrride since bloc-pattern needs it to diffirentiate different states
  ///   -> needed since everytime the state changes, we create a whole new state
  ///   but bloc does not reassign we new state when the state is the same object
  ///
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is TableCalenderState && other.daySelected == daySelected;
  }

  @override
  int get hashCode => daySelected.hashCode;
}




