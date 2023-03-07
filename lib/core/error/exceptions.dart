enum TypeError {
  local,
  remote,
}

class DefaultException implements Exception {
  final String message;
  final TypeError error;

  DefaultException({
    this.error = TypeError.remote,
    required this.message,
  });

  DefaultException copyWith({
    String? message,
    TypeError? error,
  }) =>
      DefaultException(
        error: error ?? this.error,
        message: message ?? this.message,
      );
}
