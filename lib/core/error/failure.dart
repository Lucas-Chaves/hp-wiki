abstract class Failure {}

class ServerFailure implements Failure {
  ServerFailure({required this.errorMessage});

  final String errorMessage;
}
