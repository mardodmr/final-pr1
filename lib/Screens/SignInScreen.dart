// import 'package:center/Screens/VerifyCodeScreen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:center/Screens/VerifyCodeScreen.dart';
import 'CreateProfileScreen.dart';
import 'TextFieldWidget.dart';
import 'VerifyCodeScreen.dart';

class SignInScreen extends StatefulWidget {
  //const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String countryCode = "+1";
  String verificationFailedMessage = "";
  final TextEditingController _phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 60),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField_SignUp(
                prefix: SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(
                      //     Icons.phone,
                      //     color: Color(0xff9676FF),
                      //   ),
                      // ),
                      CountryCodePicker(
                        initialSelection: 'SY',
                        onChanged: (value) {
                          countryCode = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                hideInput: false,
                keyboardType: TextInputType.phone,
                con: _phoneController,
                hintText: 'Phone number',
                //LocaleKeys.B03signUpScreen_number.tr(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 48.0,
                  width: 235.0,
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  color: Colors.white,
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 48.0,
                    minWidth: 35.0,
                    color: Color(0xEFEFEFFF),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    onPressed: () async {
                      phoneNumber="+971"+  _phoneController.text;
                      // showDialog(
                      //     context: context,
                      //     builder: (context){
                      //       return Center(child: CircularProgressIndicator());
                      //     }
                      // );
                      await _auth.verifyPhoneNumber(
                        phoneNumber: phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) async{},
                        verificationFailed: (FirebaseAuthException e) {
                          setState(() {
                            verificationFailedMessage = e.code;
                          });
                        },

                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(
                                  verficationId: verificationId)));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      //Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              // Text(
              //   "Sign in with",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               border:
              //                   Border.all(color: Color(0xEFEFEFFF), width: 2)),
              //           height: 55,
              //           width: 55,
              //           child: SvgPicture.asset(
              //             'assets/images/google.svg',
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             border: Border.all(color: Color(0xEFEFEFFF), width: 2),
              //           ),
              //           height: 55,
              //           width: 55,
              //           child: SvgPicture.asset(
              //             'assets/images/face.svg',
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             border: Border.all(color: Color(0xEFEFEFFF), width: 2),
              //           ),
              //           height: 55,
              //           width: 55,
              //           child: SvgPicture.asset(
              //             'assets/images/apple.svg',
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 100,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 70),
              //   child: Container(
              //     width: 139,
              //     height: 48,
              //     child: RawMaterialButton(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       fillColor: Color(0xFCFCFCFF),
              //       onPressed: () {},
              //       child: Text("Continue as a Guest"),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Create a New Account?  ",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.grey),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => SignUpScreen(),
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "Sign Up",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
