
import 'dart:convert';

import 'package:shared_preference/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  //Note
  static Future<bool> storeNote(Note note) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String noteString = jsonEncode(note.toJson());
    return await pref.setString("note", noteString);
  }

  static Future<Note> loadNote()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? result = pref.getString("note");
    return Note.fromJson(jsonDecode(result!));

  }

  static Future<bool> removeNote()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('note');
  }
  //===================================================================

  static storeEmail(String email)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  static Future<String?> loadEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    return email;
  }

  static Future<bool?> removeEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('email');
  }

//-----------------------------------------------------------------------

  static storePhone(String phone)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
  }

  static Future<String?> loadPhone() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString('phone');
    return phone;
  }

  static Future<bool?> removephone() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('phone');
  }


  //-----------------------------------------------------------------------


  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString('user', stringUser);
  }

  static  Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('user');
    if (stringUser == null || stringUser.isEmpty) return null;
    Map map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  //================================================================

  static storeAccaunt(Accaunt accaunt) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringAccaunt = jsonEncode(accaunt);
    prefs.setString('accaunt', stringAccaunt);
  }

  static  Future<Accaunt?> loadAccaunt() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringAccaunt = prefs.getString('accaunt');
    if (stringAccaunt == null || stringAccaunt.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(stringAccaunt);
    return Accaunt.fromJson(map);
  }

  static Future<bool> removeAccaunt() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('accaunt');
  }

}


//============================================================================
