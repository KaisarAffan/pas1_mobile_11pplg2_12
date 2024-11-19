class LoginResponseModel {
  final bool status;
  final String message;
  final String? token;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
      );
}
