import 'package:fitness/custom/CustomWidget.dart';
import 'package:fitness/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../colors.dart';
import '../custom/CustomButton.dart';
import '../custom/CustomText.dart';
import '../custom/Fonts.dart';
import '../utils/Demo_Localization.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  String? newPin;

  String newPass = "Enter  Password";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration:Duration(seconds: 1) ,
        content: Text(message,style: TextStyle(color: MyColorName.colorfillBOx),),
        backgroundColor: MyColorName.colorTextThird,
      ),
    );
  }

  void _validateAndSubmit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => ProfileScreen()));

    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => RegistrationScreen()));

    /*if (_controllerEmail.text.isEmpty) {
      _showSnackbar('Please Enter your Email...');
      return null;
    }
   else {
      _showSnackbar('Please correct the errors in the form.');
    }*/

  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
               CustomTextWidget(title:DemoLocalization.of(context)!.translate('Skip').toString(),fontFamily: Fonts.montserrat,icon: Icons.arrow_back_ios,imageAsset: ""),

                const SizedBox(height: 20),
                CustomText(
                  text: DemoLocalization.of(context)!.translate('VerifyAccount').toString(),//"Verify Account",
                  fontSize: 8.0,
                  color: MyColorName.colorTextFour,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.roboto,
                ),

                const SizedBox(height: 10),
                CustomText(
                  text: DemoLocalization.of(context)!.translate('Verifyyouraccountbyenteringverificationcodewesenttodummy@gmail.com').toString(),//"Verify your account by entering verification \ncode we sent to dummy@gmail.com",
                  fontSize: 4,
                  color: MyColorName.colorTextPrimary,
                  fontWeight: FontWeight.normal,
                  fontFamily: Fonts.dmsans,
                ),

                SizedBox(height: screenSize.height/9),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24),
                  child: PinCodeTextField(
                    hintCharacter: "*",
                    cursorColor: Colors.grey,
                    // hintStyle: CupertinoTextField.cupertinoMisspelledTextStyle,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      // widget.otp = int.parse(value);
                      newPin = value.toString();
                    },
                    textStyle: const TextStyle(color:MyColorName.colorTextThird),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      activeColor: MyColorName.colorTextThird,
                      inactiveColor:MyColorName.colorTextThird,
                      selectedColor: MyColorName.colorTextThird,
                      fieldHeight: 60,
                      fieldWidth: 60,
                      selectedFillColor: MyColorName.colorTextThird,
                      inactiveFillColor: MyColorName.colorTextThird,
                      activeFillColor: MyColorName.colorTextThird,
                    ),
                    //pinBoxRadius:20,
                    appContext: context,
                    length: 4,
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: CustomText(
                    text: DemoLocalization.of(context)!.translate('Resend').toString(),//"Resend",
                    fontSize: 3.5,
                       isUnderlined: true,
                    color: MyColorName.colorTextThird,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.montserrat,
                  ),
                ),
              //  const SizedBox(height: 18),
                 SizedBox(height: screenSize.height/8),
                Center(
                  child: CustomButton(
                    text: DemoLocalization.of(context)!.translate('VerifyOTP').toString(),//'Verify OTP',
                    fontFamily:Fonts.roboto,
                    fontSize: 22,
                    color: MyColorName.colorTextThird,
                    onPressed: _validateAndSubmit,
                  ),
                ),
              const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}