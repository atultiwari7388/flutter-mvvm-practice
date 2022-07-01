import 'package:mvvm_practice_app/data/response/app_status.response.data.dart';

class ApiResponse<T> {
  AppStatus? appStatus;
  T? data;
  String? message;

  ApiResponse(this.appStatus, this.data, this.message);
  ApiResponse.loading() : appStatus = AppStatus.loading;
  ApiResponse.error() : appStatus = AppStatus.error;
  ApiResponse.success() : appStatus = AppStatus.success;

  @override
  String toString() {
    return 'ApiResponse{appStatus: $appStatus, data: $data, message: $message}';
  }
}
