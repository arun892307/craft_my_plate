import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

import 'Onboarding_15.dart';
import 'Onboarding_4.dart';


class onboarding_11 extends StatefulWidget {
  const onboarding_11({Key? key}) : super(key: key);

  @override
  State<onboarding_11> createState() => _onboarding_11State();
}

class _onboarding_11State extends State<onboarding_11> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code="";
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),

      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );



    return Scaffold(
        backgroundColor: const Color.fromRGBO(255,255,255, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: TextFormField(
              style: GoogleFonts.lexend(
                  color: const Color.fromRGBO(170, 170, 170,1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              ),
              decoration: InputDecoration(
                enabled: false,
                prefixIcon: const Icon(Icons.arrow_back_ios_new,color: Color.fromRGBO(1, 1, 1, 1),weight: 5,),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2
                    )),
                label:  Padding(
                  padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width/6,
                  vertical: MediaQuery.of(context).size.height/4
              ),
                  child: const Text("OTP Verification"),
                ),
                labelStyle: GoogleFonts.lexend(
                  fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(1,1,1,1)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: const Color.fromRGBO(255,255,255, 1),
              ),

            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("We have sent a verification code to\n",
                style: GoogleFonts.lexend(
                    color: const Color. fromRGBO(120, 120, 120, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+91-${Onboarding_15.phone.replaceRange(0, 6,"xxxxxx")}",
                      style: GoogleFonts.lexend(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(1,1,1,1)
                      )),
                  Image.asset("assets/images/check.png",height: 25,)
                ],
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Pinput(
            length: 6,
             defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
             submittedPinTheme: submittedPinTheme,
           showCursor: true,
            onChanged: (value){

               setState(() {
                 code=value;
                 print("Inside setstate code is: $code and value $value");
               });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.06,

              decoration:   BoxDecoration(
                color: const Color.fromRGBO(99, 24, 175,1),
                borderRadius: BorderRadius.circular(8),
              ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(99, 24, 175,1)
                ),
                onPressed: () async {
                // Create a PhoneAuthCredential with the code
                  try {
                    print("OTP is:$code");
                    PhoneAuthCredential credential = PhoneAuthProvider
                        .credential(
                        verificationId: Onboarding_15.verify, smsCode: code);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential).then((value) {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const Onboarding_4(),
                            type: PageTransitionType.rightToLeftJoined,
                            duration: const Duration(milliseconds: 650),
                            childCurrent: const Onboarding_4(),
                          )

                      );
                      print("object\n");
                    }).onError((error, stackTrace) {
                      print("On Error :${error.toString()}");
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text("Error:"),
                          content: Text(error.toString()),
                          backgroundColor: Colors.white70,
                        );
                      });
                    });
                  }catch(e)
                  {
                          print("catch Error is: ${e.toString()}");

                }},

                child: Text("Submit",style: GoogleFonts.lexend(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                )),
              ),),
          ),
          signInOption()

        ],
      ),

    );
  }
  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Din't receive code?",
          style: GoogleFonts.lexend(
            color: const Color. fromRGBO(120, 120, 120, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400
          ,)),
        TextButton(

          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                  child: const Onboarding_15(),
                  type: PageTransitionType.leftToRightJoined,
                  duration: const Duration(milliseconds: 650),
                  childCurrent: const Onboarding_15(),
                )

            );

          },
          child: Text("Resend",
            style: GoogleFonts.lexend(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),

          ),
        )
      ],
    );

  }
}
