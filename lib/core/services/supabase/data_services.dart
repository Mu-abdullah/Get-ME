import 'package:dartz/dartz.dart';

import '../../error/custom_errors.dart';

abstract class DataService {
  Future<Either<CustomError, List<T>>> getListOfData<T>(
    String table,
    T Function(Map<String, dynamic>) fromJson, {
    int? limit,
    String? searchKey,
    String? filterKey,
    dynamic value,
    String? orderBy,
    bool? ascending,
  });

  Future<Either<CustomError, T>> getData<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
    required String? filterKey,
    required dynamic value,
  });

  Future<Either<CustomError, T>> addData<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> data,
  });

  Future<bool> checkIfRowExists({
    required String table,
    required Map<String, dynamic> data,
  });

  Future<void> update({
    required String table,
    required int id,
    required Map<String, dynamic> data,
  });

  Future<void> delete({required String table, required int id});
}

abstract class SupabaseServices {
  Future<dynamic> getData({
    required String table,
    int? limit,
    String? searchKey,
    String? filterKey,
    dynamic value,
  });
  Future<dynamic> addData({
    required String table,
    required Map<String, dynamic> data,
  });

  Future<bool> checkIfRowExists({
    required String table,
    required Map<String, dynamic> data,
  });

  Future<void> update({
    required String table,
    required int id,
    required Map<String, dynamic> data,
  });

  Future<void> delete({
    required String table,
    required int id,
  });
}
