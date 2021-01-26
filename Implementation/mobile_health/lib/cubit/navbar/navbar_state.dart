///
/// Represents the state of the connected navbar-cubit
/// currently not used, since we use the bloc-pattern instead of the cubit-pattern
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