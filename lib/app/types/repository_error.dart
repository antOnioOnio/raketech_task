import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_error.freezed.dart';

@freezed
class RepositoryError with _$RepositoryError {
  const factory RepositoryError.badRequestListErrors(List<String> listErrors) =
      badRequestListErrors;

  const factory RepositoryError.securityError() = SecurityError;

  const factory RepositoryError.badRequest() = badRequest;

  const factory RepositoryError.noAccess() = NoAccess;

  const factory RepositoryError.notFoundResource() = NotFoundResource;

  const factory RepositoryError.serverError() = ServerError;

  const factory RepositoryError.noInternetConnection() = NoInternetConnection;

  const factory RepositoryError.authExpired() = AuthExpired;

  const factory RepositoryError.infoNotMatching() = InfoNotMatching;

  const factory RepositoryError.listErrors(List<String> errorList) =
      ListErrorsM;

}
