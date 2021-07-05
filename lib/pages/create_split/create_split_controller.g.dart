// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_split_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateSplitController on _CreateSplitController, Store {
  final _$currentPageAtom = Atom(name: '_CreateSplitController.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_CreateSplitControllerActionController =
      ActionController(name: '_CreateSplitController');

  @override
  void nextPage() {
    final _$actionInfo = _$_CreateSplitControllerActionController.startAction(
        name: '_CreateSplitController.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_CreateSplitControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$_CreateSplitControllerActionController.startAction(
        name: '_CreateSplitController.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_CreateSplitControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
