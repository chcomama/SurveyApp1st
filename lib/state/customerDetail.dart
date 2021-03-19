import 'package:flutter/material.dart';
import 'package:survey_project/model/customer_model.dart';
import 'package:survey_project/state/Survey.dart';
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
        title: Text('ร้าน :  ${customerModel.sh_name}'),
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
          buildTel1(),
          buildTel2(),
          buildCity(),
          buildCustStatus(),
          buildGotoSurvey(),
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
      child: Row(
        children: <Widget>[
          Icon(
            Icons.store,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text(customerModel.sh_name),
        ],
      ),
    );
  }

  Container buildTel1() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.phone,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text(customerModel.tel1),
        ],
      ),
    );
  }

  Container buildTel2() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.phone_android,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text(customerModel.tel2),
        ],
      ),
    );
  }

  Container buildCity() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_city,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text(customerModel.sh_city),
        ],
      ),
    );
  }

  Container buildCustStatus() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: Row(
        children: <Widget>[
          // Icon(
          //   Icons.crop_square,
          //   color: Colors.grey,
          // ),
          Text('Status :'),
          SizedBox(
            width: 20,
          ),
          Text(customerModel.status),
        ],
      ),
    );
  }

  Container buildGotoSurvey() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => survey_first(
           
            ),
          );
            Navigator.push(context, route);



        },
        child: Text('สำรวจ'),
      ),
    );
  }
}
