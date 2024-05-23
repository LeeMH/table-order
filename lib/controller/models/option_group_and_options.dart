import 'package:json_annotation/json_annotation.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';

part 'option_group_and_options.g.dart';

@JsonSerializable()
class OptionGroupAndPickOptions {
  OptionGroup optionGroup;
  Set<Option> pickOptions;

  OptionGroup getOptionGroup() => optionGroup;
  Set<Option> getPickOptions() => pickOptions;

  OptionGroupAndPickOptions({
    required this.optionGroup,
    required this.pickOptions,
  });

  factory OptionGroupAndPickOptions.fromJson(Map<String, dynamic> json) =>
      _$OptionGroupAndPickOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionGroupAndPickOptionsToJson(this);
}
