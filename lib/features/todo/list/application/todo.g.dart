// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: (json['id'] as num).toInt(),
      isChecked: json['isChecked'] as bool,
      nama: json['nama'] as String,
      deskripsi: json['deskripsi'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      category: $enumDecode(_$TodoCategoriesEnumEnumMap, json['category']),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isChecked': instance.isChecked,
      'nama': instance.nama,
      'deskripsi': instance.deskripsi,
      'dateTime': instance.dateTime.toIso8601String(),
      'category': _$TodoCategoriesEnumEnumMap[instance.category]!,
    };

const _$TodoCategoriesEnumEnumMap = {
  TodoCategoriesEnum.today: 'today',
  TodoCategoriesEnum.tomorrow: 'tomorrow',
  TodoCategoriesEnum.thisMonth: 'thisMonth',
  TodoCategoriesEnum.thisWeek: 'thisWeek',
  TodoCategoriesEnum.thisYear: 'thisYear',
  TodoCategoriesEnum.others: 'others',
};
