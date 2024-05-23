// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_group_and_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionGroupAndPickOptions _$OptionGroupAndPickOptionsFromJson(
        Map<String, dynamic> json) =>
    OptionGroupAndPickOptions(
      optionGroup:
          OptionGroup.fromJson(json['optionGroup'] as Map<String, dynamic>),
      pickOptions: (json['pickOptions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$OptionGroupAndPickOptionsToJson(
        OptionGroupAndPickOptions instance) =>
    <String, dynamic>{
      'optionGroup': instance.optionGroup,
      'pickOptions': instance.pickOptions.toList(),
    };
