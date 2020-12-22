
abstract class GeneralState {
  int navItemSelected = 0;
  GeneralState();
}

class GeneralInitial extends GeneralState {
  GeneralInitial();
}

class GeneralSetCurrentNavState extends GeneralState{
  GeneralSetCurrentNavState(var navItemSelected){
    this.navItemSelected = navItemSelected;
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is GeneralSetCurrentNavState && other.navItemSelected == navItemSelected;
  }

  @override
  int get hashCode => navItemSelected.hashCode;
}