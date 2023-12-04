class APIResponse<T> {
  T? _data;
  late ResponseStatus _status;
  late String _massage;

  APIResponse() {
    _data = null;
    _status = ResponseStatus.loading;
  }

  void setDataSuccess({
    required T data,
    String massage = '',
  }) {
    _data = data;
    _status = ResponseStatus.success;
    _massage = massage;
  }

  void setDataError({
    required String errorMassage,
    ResponseStatus status = ResponseStatus.error,
    T? data,
  }) {
    _data = data;
    _status = status;
    _massage = errorMassage;
  }

  String getMassage() {
    return _massage;
  }

  T? getData() {
    return _data;
  }

  bool isSuccess() {
    return _status == ResponseStatus.success;
  }

  bool isUnAuthenticated() {
    return _status == ResponseStatus.unAuthenticated;
  }

  bool isNotFound() {
    return _status == ResponseStatus.notFound;
  }

  bool isServerError() {
    return _status == ResponseStatus.serverError;
  }

  bool isError() {
    return _status == ResponseStatus.error;
  }

  ResponseStatus getStatus() {
    return _status;
  }

  // ApiHandler<T> copyTo() {
  //   ApiHandler<T> res = ApiHandler();
  //   res.data = data;
  //   res.status = status;
  //   res.massage = massage;
  //   return res;
  // }

  @override
  String toString() {
    return 'APIHandler{data: $_data, status: $_status, massage: $_massage}';
  }
}

enum ResponseStatus {
  loading,
  success,
  unAuthenticated,
  serverError,
  notFound, //50-50
  error,
}
