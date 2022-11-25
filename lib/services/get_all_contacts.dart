
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_relu/model/all_contact_model.dart';
import 'package:task_relu/services/api_url.dart';

class GetAllContactsApi {
 Future<AllContacts> getAllContact()async{
 
   const url = ApiUrls.baseUrl+ApiUrls.getTeamAndInvit;
     try{
      log('api called');
        final response = await http.get(Uri.parse(url),headers: {
          'authtoken':ApiUrls.token
        });
        log(response.statusCode.toString());
        if(response.statusCode == 200){
          log('got it maan');
          log(response.body);
         return allContactsFromJson(response.body);
        }
        else{
          throw 'something went wrong !';
        }
     }
     catch(e){
         throw  'Something went wrong !';
     }

  }
}