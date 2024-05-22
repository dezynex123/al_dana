class PaymentResult {
  late String status, message;
  late PaymentModel order;

  PaymentResult({this.status = '', this.message = '', required this.order});

  PaymentResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (status == 'success') {
      order = json['data'] != null
          ? PaymentModel.fromJson(json['data'])
          : PaymentModel();
    } else {
      order = PaymentModel();
      message = json['data'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = order.toJson();
    return data;
  }
}

class PaymentModel {
  late String id;
  late String entity;
  late String currency;
  late String receipt;
  late String status;
  late int amount;
  late int amountPaid;
  late int amountDue;
  late int attempts;
  late int createdAt;
  late List<String> notes;
  PaymentModel({
    this.id = '',
    this.entity = '',
    this.currency = '',
    this.receipt = '',
    this.status = '',
    this.amount = 0,
    this.amountPaid = 0,
    this.amountDue = 0,
    this.attempts = 0,
    this.createdAt = 0,
    this.notes = const [],
  });
  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    entity = json['entity'] ?? '';
    amount = json['amount'] ?? 0;
    amountPaid = json['amount_paid'] ?? 0;
    amountDue = json['amount_due'] ?? 0;
    currency = json['currency'] ?? '';
    receipt = json['receipt'] ?? '';
    status = json['status'] ?? '';
    attempts = json['attempts'] ?? 0;
    notes = json['notes'] != null ? json['notes'].cast<String>() : [];
    createdAt = json['created_at'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['entity'] = entity;
    data['amount'] = amount;
    data['amount_paid'] = amountPaid;
    data['amount_due'] = amountDue;
    data['currency'] = currency;
    data['receipt'] = receipt;
    data['status'] = status;
    data['attempts'] = attempts;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    return data;
  }
}
