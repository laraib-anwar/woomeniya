import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/custom_raised_button.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/User.dart' as User;
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/utils/check_credentials_service.dart';
import 'package:shop_app/utils/firebase_auth_service.dart';
import 'package:shop_app/utils/flushbar_helper.dart';
import 'package:shop_app/utils/login_service.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  bool remember = false;
  final List<String> errors = [];
  bool inProgress = false;
  LoginService _loginService = LoginService();
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  TextEditingController _codeController = TextEditingController();
  String _countryCode = "+91";
  String phoneNumber;
  String phoneInput;
  String smsCode;
  bool _otpInProgress = false;
  FocusNode phoneFocusNode;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildPhoneFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            CustomRaisedButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 90,
              inProgress: inProgress,
              onPressed: !inProgress
                  ? () async {
                      await onLoginPressed(context, appProvider);
                    }
                  : () {},
              label: 'Continue',
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneInput = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        // else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        return null;
      },
      validator: (value) {
        if (!RegExp(r'^\+[0-9]{12,}$').hasMatch('$_countryCode$value')) {
          addError(error: kInvalidPhoneNumberError);
          return "";
        }
        // else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Container(
          height: 20,
          padding: EdgeInsets.only(right: 2.0),
          child: CountryCodePicker(
            onChanged: onCountryChanged,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'IN',
            favorite: ['+91', 'IN'],
            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
        ),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  Future<void> onLoginPressed(
      BuildContext context, AppProvider appProvider) async {
    setState(() {
      inProgress = true;
    });
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final bool credentialPresent = await CheckCredentialsService()
          .checkEmailAndPhone(email: '', phone: '$_countryCode${phoneInput}');
      if (credentialPresent == null) {
        setState(() {
          inProgress = false;
        });
        FlushHelper.flushbarAlert(
            context: context,
            title: 'Error',
            message:
                'Some problem occured during login. Please try again after sometime.',
            seconds: 3);
      } else {
        if (credentialPresent) {
          phoneNumber = '$_countryCode${phoneInput}';
          if (RegExp(r'^\+[0-9]{12,}$').hasMatch(phoneNumber)) {
            setState(() {
              inProgress = false;
            });
            showOtpLoadingAnimation('Auto retrieving OTP');
            await _firebaseAuthService.signInWithPhone(
                phoneNumber: phoneNumber,
                onCodeSent: onCodeSent,
                onPhoneVerified: onPhoneVerified);
          } else {
            setState(() {
              inProgress = false;
            });
            FlushHelper.flushbarAlert(
                context: context,
                title: 'Error',
                message: 'Enter a valid phone number',
                seconds: 3);
          }
        } else {
          setState(() {
            inProgress = false;
          });
          FlushHelper.flushbarAlert(
              context: context,
              title: 'Error',
              message:
                  'No user found with the given credentials. Check your login credentials and try again.',
              seconds: 3);
        }
      }
    }
  }

  void onCodeSent(String verificationId, [int forceResendingToken]) {
    Navigator.of(context).pop();
    setState(() {
      inProgress = false;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 30.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            'Enter OTP received on ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColorDark),
                          ),
                          Text(
                            '${phoneNumber}:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          ButtonTheme(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                            minWidth: 0,
                            height: 0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              child: Text(
                                'edit',
                                style: TextStyle(
                                    color: Color(0xff3366ff), fontSize: 16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                phoneFocusNode.requestFocus();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 8.0, right: 8.0),
                      child: PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        autoDisposeControllers: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        controller: _codeController,
                        onCompleted: (v) async {
                          await onOtpEntered(verificationId: verificationId);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 14),
                        ),
                        ButtonTheme(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                          minWidth: 0,
                          height: 0,
                          child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              'RESEND',
                              style: TextStyle(
                                  color: Color(0xff3366ff), fontSize: 14),
                            ),
                            onPressed: () async {
                              await _firebaseAuthService.signInWithPhone(
                                  phoneNumber: phoneNumber,
                                  onCodeSent: onCodeSent,
                                  onPhoneVerified: onPhoneVerified,
                                  forceResendingToken: forceResendingToken);
                              Navigator.of(context).pop();
                              showOtpLoadingAnimation('Resending OTP');
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRaisedButton(
                            height: 40,
                            minWidth: 100,
                            inProgress: _otpInProgress,
                            label: 'Confirm',
                            backgroundColor: Colors.orange,
                            onPressed: () async {
                              await onOtpEntered(
                                  verificationId: verificationId);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    _codeController.text = '';
                    setState(() {
                      _otpInProgress = false;
                    });
                  },
                  child: Icon(
                    Icons.clear,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> onOtpEntered({@required String verificationId}) async {
    EasyLoading.show(status: 'Verifying OTP');
    AuthCredential credential;
    String firebaseId;
    FirebaseAuth auth = FirebaseAuth.instance;
    smsCode = _codeController.text.trim();
    credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      final result = await auth.signInWithCredential(credential);
      firebaseId = result.user.uid;
      if (firebaseId != null) {
        await onPhoneVerified(firebaseId);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _otpInProgress = false;
      });
      EasyLoading.dismiss();
      FlushHelper.flushbarAlert(
          context: context,
          title: 'Error',
          message:
              'Oops, it looks like that either OTP is incorrect or it has expired!',
          seconds: 3);
    }
  }

  Future<void> onPhoneVerified(String firebaseId) async {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (firebaseId != null) {
      final Map<String, dynamic> result =
          await _loginService.loginWithFirebase(firebaseId: firebaseId);
      setState(() {
        inProgress = false;
      });
      final User.User currentUser = result['user'];
      if (currentUser != null) {
        appProvider.currentUser = currentUser;
        //  appProvider.bottomNavbarIndex = 0;
        EasyLoading.dismiss();
        //  if (widget.from == '' || widget.from == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/home', (Route route) => route.settings.name == '/login',
            arguments: {"message": "Login Successful"});
        //    } else {
        //    if (widget.from == '/basket') {
        //    if (currentUser.addresses.length == 0) {
        //      Navigator.of(context).pushNamedAndRemoveUntil('/newaddress',
        //          (Route route) => route.settings.name == '/login');
        //    } else {
        //      Navigator.of(context).pushNamedAndRemoveUntil('/addresslist',
        //          (Route route) => route.settings.name == '/login');
        //    }
        //    } else {
        //      Navigator.of(context).pushNamedAndRemoveUntil(
        //          widget.from, (Route route) => route.settings.name == '/login',
        //          arguments: {"message": "Login Successful"});
        //    }
        // }
      } else {
        EasyLoading.dismiss();
        FlushHelper.flushbarAlert(
            context: context,
            title: 'Error',
            message: result['message'],
            seconds: 3);
      }
    }
  }

  void onCountryChanged(CountryCode countryCode) {
    setState(() {
      _countryCode = countryCode.toString();
    });
  }

  void showAlert() {
    //  if (widget.message != null && widget.message != "") {
    //    FlushHelper.flushbarAlert(
    //        context: context, title: 'Info', message: widget.message, seconds: 3);
    //  }
  }

  void onForgotPasswordPressed() {
    //  showDialog(
    //      barrierDismissible: false,
    //      context: context,
    //      builder: (BuildContext context) {
    //        return PasswordResetModal();
    //      });
  }

  void showOtpLoadingAnimation(String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.10,
                    vertical: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.width * 0.70,
                      child: FlareActor(
                        "assets/rive/otp.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: "otp",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
