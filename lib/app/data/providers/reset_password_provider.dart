import 'package:al_dana/app/data/data.dart';
import 'package:get/get.dart';

class ResetProvider extends GetConnect {
  Future<void> resetPassword(
    String password,
    String newPassword,
    String confirmPassword,
  ) async {
    final body = {
      "currentPassword": password,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword
    };
    final response = await post(
      apiResetPassword,
      body,
    );
    if(response.statusCode == 200){

    } else {
      
    }
  }
}
