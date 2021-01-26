abstract class NavbarEvent {}

///
/// Basic event for the given bloc
/// Represents the press on an icon of the bottomNavigationBar
///
class SetNewNavBarRoute extends NavbarEvent {
  final int newNavBarRoute;

  SetNewNavBarRoute(this.newNavBarRoute);
}
