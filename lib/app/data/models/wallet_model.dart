class WalletResult {
  String? status;
  String? message;
  Wallet? wallet;
  WalletRedeem? walletRedeem;

  WalletResult({this.status, this.message, this.wallet, this.walletRedeem});

  WalletResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    wallet = json['data'] != null ? Wallet?.fromJson(json['data']) : Wallet();
  }

  WalletResult.redeemFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    walletRedeem =
        json['data'] != null ? WalletRedeem?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = wallet?.toJson();
    return data;
  }
}

class WalletRedeem {
  int? redeemPoint;
  double? totalAmount;
  int? customerTotalRewardPoint;
  double? subtractedRedeemAmount;
  int? balancePoint;

  WalletRedeem(
      {this.redeemPoint,
      this.totalAmount,
      this.customerTotalRewardPoint,
      this.subtractedRedeemAmount,
      this.balancePoint});

  WalletRedeem.fromJson(Map<String, dynamic> json) {
    redeemPoint = json['redeemPoint'];
    totalAmount = double.parse(json['totalAmount'].toString());
    customerTotalRewardPoint = json['customerTotalRewardPoint'];
    subtractedRedeemAmount = double.parse(json['subtractedRedeemAmount'].toString());
    balancePoint = json['balancePoint'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['redeemPoint'] = redeemPoint;
    data['totalAmount'] = totalAmount;
    data['customerTotalRewardPoint'] = customerTotalRewardPoint;
    data['subtractedRedeemAmount'] = subtractedRedeemAmount;
    data['balancePoint'] = balancePoint;
    return data;
  }
}

class Wallet {
  bool? deletable;
  String? sId;
  String? customerId;
  int? rewardPoint;

  Wallet({this.deletable=false, this.sId='', this.customerId='', this.rewardPoint=0});

  Wallet.fromJson(Map<String, dynamic> json) {
    deletable = json['deletable']??false;
    sId = json['_id']??'';
    customerId = json['customerId']??'';
    rewardPoint = json['rewardPoint']??0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['deletable'] = deletable;
    data['_id'] = sId;
    data['customerId'] = customerId;
    data['rewardPoint'] = rewardPoint;
    return data;
  }
}
