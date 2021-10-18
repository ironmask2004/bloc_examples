// Mocks generated by Mockito 5.0.16 from annotations
// in done_it/test/feature/todo/domain/usecases/add_todo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:done_it/core/error/failures.dart' as _i5;
import 'package:done_it/domain/entities/todo/todo.dart' as _i6;
import 'package:done_it/domain/repositories/todo/todo_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i3.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Todo>> getTodo(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTodo, [id]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Todo>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Todo>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Todo>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Todo>>> getAllTodo() =>
      (super.noSuchMethod(Invocation.method(#getAllTodo, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Todo>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Todo>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Todo>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Todo>> addTodo(String? task) =>
      (super.noSuchMethod(Invocation.method(#addTodo, [task]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Todo>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Todo>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Todo>>);
  @override
  String toString() => super.toString();
}
