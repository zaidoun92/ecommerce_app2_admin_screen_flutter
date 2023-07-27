// import '../../../../core/class/crud.dart';
// import '../../../../linkapi.dart';

// class VerifyCodeSignUpData {
//   Crud crud;

//   VerifyCodeSignUpData(this.crud);

//   postData(String email, String verifycode) async {
//     var response = await crud.postData(AppLink.verifycodeSignup, {
//       "email": email,
//       "verifycode": verifycode,
//     });
//     return response.fold((l) => l, (r) => r);
//   }

//   resendData(String email) async {
//     var response = await crud.postData(AppLink.resend, {
//       "email": email,
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }
