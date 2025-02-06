class AddressModel {
  double? lat;
  double? lang;
  String? addressType;
  String? fullAddress;
  bool? isSelected;
  AddressModel({this.lat,this.lang, this.addressType,this.isSelected = false,this.fullAddress});
}