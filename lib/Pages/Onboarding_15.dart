import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Onboarding_11.dart';

class Onboarding_15 extends StatefulWidget {
  const Onboarding_15({Key? key}) : super(key: key);
  static String verify="";
  static String phone="";

  @override
  State<Onboarding_15> createState() => _Onboarding_15State();
}

class _Onboarding_15State extends State<Onboarding_15> {
  final TextEditingController _phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255,255,255, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Container(
                    height: MediaQuery.of(context).size.width*0.8,
                     width: MediaQuery.of(context).size.width*1,
                     decoration: const BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/images/bg_11.png"),
                         fit: BoxFit.cover
                       )
                     ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 20
                  ,left: 15),
              child: Text("Login or Signup",
                style:GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color. fromRGBO(120, 120, 120, 1)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
              child: TextFormField(
                style: GoogleFonts.lexend(
                  color: const Color.fromRGBO(1, 1, 1,1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
                autocorrect: false,
                keyboardType: TextInputType.phone,
                controller: _phone,
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 2
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 2
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 2
                      )),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("+91",
                 textAlign: TextAlign.center,
                 style: GoogleFonts.lexend(
                 color: Colors.black87,
                 fontWeight: FontWeight.w600,
                     fontSize: 16
                         ),

                       ),
                  ),
                  label: const Text("Enter Phone Number"),
                  labelStyle: GoogleFonts.lexend(
                      color: Color.fromRGBO(170,170, 170,1),fontSize: 16,),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: const Color.fromRGBO(255,255,255, 1),
                ),
                validator: (value) {
                  if (_phone.text.length==10) {
                    return null;
                  } else {
                    return 'Please enter a valid Phone Number';
                  }
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.07,

                decoration:   BoxDecoration(
                  color: const Color.fromRGBO(99, 24, 175,1),
                  borderRadius: BorderRadius.circular(8),
                 ),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   primary: const Color.fromRGBO(99, 24, 175,1)
                  ),
                  onPressed: () async{
                    setState(() {
                      Onboarding_15.phone=_phone.text;
                    });

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+91${_phone.text.toString()}',
                      verificationCompleted: (PhoneAuthCredential credential) {

                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print("Error is:${e.toString()}");
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: const Text("Error"),
                            content: Text(e.toString().replaceRange(0, 38,""),
                                style: GoogleFonts.lexend(
                                    color: const Color.fromRGBO(1, 1, 1,1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                )),
                            backgroundColor: Colors.white70,
                          );
                        });
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Onboarding_15.verify=verificationId;
                        print("Code Has Been Send");
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              child: const onboarding_11(),
                              type: PageTransitionType.rightToLeftJoined,
                              duration: const Duration(milliseconds: 650),
                              childCurrent: const onboarding_11(),
                            )

                        );

                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },

                  child: Text("Continue",style: GoogleFonts.lexend(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  )),
                ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.28,
            ),
            Center(
              child: Text("By continuing, you agree to our\nTerms of Service  PrivacyPolicy", style:GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color. fromRGBO(120, 120, 120, 1)
              ),),
            )

          ],
        ),
      ),
    );
  }
}
