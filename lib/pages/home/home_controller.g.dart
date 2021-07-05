// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$homeStateAtom = Atom(name: '_HomeControllerBase.homeState');

  @override
  HomeState get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(HomeState value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  final _$getEventsAsyncAction = AsyncAction('_HomeControllerBase.getEvents');

  @override
  Future getEvents() {
    return _$getEventsAsyncAction.run(() => super.getEvents());
  }

  @override
  String toString() {
    return '''
homeState: ${homeState}
    ''';
  }
}
