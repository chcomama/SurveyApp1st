import 'dart:convert';

class CustomerModel {
  final String id;
  final String sp_code;
  final String sp_name;
  final String sp_district;
  final String sp_city;
  final String sh_code;
  final String sh_name;
  final String sh_district;
  final String sh_city;
  final String pak;
  final String status;
  final String sdst;
  final String salesorg;
  final String distribution_channel;
  final String urlproduct;
  final String salesoffice;
  final String channel1;
  final String channel2;
  final String channel3;
  final String dc_code;
  final String dc_name;
  final String agentgroup;
  final String lineno;
  final String common;
  final String start;
  final String end;
  final String vendor;
  final String shipcode;
  final String box_code;
  final String tel;
  final String sp_code_city;
  final String sh_code_city;
  final String birth_date;
  final String surveyor;
  final String lmtcode;
  final String lat;
  final String long;
  CustomerModel({
    this.id,
    this.sp_code,
    this.sp_name,
    this.sp_district,
    this.sp_city,
    this.sh_code,
    this.sh_name,
    this.sh_district,
    this.sh_city,
    this.pak,
    this.status,
    this.sdst,
    this.salesorg,
    this.distribution_channel,
    this.urlproduct,
    this.salesoffice,
    this.channel1,
    this.channel2,
    this.channel3,
    this.dc_code,
    this.dc_name,
    this.agentgroup,
    this.lineno,
    this.common,
    this.start,
    this.end,
    this.vendor,
    this.shipcode,
    this.box_code,
    this.tel,
    this.sp_code_city,
    this.sh_code_city,
    this.birth_date,
    this.surveyor,
    this.lmtcode,
    this.lat,
    this.long,
  });

