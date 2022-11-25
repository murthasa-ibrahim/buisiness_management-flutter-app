
import 'dart:convert';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));


class ApiResponseModel {
    ApiResponseModel({
         this.errorFlag,
         this.message,
    });

    final String? errorFlag;
    final String? message;

    factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        errorFlag: json["error_flag"],
        message: json["message"],
    );

}
