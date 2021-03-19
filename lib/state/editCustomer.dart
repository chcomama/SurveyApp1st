import 'package:flutter/material.dart';
import 'package:survey_project/model/customer_model.dart';
import 'package:survey_project/utility/my_constant.dart';
import 'package:survey_project/utility/my_style.dart';
class editCustomer extends StatefulWidget {
 final CustomerModel customerModel;
  editCustomer({Key key, this.customerModel}) : super(key: key);


  @override
  _editCustomerState createState() => _editCustomerState();
}

class _editCustomerState extends State<editCustomer> {

 CustomerModel customerModel;
  double screen;
  bool statusProgress = false;
  String sh_code, name, tel1, tel2, city, urlPath, uid, custStatus;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Customer :  ${customerModel.sh_name}'),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Stack(
        children: [
          statusProgress ? MyStyle().showProgress() : SizedBox(),
          buildSingleChildScrollView(),
        ],
      ),
    );
  }
 SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //ความสูงด้านบน
          SizedBox(height: 30),
          buildShowImage(),
          buildCustName(),
          buildTel(),
          buildTel2(),
        ],
      ),
    );
  }

  Row buildShowImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(16.0),
          width: 150.0,
          height: 150.0,
          child: Image.network(
            '${MyConstant().domain}${customerModel.urlproduct}',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Container buildCustName() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        onChanged: (value) => name = value.trim(),

        //   initialValue: sh_code,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.store,
            color: MyStyle().darkColor,
          ),
          hintText: customerModel.sh_name,
          // hintText: 'ชื่อร้านค้า',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildTel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        onChanged: (value) => tel1 = value.trim(),

        //   initialValue: sh_code,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.phone,
            color: MyStyle().darkColor,
          ),
          hintText: customerModel.tel1,
          //hintText: 'ชื่อร้านค้า',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildTel2() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        onChanged: (value) => tel2 = value.trim(),

        //   initialValue: sh_code,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.phone_android,
            color: MyStyle().darkColor,
          ),
          hintText: customerModel.tel2,
          // hintText: 'ชื่อร้านค้า',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }
}