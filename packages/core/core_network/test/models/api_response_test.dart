import 'package:core_network/core_network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiResponse', () {
    test('isSuccess returns true for 200', () {
      const response = ApiResponse<String>(
        data: 'ok',
        statusCode: 200,
      );
      expect(response.isSuccess, isTrue);
    });

    test('isSuccess returns true for 201', () {
      const response = ApiResponse<String>(
        data: 'created',
        statusCode: 201,
      );
      expect(response.isSuccess, isTrue);
    });

    test('isSuccess returns false for 400', () {
      const response = ApiResponse<String>(
        data: 'bad',
        statusCode: 400,
      );
      expect(response.isSuccess, isFalse);
    });

    test('isSuccess returns false for 500', () {
      const response = ApiResponse<String>(
        data: 'error',
        statusCode: 500,
      );
      expect(response.isSuccess, isFalse);
    });

    test('headers default to empty map', () {
      const response = ApiResponse<String>(
        data: 'ok',
        statusCode: 200,
      );
      expect(response.headers, isEmpty);
    });

    test('stores headers', () {
      const response = ApiResponse<String>(
        data: 'ok',
        statusCode: 200,
        headers: {'content-type': 'application/json'},
      );
      expect(response.headers['content-type'], 'application/json');
    });
  });
}
