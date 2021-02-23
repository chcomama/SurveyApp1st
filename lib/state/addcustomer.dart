import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
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
  String name, tel, tel2, city, urlPath, uid, customerStatus;
  bool statusProgress = false;
  String dropdownValue = '1';
  double lat, lng;

  @override
  void initState() {
    super.initState();
    findUid();
    findLatLng();
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

  Future<Null> findUid() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        // uid = event.uid;
        uid = 'a1234';
      });
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
        onChanged: (value) => tel = value.trim(),
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
      child: TextField(
        onChanged: (value) => customerStatus = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.category_sharp,
            color: MyStyle().darkColor,
          ),
          hintText: 'สถานะ',
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
          lat == null ? MyStyle().showProgress() : showMap(),
          buildSaveCustomer(),
        ],
      ),
    );
  }

//TestDropdow
  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['1', '2', '3', '4']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
              (tel?.isEmpty ?? true) ||
              (city?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else {
            confirmSave();
          }
          print('******************** name = $name  tel = $tel  city = $city');
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
      height: 200,width: 300,
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
          subtitle: Text(tel),
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
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file.path, filename: nameImage);
      FormData data = FormData.fromMap(map);
      await Dio()
          .post(MyConstant().urlSaveFile, data: data)
          .then((value) async {
        urlPath = 'Customer/$nameImage';
        print('************ ${MyConstant().domain}$urlPath');

        String urlAPI =
            'https://smicb.osotspa.com/smicprogram/QAS/SurveyApp/addData.php?isAdd=true&uidshop=$uid&name=$name&tel=$tel&city=$city&urlproduct=$urlPath';

        //  'https://www.androidthai.in.th/osp/addDataMa.php?isAdd=true&uidshop=$uid&name=$name&detail=$tel&price=$city&urlproduct=$urlPath';

        await Dio().get(urlAPI).then((value) => Navigator.pop(context));
        print('url___________>$urlAPI');
      }).catchError((value) {
        print('################# ${value.toString()}');
      });
    } catch (e) {
      print('Error ---------------> ${e.toString()}');
    }
  }
}
