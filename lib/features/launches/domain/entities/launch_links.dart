// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LaunchLinks extends Equatable {
  final PatchLinks? patch;
  final RedditLinks? reddit;
  final FlickrLinks? flickr;
  final String? presskit; // nullable - default: null
  final String? webcast; // nullable - default: null
  final String? youtubeId; // nullable - default: null
  final String? article; // nullable - default: null
  final String? wikipedia; // nullable - default: null

  const LaunchLinks({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  @override
  List<Object?> get props => [
        patch,
        reddit,
        flickr,
        presskit,
        webcast,
        youtubeId,
        article,
        wikipedia,
      ];

  LaunchLinks copyWith({
    PatchLinks? patch,
    RedditLinks? reddit,
    FlickrLinks? flickr,
    String? presskit,
    String? webcast,
    String? youtubeId,
    String? article,
    String? wikipedia,
  }) {
    return LaunchLinks(
      patch: patch ?? this.patch,
      reddit: reddit ?? this.reddit,
      flickr: flickr ?? this.flickr,
      presskit: presskit ?? this.presskit,
      webcast: webcast ?? this.webcast,
      youtubeId: youtubeId ?? this.youtubeId,
      article: article ?? this.article,
      wikipedia: wikipedia ?? this.wikipedia,
    );
  }
}

class PatchLinks extends Equatable {
  final String? small; // nullable - default: null
  final String? large; // nullable - default: null

  const PatchLinks({
    this.small,
    this.large,
  });

  @override
  List<Object?> get props => [small, large];

  PatchLinks copyWith({
    String? small,
    String? large,
  }) {
    return PatchLinks(
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }
}

class RedditLinks extends Equatable {
  final String? campaign; // nullable - default: null
  final String? launch; // nullable - default: null
  final String? media; // nullable - default: null
  final String? recovery; // nullable - default: null

  const RedditLinks({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  @override
  List<Object?> get props => [campaign, launch, media, recovery];

  RedditLinks copyWith({
    String? campaign,
    String? launch,
    String? media,
    String? recovery,
  }) {
    return RedditLinks(
      campaign: campaign ?? this.campaign,
      launch: launch ?? this.launch,
      media: media ?? this.media,
      recovery: recovery ?? this.recovery,
    );
  }
}

class FlickrLinks extends Equatable {
  final List<String> small; // required - array of strings
  final List<String> original; // required - array of strings

  const FlickrLinks({
    required this.small,
    required this.original,
  });

  @override
  List<Object?> get props => [small, original];

  FlickrLinks copyWith({
    List<String>? small,
    List<String>? original,
  }) {
    return FlickrLinks(
      small: small ?? this.small,
      original: original ?? this.original,
    );
  }
}
