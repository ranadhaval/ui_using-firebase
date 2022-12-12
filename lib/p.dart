// import 'package:car_service_app/service/phone_service.dart';
// import 'package:car_service_app/utils/constant.dart';
// import 'package:car_service_app/view/start/otp_verify_screen.dart';
// import 'package:car_service_app/view/start/sign_up_screen.dart';
// import 'package:car_service_app/widget/custom_appbar.dart';
// import 'package:car_service_app/widget/custom_button.dart';
// import 'package:car_service_app/widget/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class LogInScreen extends StatefulWidget {
//   LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   final TextEditingController loginController = TextEditingController();

//   authclass at = authclass();
//   String verificationIdFinal = "";
//   void setData(String verificationId) {
//     setState(() {
//       verificationIdFinal = verificationId;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: CustomAppBar(title: 'Login')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: SizedBox(
//                 height: height(context) * 0.35,
//                 // width: 270,
//                 child: Image.asset(
//                   'assets/images/login.png',
//                   // fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             addVerticalSpace(20),
//             CustomTextField(
//                 controller: loginController, hinttext: 'Enter Mobile Number'),
//             addVerticalSpace(20),
//             CustomButton(
//                 name: 'Login',
//                 onPressed: () async {
//                   await at.verifyphone(
//                       "+91 ${loginController.text}", context, setData);
                 
//                 }),
//             addVerticalSpace(height(context) * 0.07),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   color: black.withOpacity(0.2),
//                   height: 1,
//                   width: width(context) * 0.33,
//                 ),
//                 Text(
//                   'or continue with',
//                   style: bodyText12Small(color: black.withOpacity(0.5)),
//                 ),
//                 Container(
//                   color: black.withOpacity(0.2),
//                   height: 1,
//                   width: width(context) * 0.33,
//                 ),
//               ],
//             ),
//             addVerticalSpace(25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: height(context) * 0.08,
//                   width: width(context) * 0.17,
//                   decoration: shadowDecoration(10, 2),
//                   child: Center(
//                     child: Image.asset('assets/images/fb.png'),
//                   ),
//                 ),
//                 Container(
//                   height: height(context) * 0.08,
//                   width: width(context) * 0.17,
//                   decoration: shadowDecoration(10, 2),
//                   child: Center(
//                     child: Image.asset('assets/images/google.png'),
//                   ),
//                 ),
//                 Container(
//                   height: height(context) * 0.08,
//                   width: width(context) * 0.17,
//                   decoration: shadowDecoration(10, 2),
//                   child: Center(
//                     child: Image.asset('assets/images/iphone.png'),
//                   ),
//                 ),
//               ],
//             ),
//             addVerticalSpace(height(context) * 0.08),
//             InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (ctx) => SignUpScreen()));
//               },
//               child: RichText(
//                   text: TextSpan(children: [
//                 TextSpan(
//                     text: 'Don’t have an account?',
//                     style: bodyText14normal(color: black)),
//                 TextSpan(
//                     text: '  Sign up', style: bodyText14w600(color: primary)),
//               ])),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

