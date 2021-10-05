///Model used in the Post request to send scanned value to the endpoint.
class QrValidateModel {
  QrValidateModel({
    required this.qrVal,
  });

  String qrVal;

  factory QrValidateModel.fromJson(Map<String, dynamic> json) =>
      QrValidateModel(
        qrVal: json["qrVal"],
      );

  Map<String, dynamic> toJson() => {
        "qrVal": qrVal,
      };
}
