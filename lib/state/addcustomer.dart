import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_project/utility/dialog.dart';
import 'package:survey_project/utility/my_constant.dart';
import 'package:survey_project/utility/my_style.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  double screen;
  File file;
  String sh_code, name, tel1, tel2, city, urlPath, uid, custStatus;
  bool statusProgress = false;
  String dropdownValue = '1';
  double lat, lng;
  String nameLogin, userName, routeNo;
  List dropdownStatus = [];
  String dropdownid;

  @override
  void initState() {
    super.initState();
    findUid();
    findLatLng();
    this.dropdownDD();
  }

  Future<String> dropdownDD() async {
    var res = await http.get(
      Uri.encodeFull(
          'https://smicb.osotspa.com/smicprogram/QAS/SurveyApp/Dropdown.php?isAdd=true'),
    ); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);
    setState(() {
      dropdownStatus = resBody;
    });

    return "Sucess";
  }

  Future<Null> findLatLng() async {
    LocationData locationData = await findLocationData();
    setState(() {
      lat = locationData.latitude;
      lng = locationData.longitude;
    });
    print('*******************lat ==> $lat Long===>$lng');
  }

  Future<LocationData> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

//หาชื่อที่Login
  Future<Null> findUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString('UserName');
      routeNo = preferences.getString('RouteNo');
      nameLogin = preferences.getString('Name');

      uid = userName;
      print('SESSION--->U_ $userName R_ $routeNo N_ $nameLogin');
    });
  }

  Container buildCustName() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.store,
            color: MyStyle().darkColor,
          ),
          hintText: 'ชื่อร้านค้า',
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
        keyboardType: TextInputType.number,
        maxLength: 10,
        onChanged: (value) => tel1 = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.phone_android_sharp,
            color: MyStyle().darkColor,
          ),
          hintText: 'เบอร์ติดต่อ',
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
          color: Colors.white70, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 10,
        onChanged: (value) => tel2 = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.phone_android,
            color: MyStyle().darkColor,
          ),
          hintText: 'เบอร์ติดต่อ2',
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

  Container buildCity() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextField(
        onChanged: (value) => city = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.location_city,
            color: MyStyle().darkColor,
          ),
          hintText: 'จังหวัด',
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

  Container buildCustomerStatus() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: DropdownButton(
        style: TextStyle(
          color: MyStyle().darkColor,
          fontSize: 20.0,
        ),
        icon: Icon(Icons.arrow_drop_down),
        hint: Text(
          'สถานะ :',
          style: TextStyle(color: MyStyle().darkColor),
        ),
        items: dropdownStatus.map((item) {
          return new DropdownMenuItem(
              child: new Text(
                item['MenuName'], //Names that the api dropdown contains
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              value: item['MenuName']
                  .toString() //Id that has to be passed that the dropdown has.....
              //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
              );
        }).toList(),
        onChanged: (String newVal) {
          setState(() {
            dropdownid = newVal;
            print(dropdownid.toString());
          });
        },
        value:
            dropdownid, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
      ),
    );
  }

//Displayตรงนี้
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
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
          buildRowImage(),
          buildCustName(),
          buildTel(),
          buildTel2(),
          buildCity(),
          buildCustomerStatus(),
          // buildDropdownButton(),
          // buildDropdownStatus(),
          lat == null ? MyStyle().showProgress() : showMap(),
          buildSaveCustomer(),
        ],
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownStatus() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        items: dropdownStatus.map((item) {
          return new DropdownMenuItem(
              child: new Text(
                item['MenuName'], //Names that the api dropdown contains
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              value: item['MenuName']
                  .toString() //Id that has to be passed that the dropdown has.....
              //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
              );
        }).toList(),
        onChanged: (String newVal) {
          setState(() {
            dropdownid = newVal;
            print(dropdownid.toString());
          });
        },
        value:
            dropdownid, //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
      ),
    );
  }

  Container buildSaveCustomer() {
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
          //Check Blank
          if (file == null) {
            normalDialog(
                context, 'Please Choose Image ? by Click Camera Or Gallery');
          } else if ((name?.isEmpty ?? true) ||
              (tel1?.isEmpty ?? true) ||
              (city?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else {
            // confirmSave();

            //methodsave
            uploadImageAndInsertData();
            // Navigator.pop(context);
            //refrehก่อน
            setState(() {
              statusProgress = true;
            });
          }
          print('******************** name = $name  tel = $tel2  city = $city');
        },
        child: Text('Save Customer'),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('myShop'),
          position: LatLng(lat, lng),
          infoWindow:
              InfoWindow(title: 'ฉันอยู่ที่นี่', snippet: 'Lat=$lat,Long=$lng'))
    ].toSet();
  }

  Container showMap() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 200,
      width: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }

//alertแบบโชว์Detail
  Future<Null> confirmSave() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: Image.file(file),
          title: Text(name),
          subtitle: Text(tel1),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'City : $city',
                style: TextStyle(color: Colors.pink, fontSize: 25),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  //methodsave
                  uploadImageAndInsertData();
                  //refrehก่อน
                  setState(() {
                    statusProgress = true;
                  });
                  Navigator.pop(context);
                },
                child: Text('Save Product'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cacel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
          //ต่อข้อมูลได้เรื่อยๆ
        ],
      ),
    );
  }

  Future<Null> chooseSourceImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result.path);
      });
    } catch (e) {}
  }

  Row buildRowImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text('*'),
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => chooseSourceImage(ImageSource.camera),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          width: screen * 0.3,
          child:
              file == null ? Image.asset('images/image.png') : Image.file(file),
        ),
        // IconButton(
        //   icon: Icon(Icons.add_photo_alternate),
        //   onPressed: () => chooseSourceImage(ImageSource.gallery),
        // ),
      ],
    );
  }

  Future<Null> uploadImageAndInsertData() async {
    int i = Random().nextInt(1000000);
    String nameImage = 'Cust$i.jpg';
    String pathImage = '${MyConstant().urlSaveFile}$uid';
    // print('pathImage========> $pathImage');
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file.path, filename: nameImage);
      FormData data = FormData.fromMap(map);
      await Dio().post(pathImage, data: data).then((value) async {
        urlPath = 'Customer/$uid/$nameImage';
        sh_code = '$uid$i';
        print('************ ${MyConstant().domain}$urlPath');

        String urlAPI =
            'https://smicb.osotspa.com/smicprogram/QAS/SurveyApp/addData.php?isAdd=true&uidshop=$uid&routeNo=$routeNo&name=$name&tel1=$tel1&tel2=$tel2&city=$city&custStatus=$dropdownid&urlproduct=$urlPath&lat=$lat&lng=$lng';
        print('urlAPI___________>$urlAPI');

        await Dio().get(urlAPI).then((value) => Navigator.pop(context));
      }).catchError((value) {
        print('Error________ ${value.toString()}');
      });
    } catch (e) {
      print('Error ---------------> ${e.toString()}');
    }
  }
}
