import 'package:bloc/bloc.dart';

///
/// Helper-class to display any state-change with the bloc-pattern
/// currently not used, since we use bloc-pattern instead of cubit-pattern
///
class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}