import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' hide Builder;

part 'tile.g.dart';

abstract class TileContent {
  String get name;
  Widget get thumbnail;
}

abstract class TileGroupContent
    implements Built<TileGroupContent, TileGroupContentBuilder> {
  String get labelText;
  BuiltList<TileContent> get tileContents;

  TileGroupContent._();
  factory TileGroupContent([void Function(TileGroupContentBuilder) updates]) =
      _$TileGroupContent;
}
