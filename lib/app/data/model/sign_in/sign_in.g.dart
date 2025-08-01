// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInAdapter extends TypeAdapter<SignIn> {
  @override
  final int typeId = 0;

  @override
  SignIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignIn(
      id: fields[0] as String?,
      email: fields[1] as String?,
      name: fields[2] as String?,
      photoUrl: fields[3] as String?,
      token: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SignIn obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.photoUrl)
      ..writeByte(4)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'token': instance.token,
    };
