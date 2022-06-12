import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';


// -- store local data for activate user 
class UserPref{
  //save user data
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', (user.id)!);
    prefs.setString('fullname', (user.fullname)!);
    prefs.setString('email', (user.email)!);
    prefs.setString('tokens', (user.tokens)!);

    return prefs.commit();
  }

  //get user data
  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = (prefs.getInt('id')!);
    String fullname = (prefs.getString('fullname')!);
    String email = (prefs.getString('email')!);
    String tokens = (prefs.getString('tokens')!);

    return User(
      id: id,
      fullname: fullname,
      email: email,
      tokens: tokens
    );
  }

  //remove user function
  void getRemoveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('fullname');
    prefs.remove('email');
    prefs.remove('tokens');
  }
}