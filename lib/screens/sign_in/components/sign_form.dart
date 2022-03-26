import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/custom_raised_button.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/utils/check_credentials_service.dart';
import 'package:shop_app/utils/firebase_auth_service.dart';
import 'package:shop_app/utils/flushbar_helper.dart';
import 'package:shop_app/utils/login_service.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../models/User.dart' as User;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  bool inProgress = false;
  LoginService _loginService = LoginService();
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

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
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
        //If  you are using latest version of flutter then lable text and hint text shown like this
        //if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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
        //If  you are using latest version of flutter then lable text and hint text shown like this
        //if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Future<void> onLoginPressed(
      BuildContext context, AppProvider appProvider) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        inProgress = true;
      });
      final bool credentialPresent = await CheckCredentialsService()
          .checkEmailAndPhone(email: email, phone: '');
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
          if (email != "" && password != "") {
            setState(() {
              inProgress = true;
            });
            EasyLoading.show(status: 'Logging in');
            final Map<String, dynamic> result = await _loginService
                .loginWithEmail(email: email, password: password);
            setState(() {
              inProgress = false;
            });

            final User.User currentUser = result['user'];
            if (currentUser != null) {
              appProvider.currentUser = currentUser;
              //  appProvider.bottomNavbarIndex = 0;
              await _firebaseAuthService.signInWithFirebaseEmailAndPassword(
                  email, password);
              EasyLoading.dismiss();
              //  if (widget.from == '' || widget.from == null) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route route) => route.settings.name == '/login',
                  arguments: {"message": "Login Successful"});
              //  } else {
              //    if (widget.from == '/basket') {
              //      if (currentUser.addresses.length == 0) {
              //        Navigator.of(context).pushNamedAndRemoveUntil('/newaddress',
              //            (Route route) => route.settings.name == '/login');
              //      } else {
              //        Navigator.of(context).pushNamedAndRemoveUntil(
              //            '/addresslist',
              //            (Route route) => route.settings.name == '/login');
              //      }
              //    } else {
              //      Navigator.of(context).pushNamedAndRemoveUntil(widget.from,
              //          (Route route) => route.settings.name == '/login',
              //          arguments: {"message": "Login Successful"});
              //    }
              //  }
            } else {
              EasyLoading.dismiss();
              FlushHelper.flushbarAlert(
                  context: context,
                  title: 'Error',
                  message: result['message'],
                  seconds: 3);
            }
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
}
