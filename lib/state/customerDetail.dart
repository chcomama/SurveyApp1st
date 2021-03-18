import 'package:flutter/material.dart';
import 'package:survey_project/model/customer_model.dart';
import 'package:survey_project/utility/my_constant.dart';
import 'package:survey_project/utility/my_style.dart';

class Customer_Detail extends StatefulWidget {
  final CustomerModel customerModel;
  Customer_Detail({Key key, this.customerModel}) : super(key: key);

  @override
  _Customer_DetailState createState() => _Customer_DetailState();
}

class _Customer_DetailState extends State<Customer_Detail> {
  CustomerModel customerModel;
  double screen;
  bool statusProgress = false;
  String sh_code, name, tel1, tel2, city, urlPath, uid, custStatus;
  @override
  void initState() {
    super.initState();
    customerModel = widget.customerModel;
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
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
          hintText: custTel1(customerModel.tel1),
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
          hintText: custTel2(customerModel.tel2),
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

  //methodตัดคำ
  String custTel1(String string) {
    String result = string;
    if (result.length > 10) {
      result = result.substring(0, 10);
      result = '$result';
    }
    //ทำเสร็จส่งค่ากลับ
    return result;
  }

  String custTel2(String string) {
    String result2 = string;
    if (result2.length != null) {
   
      result2 = '$result2';
      print('********************result2--$result2');
    }
    //ทำเสร็จส่งค่ากลับ
    return result2;
  }
}
