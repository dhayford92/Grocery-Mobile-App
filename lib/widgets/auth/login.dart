import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../services/auth.dart';
import '../../utils/local_store.dart';
import '../../utils/user_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final auth = Auth();
  late User user;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  setState(() {
                    email.text = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Email field must not be empty' : '',
                decoration: authdecorator('Email', Icons.email)),
            const SizedBox(height: 15),
            TextFormField(
                controller: password,
                obscureText: true,
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  setState(() {
                    password.text = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Password field must not be empty' : '',
                decoration: authdecorator('Password', Icons.lock)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: AuthButton(
                title: 'Login',
                onPress: () {
                  Navigator.of(context)
                              .pushReplacementNamed(HomePage.id);
                  //login function
                  // void doLogin(String email, String pass) {
                  final form = formKey.currentState;
                  //check if forms are valid
                //   if (form!.validate()) {
                //     form.save();
                //     final Future<Map<String, dynamic>> response =
                //         auth.login(password.text, email.text);
                    
                //     response.then(
                //       (response) {
                //         //check for correct status
                //         if (response['status']) {
                //           user = response['data'];
                //           userProvider.setUser(user);
                //           Navigator.of(context)
                //               .pushReplacementNamed(HomePage.id);
                //         } else {
                //           AwesomeDialog(
                //             context: context,
                //             dialogType: DialogType.ERROR,
                //             animType: AnimType.BOTTOMSLIDE,
                //             title: 'Fail to Login',
                //             desc: response['message'].toString(),
                //             btnOkOnPress: () {
                //               UserPref().getRemoveUser();
                //             },
                //           ).show();
                //         }
                //       },
                //     );
                //   } else {
                //     AwesomeDialog(
                //       context: context,
                //       dialogType: DialogType.WARNING,
                //       animType: AnimType.BOTTOMSLIDE,
                //       title: 'Invaild form',
                //       desc: 'Please fill the form properly',
                //       btnOkOnPress: () {},
                //     ).show();
                //   }
                //   // }
                },
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
