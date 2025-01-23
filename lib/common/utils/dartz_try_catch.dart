import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DartzTryCatch {
  static Future<Either<String, T>> network<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final T data = await operation();
      return Right(data);
    } on DioException catch (e) {
      return Left(e.message ?? '');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
