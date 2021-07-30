// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarController on _AppBarControllerBase, Store {
  final _$appBarStateAtom = Atom(name: '_AppBarControllerBase.appBarState');

  @override
  AppBarState get appBarState {
    _$appBarStateAtom.reportRead();
    return super.appBarState;
  }

  @override
  set appBarState(AppBarState value) {
    _$appBarStateAtom.reportWrite(value, super.appBarState, () {
      super.appBarState = value;
    });
  }

  final _$getDashboardAsyncAction =
      AsyncAction('_AppBarControllerBase.getDashboard');

  @override
  Future getDashboard() {
    return _$getDashboardAsyncAction.run(() => super.getDashboard());
  }

  @override
  String toString() {
    return '''
appBarState: ${appBarState}
    ''';
  }
}
