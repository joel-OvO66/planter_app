import 'package:json_annotation/json_annotation.dart';

import 'Privilege.dart';
part 'Authenticity.g.dart';

@JsonSerializable()
class Authenticity{

   int? id;
   String? name;
   String? fullName;
   String? avatar;
   late String token;
   Set<String>? authorities;
   List<Privilege>? privileges;
   Map<String, dynamic>? extend;

   Authenticity() {}

   factory Authenticity.fromJson(Map<String, dynamic> json) => _$AuthenticityFromJson(json);

   Map<String, dynamic> toJson() => _$AuthenticityToJson(this);
}