  CustomerModel copyWith({
    String id,
    String sp_code,
    String sp_name,
    String sp_district,
    String sp_city,
    String sh_code,
    String sh_name,
    String sh_district,
    String sh_city,
    String pak,
    String status,
    String sdst,
    String salesorg,
    String distribution_channel,
    String urlproduct,
    String salesoffice,
    String channel1,
    String channel2,
    String channel3,
    String dc_code,
    String dc_name,
    String agentgroup,
    String lineno,
    String common,
    String start,
    String end,
    String vendor,
    String shipcode,
    String box_code,
    String tel,
    String sp_code_city,
    String sh_code_city,
    String birth_date,
    String surveyor,
    String lmtcode,
    String lat,
    String long,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      sp_code: sp_code ?? this.sp_code,
      sp_name: sp_name ?? this.sp_name,
      sp_district: sp_district ?? this.sp_district,
      sp_city: sp_city ?? this.sp_city,
      sh_code: sh_code ?? this.sh_code,
      sh_name: sh_name ?? this.sh_name,
      sh_district: sh_district ?? this.sh_district,
      sh_city: sh_city ?? this.sh_city,
      pak: pak ?? this.pak,
      status: status ?? this.status,
      sdst: sdst ?? this.sdst,
      salesorg: salesorg ?? this.salesorg,
      distribution_channel: distribution_channel ?? this.distribution_channel,
      urlproduct: urlproduct ?? this.urlproduct,
      salesoffice: salesoffice ?? this.salesoffice,
      channel1: channel1 ?? this.channel1,
      channel2: channel2 ?? this.channel2,
      channel3: channel3 ?? this.channel3,
      dc_code: dc_code ?? this.dc_code,
      dc_name: dc_name ?? this.dc_name,
      agentgroup: agentgroup ?? this.agentgroup,
      lineno: lineno ?? this.lineno,
      common: common ?? this.common,
      start: start ?? this.start,
      end: end ?? this.end,
      vendor: vendor ?? this.vendor,
      shipcode: shipcode ?? this.shipcode,
      box_code: box_code ?? this.box_code,
      tel: tel ?? this.tel,
      sp_code_city: sp_code_city ?? this.sp_code_city,
      sh_code_city: sh_code_city ?? this.sh_code_city,
      birth_date: birth_date ?? this.birth_date,
      surveyor: surveyor ?? this.surveyor,
      lmtcode: lmtcode ?? this.lmtcode,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sp_code': sp_code,
      'sp_name': sp_name,
      'sp_district': sp_district,
      'sp_city': sp_city,
      'sh_code': sh_code,
      'sh_name': sh_name,
      'sh_district': sh_district,
      'sh_city': sh_city,
      'pak': pak,
      'status': status,
      'sdst': sdst,
      'salesorg': salesorg,
      'distribution_channel': distribution_channel,
      'urlproduct': urlproduct,
      'salesoffice': salesoffice,
      'channel1': channel1,
      'channel2': channel2,
      'channel3': channel3,
      'dc_code': dc_code,
      'dc_name': dc_name,
      'agentgroup': agentgroup,
      'lineno': lineno,
      'common': common,
      'start': start,
      'end': end,
      'vendor': vendor,
      'shipcode': shipcode,
      'box_code': box_code,
      'tel': tel,
      'sp_code_city': sp_code_city,
      'sh_code_city': sh_code_city,
      'birth_date': birth_date,
      'surveyor': surveyor,
      'lmtcode': lmtcode,
      'lat': lat,
      'long': long,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CustomerModel(
      id: map['id'],
      sp_code: map['sp_code'],
      sp_name: map['sp_name'],
      sp_district: map['sp_district'],
      sp_city: map['sp_city'],
      sh_code: map['sh_code'],
      sh_name: map['sh_name'],
      sh_district: map['sh_district'],
      sh_city: map['sh_city'],
      pak: map['pak'],
      status: map['status'],
      sdst: map['sdst'],
      salesorg: map['salesorg'],
      distribution_channel: map['distribution_channel'],
      urlproduct: map['urlproduct'],
      salesoffice: map['salesoffice'],
      channel1: map['channel1'],
      channel2: map['channel2'],
      channel3: map['channel3'],
      dc_code: map['dc_code'],
      dc_name: map['dc_name'],
      agentgroup: map['agentgroup'],
      lineno: map['lineno'],
      common: map['common'],
      start: map['start'],
      end: map['end'],
      vendor: map['vendor'],
      shipcode: map['shipcode'],
      box_code: map['box_code'],
      tel: map['tel'],
      sp_code_city: map['sp_code_city'],
      sh_code_city: map['sh_code_city'],
      birth_date: map['birth_date'],
      surveyor: map['surveyor'],
      lmtcode: map['lmtcode'],
      lat: map['lat'],
      long: map['long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(id: $id, sp_code: $sp_code, sp_name: $sp_name, sp_district: $sp_district, sp_city: $sp_city, sh_code: $sh_code, sh_name: $sh_name, sh_district: $sh_district, sh_city: $sh_city, pak: $pak, status: $status, sdst: $sdst, salesorg: $salesorg, distribution_channel: $distribution_channel, urlproduct: $urlproduct, salesoffice: $salesoffice, channel1: $channel1, channel2: $channel2, channel3: $channel3, dc_code: $dc_code, dc_name: $dc_name, agentgroup: $agentgroup, lineno: $lineno, common: $common, start: $start, end: $end, vendor: $vendor, shipcode: $shipcode, box_code: $box_code, tel: $tel, sp_code_city: $sp_code_city, sh_code_city: $sh_code_city, birth_date: $birth_date, surveyor: $surveyor, lmtcode: $lmtcode, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CustomerModel &&
      o.id == id &&
      o.sp_code == sp_code &&
      o.sp_name == sp_name &&
      o.sp_district == sp_district &&
      o.sp_city == sp_city &&
      o.sh_code == sh_code &&
      o.sh_name == sh_name &&
      o.sh_district == sh_district &&
      o.sh_city == sh_city &&
      o.pak == pak &&
      o.status == status &&
      o.sdst == sdst &&
      o.salesorg == salesorg &&
      o.distribution_channel == distribution_channel &&
      o.urlproduct == urlproduct &&
      o.salesoffice == salesoffice &&
      o.channel1 == channel1 &&
      o.channel2 == channel2 &&
      o.channel3 == channel3 &&
      o.dc_code == dc_code &&
      o.dc_name == dc_name &&
      o.agentgroup == agentgroup &&
      o.lineno == lineno &&
      o.common == common &&
      o.start == start &&
      o.end == end &&
      o.vendor == vendor &&
      o.shipcode == shipcode &&
      o.box_code == box_code &&
      o.tel == tel &&
      o.sp_code_city == sp_code_city &&
      o.sh_code_city == sh_code_city &&
      o.birth_date == birth_date &&
      o.surveyor == surveyor &&
      o.lmtcode == lmtcode &&
      o.lat == lat &&
      o.long == long;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sp_code.hashCode ^
      sp_name.hashCode ^
      sp_district.hashCode ^
      sp_city.hashCode ^
      sh_code.hashCode ^
      sh_name.hashCode ^
      sh_district.hashCode ^
      sh_city.hashCode ^
      pak.hashCode ^
      status.hashCode ^
      sdst.hashCode ^
      salesorg.hashCode ^
      distribution_channel.hashCode ^
      urlproduct.hashCode ^
      salesoffice.hashCode ^
      channel1.hashCode ^
      channel2.hashCode ^
      channel3.hashCode ^
      dc_code.hashCode ^
      dc_name.hashCode ^
      agentgroup.hashCode ^
      lineno.hashCode ^
      common.hashCode ^
      start.hashCode ^
      end.hashCode ^
      vendor.hashCode ^
      shipcode.hashCode ^
      box_code.hashCode ^
      tel.hashCode ^
      sp_code_city.hashCode ^
      sh_code_city.hashCode ^
      birth_date.hashCode ^
      surveyor.hashCode ^
      lmtcode.hashCode ^
      lat.hashCode ^
      long.hashCode;
  }
}
