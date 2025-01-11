```dart
import 'dart:io';
import 'package:http/http.dart' as http;

class CustomException implements Exception {
  final String message;
  final int? statusCode;

  CustomException(this.message, {this.statusCode});

  @override
  String toString() => 'CustomException: $message, StatusCode: $statusCode';
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data here
    } else if (response.statusCode == 404) {
      throw CustomException('Data not found', statusCode: response.statusCode);
    } else if (response.statusCode == 500) {
      throw CustomException('Server error', statusCode: response.statusCode);
    } else {
      throw CustomException('Unexpected error', statusCode: response.statusCode);
    }
  } on SocketException {
    throw CustomException('No Internet connection');
  } on CustomException catch (e) {
    print('Caught CustomException: $e');
    // Handle CustomException specifically 
    rethrow; // Or handle it as per your application needs
  } on Exception catch (e) {
    print('Caught Exception: $e');
    rethrow; // Re-throw to handle in a higher level if needed
  } catch (e) {
    print('Unexpected error: $e');
    rethrow; // rethrow to upper level
  }
}
```