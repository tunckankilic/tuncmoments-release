// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentState _$CommentStateFromJson(Map<String, dynamic> json) => CommentState(
      status: $enumDecode(_$CommentStatusEnumMap, json['status']),
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      isOwner: json['isOwner'] as bool,
      isLikedByOwner: json['isLikedByOwner'] as bool,
      repliedComments: (json['repliedComments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentStateToJson(CommentState instance) =>
    <String, dynamic>{
      'status': _$CommentStatusEnumMap[instance.status]!,
      'repliedComments': instance.repliedComments,
      'likes': instance.likes,
      'comments': instance.comments,
      'isLiked': instance.isLiked,
      'isOwner': instance.isOwner,
      'isLikedByOwner': instance.isLikedByOwner,
    };

const _$CommentStatusEnumMap = {
  CommentStatus.initial: 'initial',
  CommentStatus.loading: 'loading',
  CommentStatus.success: 'success',
  CommentStatus.failure: 'failure',
};
