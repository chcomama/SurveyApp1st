import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_project/model/customer_model.dart';
import 'package:survey_project/model/user_model.dart';
import 'package:survey_project/state/customerDetail.dart';
import 'package:survey_project/utility/my_constant.dart';
import 'package:survey_project/utility/my_style.dart';

class CustomerList extends StatefulWidget {
// final CustomerModel customerModel;
//CustomerList({Key key, this.customerModel}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
//  CustomerModel customerModel;
  List<CustomerModel> customermodel = []; //ori
  String userName, routeNo, nameLogin, userPak, userLevel;
  double screen;
  Widget currentWidget;
  var numrow;

  @override
  void initState() {
    super.initState();
    readAllProduct();
    // customerModel = widget.customerModel;
  }

  Future<Null> readAllProduct() async {
    if (customermodel.length != 0) {
      customermodel.clear();
    }

    //หาUid
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userName = preferences.getString(MyConstant().keyUsername);
    routeNo = preferences.getString('RouteNo');
    nameLogin = preferences.getString('Name');
    userPak = preferences.getString('Pak');
    userLevel = preferences.getString('Level');

    String uid = userName;
    print('*******  Read All Product work uid => $uid');

    String urlAPI =
        'https://smicb.osotspa.com/smicprogram/QAS/SurveyApp/CustomerAll.php?isAdd=true&uid=$uid&RouteNo=$routeNo&Pak=$userPak&Level=$userLevel';
    print('url___________***>$urlAPI');

    await Dio().get(urlAPI).then((value) {
      //print('****  value = $value');
      //แปลงโค้ดให้เป็น utf8
      var result = json.decode(value.data);

      print('#####  result = $result');
      numrow = result;
      //เอาค่าออกมาโชว์
      for (var item in result) {
        CustomerModel model = CustomerModel.fromMap(item);
        setState(() {
          customermodel.add(model);
          // print('loppppp');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    {
      screen = MediaQuery.of(context).size.width;
      return Scaffold(
        //ปุ่มAddด้านล่างจอ
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyStyle().primaryColor,
          onPressed: () => Navigator.pushNamed(context, '/addcustomer')
              .then((value) => readAllProduct()),
          child: Icon(Icons.add),
        ),

        body:  numrow == null? Text(''): customermodel.length == 0?
         MyStyle().showProgress() : 
             ListView.builder(
                itemCount: customermodel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      //เรียงสีสลับกัน
                      color: index % 2 == 0
                          ? MyStyle().lightColor
                          : Colors.grey.shade200,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            //ดึงภาพมาโชว์
                            width: screen * 0.25,
                            height: screen * 0.25,

                            child: CachedNetworkImage(
                                //ถ้าไม่เจอรูปให้โชว์รูปอื่นแทน
                                errorWidget: (context, url, error) =>
                                    Image.asset('images/image.png'),
                                //ถ้ายังโหลดภาพไม่ได้ให้โชว์ Loading
                                placeholder: (context, url) =>
                                    MyStyle().showProgress(),
                                imageUrl:
                                    '${MyConstant().domain}${customermodel[index].urlproduct}'),
                          ),
                          Container(
                            //ขยับให้ตัวหนังสือขยับเข้ามา
                            padding: EdgeInsets.all(8),
                            width: screen * 0.5 - 5,
                            // height: screen * 0.5,
                            child: Column(
                              //เรียงซ้ายไปขวา
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${customermodel[index].sh_name}',
                                  style: MyStyle().titleH1Style(),
                                ),
                                Text(
                                  'จังหวัด : ${customermodel[index].sh_city}',
                                ),
                                Text(
                                  'โทร : ${customermodel[index].tel1},${customermodel[index].tel2}',
                                ),
                                Text(
                                  'Map : ${customermodel[index].lat},${customermodel[index].long}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print('customer--- $index');
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => Customer_Detail(
                          customerModel: customermodel[index],
                        ),
                      );
                      Navigator.push(context, route);
                    },
                  );
                },
              ),
      );
    }
  }
}
