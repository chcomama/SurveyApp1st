
class UserModel {
  String id;
  String userName;
  String passWord;
  String routeNo;
  String sName;
  String sTel;
  String email;
  String adminRole;
  String mgrcode;
  String tGTUpload;
  String company;
  String popupN;
  String popupS;
  String goto;
  String level;
  String position;
  String pak;
  String enter;
  String keysales;
  String salesvsbank;
  String sendmail;
  String mealSupport;
  String menuStatus;
  String resign;
  String right;
  String eXPDate;
  String status;
  String cando;

  UserModel(
      {this.id,
      this.userName,
      this.passWord,
      this.routeNo,
      this.sName,
      this.sTel,
      this.email,
      this.adminRole,
      this.mgrcode,
      this.tGTUpload,
      this.company,
      this.popupN,
      this.popupS,
      this.goto,
      this.level,
      this.position,
      this.pak,
      this.enter,
      this.keysales,
      this.salesvsbank,
      this.sendmail,
      this.mealSupport,
      this.menuStatus,
      this.resign,
      this.right,
      this.eXPDate,
      this.status,
      this.cando});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    passWord = json['pass_word'];
    routeNo = json['route_No'];
    sName = json['s_name'];
    sTel = json['s_tel'];
    email = json['Email'];
    adminRole = json['Admin_role'];
    mgrcode = json['Mgrcode'];
    tGTUpload = json['TGT_Upload'];
    company = json['company'];
    popupN = json['PopupN'];
    popupS = json['PopupS'];
    goto = json['Goto'];
    level = json['level'];
    position = json['position'];
    pak = json['pak'];
    enter = json['enter'];
    keysales = json['keysales'];
    salesvsbank = json['salesvsbank'];
    sendmail = json['sendmail'];
    mealSupport = json['meal_support'];
    menuStatus = json['menu_status'];
    resign = json['Resign'];
    right = json['Right'];
    eXPDate = json['EXP_Date'];
    status = json['status'];
    cando = json['cando'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['pass_word'] = this.passWord;
    data['route_No'] = this.routeNo;
    data['s_name'] = this.sName;
    data['s_tel'] = this.sTel;
    data['Email'] = this.email;
    data['Admin_role'] = this.adminRole;
    data['Mgrcode'] = this.mgrcode;
    data['TGT_Upload'] = this.tGTUpload;
    data['company'] = this.company;
    data['PopupN'] = this.popupN;
    data['PopupS'] = this.popupS;
    data['Goto'] = this.goto;
    data['level'] = this.level;
    data['position'] = this.position;
    data['pak'] = this.pak;
    data['enter'] = this.enter;
    data['keysales'] = this.keysales;
    data['salesvsbank'] = this.salesvsbank;
    data['sendmail'] = this.sendmail;
    data['meal_support'] = this.mealSupport;
    data['menu_status'] = this.menuStatus;
    data['Resign'] = this.resign;
    data['Right'] = this.right;
    data['EXP_Date'] = this.eXPDate;
    data['status'] = this.status;
    data['cando'] = this.cando;
    return data;
  }
}
