// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostState _$PostStateFromJson(Map<String, dynamic> json) => PostState(
      status: $enumDecode(_$PostStatusEnumMap, json['status']),
      likes: (json['likes'] as num).toInt(),
      likers: (json['likers'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      isOwner: json['isOwner'] as bool,
      likersInFollowings: (json['likersInFollowings'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowed: json['isFollowed'] as bool?,
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'status': _$PostStatusEnumMap[instance.status]!,
      'likes': instance.likes,
      'likers': instance.likers,
      'likersInFollowings': instance.likersInFollowings,
      'commentsCount': instance.commentsCount,
      'isLiked': instance.isLiked,
      'isOwner': instance.isOwner,
      'isFollowed': instance.isFollowed,
    };

const _$PostStatusEnumMap = {
  PostStatus.initial: 'initial',
  PostStatus.loading: 'loading',
  PostStatus.success: 'success',
  PostStatus.failure: 'failure',
};
