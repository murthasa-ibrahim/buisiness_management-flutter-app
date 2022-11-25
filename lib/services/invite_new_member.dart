
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_relu/model/response_model.dart';
import 'package:task_relu/services/api_url.dart';

class InviteNewMemberApi {
 Future<ApiResponseModel> iviteNewMember(String mail, int role)async{
 
   const url = ApiUrls.baseUrl+ApiUrls.inviteMember;
     try{
      log('api called');
        final response = await http.post(Uri.parse(url),headers: {
          'authtoken':ApiUrls.token
        },
        body: {
          "email":mail,
          "role":role.toString()
        }
        );
        log(response.statusCode.toString());
        if(response.statusCode >=200 && response.statusCode <=299){
          
          log(response.body);
          return apiResponseModelFromJson(response.body);
          
        }
        else{
          
          return ApiResponseModel( message: 'Something went wrong !');
        }
     }
     catch(e){
       log(e.toString());
        
         return  ApiResponseModel( message: 'Something went wrong !');
     }

  }
}