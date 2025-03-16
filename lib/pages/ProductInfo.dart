class ProductInfo {
  List<LiPayModes>? liPayModes;
  List<LiAppProduct>? liAppProduct;
  List<ListOCCUPATION>? listOCCUPATION;

  ProductInfo({this.liPayModes, this.liAppProduct, this.listOCCUPATION});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    if (json['liPayModes'] != null) {
      liPayModes = <LiPayModes>[];
      json['liPayModes'].forEach((v) {
        liPayModes!.add(new LiPayModes.fromJson(v));
      });
    }
    if (json['liAppProduct'] != null) {
      liAppProduct = <LiAppProduct>[];
      json['liAppProduct'].forEach((v) {
        liAppProduct!.add(new LiAppProduct.fromJson(v));
      });
    }
    if (json['ListOCCUPATION'] != null) {
      listOCCUPATION = <ListOCCUPATION>[];
      json['ListOCCUPATION'].forEach((v) {
        listOCCUPATION!.add(new ListOCCUPATION.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.liPayModes != null) {
      data['liPayModes'] = this.liPayModes!.map((v) => v.toJson()).toList();
    }
    if (this.liAppProduct != null) {
      data['liAppProduct'] = this.liAppProduct!.map((v) => v.toJson()).toList();
    }
    if (this.listOCCUPATION != null) {
      data['ListOCCUPATION'] =
          this.listOCCUPATION!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiPayModes {
  int? PAY_MODE_ID;
  String? PAY_MODE;

  LiPayModes({this.PAY_MODE_ID, this.PAY_MODE});

  LiPayModes.fromJson(Map<String, dynamic> json) {
    PAY_MODE_ID = json['PAY_MODE_ID'];
    PAY_MODE = json['PAY_MODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PAY_MODE_ID'] = this.PAY_MODE_ID;
    data['PAY_MODE'] = this.PAY_MODE;
    return data;
  }
}

class LiAppProduct {
  String? pid;
  String? pShortName;
  String? pName;
  List<LiAppSuppProduct>? liAppSuppProduct;

  LiAppProduct({this.pid, this.pShortName, this.pName, this.liAppSuppProduct});

  LiAppProduct.fromJson(Map<String, dynamic> json) {
    pid = json['Pid'];
    pShortName = json['pShortName'];
    pName = json['pName'];
    if (json['liAppSuppProduct'] != null) {
      liAppSuppProduct = <LiAppSuppProduct>[];
      json['liAppSuppProduct'].forEach((v) {
        liAppSuppProduct!.add(new LiAppSuppProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pid'] = this.pid;
    data['pShortName'] = this.pShortName;
    data['pName'] = this.pName;
    if (this.liAppSuppProduct != null) {
      data['liAppSuppProduct'] =
          this.liAppSuppProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiAppSuppProduct {
  String? spid;
  String? pid;
  String? suppShortName;
  String? suppName;

  LiAppSuppProduct({this.spid, this.pid, this.suppShortName, this.suppName});

  LiAppSuppProduct.fromJson(Map<String, dynamic> json) {
    spid = json['Spid'];
    pid = json['Pid'];
    suppShortName = json['SuppShortName'];
    suppName = json['SuppName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Spid'] = this.spid;
    data['Pid'] = this.pid;
    data['SuppShortName'] = this.suppShortName;
    data['SuppName'] = this.suppName;
    return data;
  }
}

class ListOCCUPATION {
  String? cODE;
  String? dSCR;
  bool? oCLASS;
  int? rATE;

  ListOCCUPATION({this.cODE, this.dSCR, this.oCLASS, this.rATE});

  ListOCCUPATION.fromJson(Map<String, dynamic> json) {
    cODE = json['CODE'];
    dSCR = json['DSCR'];
    oCLASS = json['OCLASS'];
    rATE = json['RATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = this.cODE;
    data['DSCR'] = this.dSCR;
    data['OCLASS'] = this.oCLASS;
    data['RATE'] = this.rATE;
    return data;
  }
}
