// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_sort.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemSortImpl _$$WorkItemSortImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemSortImpl(
      field:
          $enumDecodeNullable(_$SortFieldEnumMap, json['field']) ??
          SortField.sortOrder,
      direction:
          $enumDecodeNullable(_$SortDirectionEnumMap, json['direction']) ??
          SortDirection.ascending,
    );

Map<String, dynamic> _$$WorkItemSortImplToJson(_$WorkItemSortImpl instance) =>
    <String, dynamic>{
      'field': _$SortFieldEnumMap[instance.field]!,
      'direction': _$SortDirectionEnumMap[instance.direction]!,
    };

const _$SortFieldEnumMap = {
  SortField.createdAt: 'createdAt',
  SortField.updatedAt: 'updatedAt',
  SortField.priority: 'priority',
  SortField.name: 'name',
  SortField.sortOrder: 'sortOrder',
};

const _$SortDirectionEnumMap = {
  SortDirection.ascending: 'ascending',
  SortDirection.descending: 'descending',
};
