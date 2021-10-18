// Mocks generated by Mockito 5.0.16 from annotations
// in done_it/test/feature/todo/presentation/blocs/todo/todo_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:done_it/core/error/failures.dart' as _i6;
import 'package:done_it/core/usecases/usecase.dart' as _i8;
import 'package:done_it/domain/entities/todo/todo.dart' as _i7;
import 'package:done_it/domain/repositories/todo/todo_repository.dart' as _i2;
import 'package:done_it/domain/usecases/todo/get_all_todo.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTodoRepository_0 extends _i1.Fake implements _i2.TodoRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetAllTodo].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllTodo extends _i1.Mock implements _i4.GetAllTodo {
  MockGetAllTodo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TodoRepository get todoRepository =>
      (super.noSuchMethod(Invocation.getter(#todoRepository),
          returnValue: _FakeTodoRepository_0()) as _i2.TodoRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Todo>>> call(
          _i8.NoParams? noParams) =>
      (super.noSuchMethod(Invocation.method(#call, [noParams]),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Todo>>>.value(
              _FakeEither_1<_i6.Failure, List<_i7.Todo>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Todo>>>);
  @override
  String toString() => super.toString();
}
