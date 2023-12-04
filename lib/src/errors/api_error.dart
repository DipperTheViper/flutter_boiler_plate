
import '../adaptors/remote/api_response.dart';
import 'base_error.dart';

class APIError extends BaseError {
  APIError(this.apiResponse);

  APIResponse apiResponse;
}
