import 'package:bloc/bloc.dart';

///
/// Helper-class to display any state-change with the bloc-pattern
///
class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}