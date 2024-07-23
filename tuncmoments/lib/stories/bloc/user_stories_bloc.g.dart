// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stories_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoriesState _$UserStoriesStateFromJson(Map<String, dynamic> json) =>
    UserStoriesState(
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      stories: (json['stories'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
      showStories: json['showStories'] as bool,
    );

Map<String, dynamic> _$UserStoriesStateToJson(UserStoriesState instance) =>
    <String, dynamic>{
      'author': instance.author,
      'stories': instance.stories,
      'showStories': instance.showStories,
    };
