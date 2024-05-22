class VariantResult {
  late String status, message;
  late List<Variant> variantList;
  Variant? variant;

  VariantResult(
      {this.status = '',
      this.message = '',
      this.variantList = const [],
      this.variant});

  VariantResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    variant = json['data'] != null ? Variant.fromJson(json['data']) : Variant();
  }

  VariantResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      variantList = <Variant>[];
      json['data'].forEach((v) {
        variantList.add(Variant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = variantList.map((v) => v.toJson()).toList();
    return data;
  }
}

class Variant {
  late String id, name, desc, image;
  late double engineCapacity, engineOilCapacity, gearOilCapacity, tyreSize;

  Variant(
      {this.id = '',
      this.name = '',
      this.engineCapacity = 0,
      this.engineOilCapacity = 0,
      this.gearOilCapacity = 0,
      this.tyreSize = 0});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['title'];
    desc = json['description']??'';
    image = json['image']??'';
    engineCapacity =json['engineCapacity']!=null? double.parse(json['engineCapacity'].toString()):0.0;
    engineOilCapacity =json['engineOilCapacity']!=null? double.parse(json['engineOilCapacity'].toString()):0.0;
    gearOilCapacity =json['gearOilCapacity']!=null? double.parse(json['gearOilCapacity'].toString()):0.0;
    tyreSize = json['tyreSize']!=null?  double.parse(json['tyreSize'].toString()):0.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = name;
    data['description'] = desc;
    data['image'] = image;
    data['engineCapacity'] = engineCapacity;
    data['engineOilCapacity'] = engineOilCapacity;
    data['gearOilCapacity'] = gearOilCapacity;
    data['tyreSize'] = tyreSize;
    return data;
  }
}
