import 'package:retrofit/http.dart';

///Seed Model used for the get request

@Parser.JsonSerializable
class Seed {
  Seed({
    this.seed,
    this.expiresAt,
  });

  String? seed;
  DateTime? expiresAt;

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        seed: json["Seed"],
        //TODO: Add try parse instead of parse to bring back a null that can be handled back in the provider
        expiresAt: DateTime.tryParse(json["Expires_At"]),
      );

  Map<String, dynamic> toJson() => {
        "Seed": seed,
        "Expires_At": expiresAt?.toIso8601String(),
      };
}
