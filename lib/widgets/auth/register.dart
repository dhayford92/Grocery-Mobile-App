import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/decorators.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //register function
    void doRegister() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
        Navigator.of(context).pushReplacementNamed('routeName');
      } else {
        print('error message');
      }
    }

    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            //fullname
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: fullname,
                      validator: (value) =>
                          value == null ? 'Name field must not be empty' : '',
                      decoration: authdecorator('Fullname', Icons.person)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                      controller: number,
                      validator: (value) =>
                          value == null ? 'Number field must not be empty' : '',
                      decoration: authdecorator('Number', Icons.phone)),
                ),
              ],
            ),
            const SizedBox(height: 15),
            //email here
            TextFormField(
                controller: email,
                validator: (value) =>
                    value == null ? 'Email field must not be empty' : '',
                decoration: authdecorator('Email', Icons.email)),
            const SizedBox(height: 15),
            //password
            TextFormField(
                controller: password,
                validator: (value) =>
                    value == null ? 'Password field must not be empty' : '',
                decoration: authdecorator('Password', Icons.lock)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: AuthButton(
                title: 'Register',
                onPress: () => doRegister,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
