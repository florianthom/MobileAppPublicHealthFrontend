///
/// Represents the state of the navbar-bloc
///
class NavbarState {
  int navItemSelected = 0;
  NavbarState(this.navItemSelected);

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is NavbarState && other.navItemSelected == navItemSelected;
  }

  @override
  int get hashCode => navItemSelected.hashCode;
}