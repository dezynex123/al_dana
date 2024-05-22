
class BrandResult {
  late String status, message;
  late List<Brand> brandList;
  Brand? brand;

  BrandResult(
      {this.status = '',
      this.message = '',
      this.brandList = const [],
      this.brand});

  BrandResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    brand = json['data'] != null ? Brand.fromJson(json['data']) : Brand();
  }
  BrandResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      brandList = <Brand>[];
      json['data'].forEach((v) {
        print('data123 $v');
        brandList.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = brandList.map((v) => v.toJson()).toList();
    return data;
  }
}

class Brand {
  late String id, title, desc, image;
  // late List<Variant>? variantList;

  Brand({this.id = '', this.title = '', this.image = ''});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    desc = json['description'] ?? '';
    image = json['image'] ?? '';
    // if (json['variant'] != null) {
    //   variantList = <Variant>[];
    //   json['variant'].forEach((e) {
    //     variantList?.add(Variant.fromJson(e));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = desc;
    data['image'] = image;
    // data['variant'] = variantList!.map((v) => v.toJson()).toList();
    return data;
  }
}
