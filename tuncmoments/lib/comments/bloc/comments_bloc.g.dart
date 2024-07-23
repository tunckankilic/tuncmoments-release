// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsState _$CommentsStateFromJson(Map<String, dynamic> json) =>
    CommentsState(
      status: $enumDecode(_$CommentsStatusEnumMap, json['status']),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsStateToJson(CommentsState instance) =>
    <String, dynamic>{
      'status': _$CommentsStatusEnumMap[instance.status]!,
      'comments': instance.comments,
    };

const _$CommentsStatusEnumMap = {
  CommentsStatus.initial: 'initial',
  CommentsStatus.populated: 'populated',
  CommentsStatus.error: 'error',
};
