import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'TextFieldWidget.dart';
import 'VerifyCodeScreen.dart';

class SignInScreen extends StatefulWidget {
  //const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String countryCode = "+971";
  String countryCodeSyria = "+963";
  String verificationFailedMessage = "";
  TextEditingController _phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String newphone = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
              ),

              ///TODO
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
                hintText: 'Phone number without 0',
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
                      print("1");
                      newphone = countryCodeSyria + _phoneController.text;
                      print("done casting");
                      print(newphone);
                      //print(phoneNumber);
                      // showDialog(
                      //     context: context,
                      //     builder: (context){
                      //       return Center(child: CircularProgressIndicator());
                      //     }
                      // );
                      await _auth.verifyPhoneNumber(
                        phoneNumber: newphone,
                        /*$phoneNumber*/
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {},
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
                                        verficationId: verificationId,
                                        userPhone: newphone,
                                      )));
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

              SizedBox(
                height: 100,
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
