class User {
  int? phone;
  String? email;
  String? password;

  User({this.phone, this.email, this.password});

  User.from({this.email, this.password,this.phone});


  User.fromJson(Map<dynamic, dynamic> json)
      : phone = json['phone'],
        email = json['email'],
        password = json['password'];

  Map<dynamic, dynamic> toJson() => {
    'phone': phone,
    'email': email,
    'password': password,
  };
}

//==================================================================
//==================================================================

class Accaunt {
  String? name;
  String? email;
  String? password;
  int? phone;

  Accaunt({this.name,this.email,this.phone,this.password});

  Accaunt.from({this.name,this.email,this.phone,this.password});

  Accaunt.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson()=> {
    'name':name,
    'email':email,
    'phone':phone,
    'password':password
  };

}

//============================================================
//============================================================
class Note {
  int id;
  DateTime createTime;
  DateTime editTime;
  String title;
  String content;

  Note({
    required this.id,
    required this.createTime,
    required this.editTime,
    required this.title,
    required this.content,
  });

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createTime = DateTime.parse(json['createTime']),
        editTime = DateTime.parse(json['editTime']),
        title = json['title'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'createTime': createTime.toString(),
    'editTime': editTime,
    'title': title,
    'content': content
  };
}