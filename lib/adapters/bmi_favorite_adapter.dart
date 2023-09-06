import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BmiFavoriteHiveAdapter extends TypeAdapter<BmiFavoriteModel> {
  @override
  final typeId = 0;

  @override
  BmiFavoriteModel read(BinaryReader reader) {
    return BmiFavoriteModel(
      id: reader.readString(),
      height: reader.readDouble(),
      weight: reader.readDouble(),
      bmi: reader.readDouble(),
      data: DateTime.fromMillisecondsSinceEpoch(
        reader.readInt(),
      ),
      color: Color(reader.readInt()),
      classification: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, BmiFavoriteModel obj) {
    writer.writeString(obj.id);
    writer.writeDouble(obj.height);
    writer.writeDouble(obj.weight);
    writer.writeDouble(obj.bmi);
    writer.writeInt(obj.data.millisecondsSinceEpoch);
    writer.writeInt(obj.color.value);
    writer.writeString(obj.classification);
  }
}
