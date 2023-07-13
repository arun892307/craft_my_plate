import 'package:craft_my_plate/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding_4 extends StatefulWidget {
  const Onboarding_4({Key? key}) : super(key: key);

  @override
  State<Onboarding_4> createState() => _Onboarding_4State();
}

class _Onboarding_4State extends State<Onboarding_4> {
  final TextEditingController _full_name=TextEditingController();
  final TextEditingController _email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255,255,255, 1),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35,right:350,left: 10),
              child: IconButton(onPressed: (){},
                  icon: const Icon(Icons.arrow_back_ios,color: Colors.black87,size: 35,weight: 4,)
              ),
            ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 10,right: 165),
                child: Text("Just a step away!",
          style: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w400)),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,right: 10),
              child: TextFormField(
                style: GoogleFonts.lexend(
                    color: const Color.fromRGBO(170, 170, 170,1),
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),
                autocorrect: false,
                keyboardType: TextInputType.name,
                controller: _full_name,
                // autovalidateMode: AutovalidateMode.always,
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
                    label: const Text("Enter Name"),
                    labelStyle: GoogleFonts.lexend(
                      color: const Color.fromRGBO(170,170, 170,1),fontSize: 16,),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: const Color.fromRGBO(255,255,255, 1),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,right: 10),
              child: TextFormField(
                style: GoogleFonts.lexend(
                    color: const Color.fromRGBO(170, 170, 170,1),
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                // autovalidateMode: AutovalidateMode.always,
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
                  label: const Text("Enter Email*"),
                  labelStyle: GoogleFonts.lexend(
                    color: const Color.fromRGBO(170,170, 170,1),fontSize: 16,),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: const Color.fromRGBO(255,255,255, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.38,
                  left: 15,right: 10),
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
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => home_screen(),));
                  },

                  child: Text("Let's Start",style: GoogleFonts.lexend(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  )),
                ),),
            ),

          ],
        ),
      ),
    );
  }
}
