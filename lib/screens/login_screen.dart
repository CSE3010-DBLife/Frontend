import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hotel_management/screens/home_screen.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    // print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        NetWorkHelper _netoworkHelper = NetWorkHelper(url: Api.url + "/login");
        final _body = jsonEncode({
          "id": data.name.toString(),
          "pw": data.password.toString(),
        });
        final _result = await _netoworkHelper.postData(body: _body);
        if (_result['result'] == 200 && _result['success'] == true) {
          return null;
        } else {
          return '아이디 혹은 비밀번호가 일치하지 않습니다.';
        }
      } catch (e) {
        print("login Error");
        return '오류가 발생 했습니다.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        titleStyle: Theme.of(context).textTheme.headline6,
        accentColor: Theme.of(context).primaryColor,
      ),
      title: 'B HOTEL MANAGEMENT SYSTEM',
      logo: 'assets/images/b_hotel_icon.png',
      onLogin: _authUser,
      onSignup: null,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      onRecoverPassword: null,
      messages: LoginMessages(
        usernameHint: '아이디',
        passwordHint: '비밀번호',
        signupButton: '',
        confirmPasswordHint: '비밀번호 확인',
        confirmPasswordError: '비밀번호가 일치하지 않아요.',
        loginButton: '로그인',
        forgotPasswordButton: '',
        recoverPasswordIntro: '',
        recoverPasswordDescription: '가입된 이메일 계정을 입력해줘요.\n저희가 찾아드릴께요!',
        recoverPasswordButton: '임시 비밀번호 발급',
        recoverPasswordSuccess: '이메일을 확인해보세요!',
        goBackButton: '뒤로가기',
      ),
      emailValidator: customEmailValidator,
      passwordValidator: customPasswordValidator,
    );
  }
}

final special = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
final FormFieldValidator<String> customEmailValidator = (value) {
  if (special.hasMatch(value)) {
    return '특수 문자는 허용이 안됩니다.';
  } else if (value.isEmpty) {
    return '아이디를 입력해 주세요';
  }
  return null;
};
final FormFieldValidator<String> customPasswordValidator = (value) {
  if (value.isEmpty || value.length <= 1) {
    return '비밀번호가 너무 짧아요';
  }
  return null;
};
