import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/decorators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //login function
    void doLogin() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        Navigator.of(context).pushReplacementNamed('routeName');
      } else {
        print('error message');
      }
    }

    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            TextFormField(
                controller: email,
                validator: (value) =>
                    value == null ? 'Email field must not be empty' : '',
                decoration: authdecorator('Email', Icons.email)),
            const SizedBox(height: 15),
            TextFormField(
                controller: password,
                validator: (value) =>
                    value == null ? 'Password field must not be empty' : '',
                decoration: authdecorator('Password', Icons.lock)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: AuthButton(
                title: 'Login',
                onPress: () => doLogin,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '< Forgotten password ?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.deepOrange),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}