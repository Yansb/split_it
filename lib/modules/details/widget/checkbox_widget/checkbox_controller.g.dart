// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckboxController on _CheckboxControllerBase, Store {
  final _$statusAtom = Atom(name: '_CheckboxControllerBase.status');

  @override
  ClassCheckboxStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ClassCheckboxStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$updateAsyncAction = AsyncAction('_CheckboxControllerBase.update');

  @override
  Future<void> update(FriendModel friend) {
    return _$updateAsyncAction.run(() => super.update(friend));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
