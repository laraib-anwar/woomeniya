import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../utils/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/RegistrationModel.dart';
import '../../../utils/flushbar_helper.dart';
import '../../../utils/registration_service.dart';
import '../../../utils/check_credentials_service.dart';
import '../../../utils/easy_loading_helper.dart';
import '../../../models/User.dart' as User;
import '../../../utils/login_service.dart';
import '../../../providers/app_provider.dart';
import '../../../utils/firebase_messaging_service.dart';
import '../../../components/custom_raised_button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email;
  String password;
  bool remember = false;
  final FirebaseAuthService _authService = FirebaseAuthService();
  final LoginService _loginService = LoginService();
  final CheckCredentialsService _credentialsService = CheckCredentialsService();
  EasyLoadingHelper _easyLoadingHelper;
  static final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  String smsCode;
  String fullName;
  String repeatPassword;
  String phoneNumber;
  bool _otpVerified = false;
  String _countryCode = "+91";
  bool _registrationInProgress = false;
  bool _otpInProgress = false;
  FocusNode phoneFocusNode;

  Future<void> _warmupAnimations(AssetProvider assetProvider) async {
    await cachedActor(assetProvider);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _easyLoadingHelper =
          EasyLoadingHelper(backgroundColor: Theme.of(context).primaryColor);
    });
    phoneFocusNode = FocusNode();
    final AssetProvider assetProvider =
        AssetFlare(bundle: rootBundle, name: 'assets/rive/otp.flr');
    _warmupAnimations(assetProvider);
    super.initState();
  }

  @override
  void dispose() {
    _registerFormKey.currentState.reset();
    _codeController.dispose();
    super.dispose();
  }

  final List<String> errors = [];

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
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          CustomRaisedButton(
            height: 50,
            minWidth: MediaQuery.of(context).size.width * 90,
            inProgress: _registrationInProgress,
            onPressed: !_registrationInProgress ? onRegisterPressed : () {},
            label: 'Register',
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        setState(() {
          repeatPassword = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == repeatPassword) {
          removeError(error: kMatchPassError);
        }
        repeatPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        setState(() {
          password = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          fullName = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kFullNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User_Icon.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          phoneNumber = '$_countryCode$value';
        });
      },
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
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        // else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        if (!RegExp(r'^\+[0-9]{12,}$').hasMatch('${_countryCode}${value}')) {
          addError(error: kInvalidPhoneNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
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
      ),
    );
  }

  void onCodeSent(String verificationId, [int forceResendingToken]) {
    Navigator.of(context).pop();
    setState(() {
      _registrationInProgress = false;
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
                              '$phoneNumber:',
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
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          autoDisposeControllers: false,
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
                                await _authService.signInWithPhone(
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
        });
  }

  Future<void> onRegisterPressed() async {
    if (_registerFormKey.currentState.validate()) {
      _registerFormKey.currentState.save();
      setState(() {
        _registrationInProgress = true;
      });
      final bool result = await _credentialsService.checkEmailAndPhone(
          email: email, phone: phoneNumber);
      if (result == null) {
        setState(() {
          _registrationInProgress = false;
        });
        FlushHelper.flushbarAlert(
            context: context,
            title: 'Error',
            message:
                'Some problem occured during sign up. Please try again after sometime.',
            seconds: 3);
      } else {
        if (!result) {
          setState(() {
            _registrationInProgress = false;
          });
          showOtpLoadingAnimation('Auto retrieving OTP');
          await _authService.signInWithPhone(
              phoneNumber: phoneNumber,
              onCodeSent: onCodeSent,
              onPhoneVerified: onPhoneVerified);
        } else {
          setState(() {
            _registrationInProgress = false;
          });
          FlushHelper.flushbarAlert(
              context: context,
              title: 'Error',
              message:
                  'Email or phone number is already taken. Please try different email or phone number.',
              seconds: 3);
        }
      }
    }
  }

  Future<void> onOtpEntered({@required String verificationId}) async {
    _easyLoadingHelper.show(text: 'Verifying OTP');
    AuthCredential credential;
    String firebaseId;
    FirebaseAuth auth = FirebaseAuth.instance;
    smsCode = _codeController.text.trim();
    credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      final result = await auth.signInWithCredential(credential);
      firebaseId = result.user.uid;
      setState(() {
        _otpVerified = true;
      });
    } catch (e) {
      setState(() {
        _otpInProgress = false;
        _otpVerified = false;
      });
    }
    if (firebaseId != null && _otpVerified) {
      await onPhoneVerified(firebaseId);
    } else {
      setState(() {
        _otpInProgress = false;
      });
      _easyLoadingHelper.dismiss();
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
    RegistrationService _registrationService = RegistrationService();
    FirebaseMessagingService _fcmService = FirebaseMessagingService();
    String fcmToken = await _fcmService.getToken();
    RegistrationModel _registratiomModel = RegistrationModel(
        fullName: fullName,
        email: email,
        phoneNo: phoneNumber,
        password1: password,
        password2: repeatPassword,
        fcmToken: fcmToken);
    if (firebaseId != null) {
      await _authService.signUpWithFirebaseEmailAndPassword(email, password);
      _registratiomModel.firebaseId = firebaseId;
      final Map<String, dynamic> result =
          await _registrationService.register(currentState: _registratiomModel);
      setState(() {
        _otpInProgress = false;
      });
      if (result["success"]) {
        Navigator.of(context).pop();
        final Map<String, dynamic> loginResult =
            await _loginService.loginWithFirebase(firebaseId: firebaseId);
        _easyLoadingHelper.dismiss();
        final User.User currentUser = loginResult['user'];
        if (currentUser != null) {
          appProvider.currentUser = currentUser;
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (Route route) => route.settings.name == '/sign_up',
            arguments: {
              "message":
                  "Registration successful. Confirmation mail has been sent to your email."
            },
          );
          // appProvider.bottomNavbarIndex = 0;
          // if (widget.from == '' || widget.from == null) {
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     '/home', (Route route) => route.settings.name == '/register',
          //     arguments: {
          //       "message":
          //           "Registration successful. Confirmation mail has been sent to your email."
          //     });
          // } else {
          //   if (widget.from == '/basket') {
          //     Navigator.of(context).pushNamedAndRemoveUntil('/newaddress',
          //         (Route route) => route.settings.name == '/register');
          //   } else {
          //     Navigator.of(context).pushNamedAndRemoveUntil(widget.from,
          //         (Route route) => route.settings.name == '/register',
          //         arguments: {
          //           "message":
          //               "Registration successful. Confirmation mail has been sent to your email."
          //         });
          //   }
          // }
        } else {
          FlushHelper.flushbarAlert(
              context: context,
              title: 'Error',
              message: loginResult['message'],
              seconds: 3);
        }
      } else {
        FlushHelper.flushbarAlert(
            context: context,
            title: 'Error',
            message: result['message'],
            seconds: 3);
      }
    } else {
      FlushHelper.flushbarAlert(
          context: context,
          title: 'Error',
          message: 'Unable to verify your phone number. Please try again',
          seconds: 3);
    }
  }

  void onCountryChanged(CountryCode countryCode) {
    setState(() {
      _countryCode = countryCode.toString();
    });
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
