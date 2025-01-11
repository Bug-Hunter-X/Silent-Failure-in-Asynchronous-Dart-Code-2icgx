# Silent Failure in Asynchronous Dart Code

This example demonstrates a common issue in asynchronous Dart code: insufficient error handling. The `fetchData` function uses a `try-catch` block, but it only prints a generic error message.  This makes debugging challenging because the root cause of the failure is not clearly communicated.

## Problem

The primary issue lies in the overly general `catch (e)` block. It masks the underlying exception, making it difficult to pinpoint the precise cause of the failure.  Better error handling is crucial for robust applications.

## Solution

The solution improves error handling by:

1. Providing more specific error handling within the `try` block (handling different HTTP status codes).
2.  Using more informative error messages that include relevant details (like the HTTP status code).
3. Throwing custom exceptions to provide context and structure error reporting.
