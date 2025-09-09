import '../../domain/entities/launch_links.dart';

class LaunchLinksModel extends LaunchLinks {
  const LaunchLinksModel({
    super.patch,
    super.reddit,
    super.flickr,
    super.presskit,
    super.webcast,
    super.youtubeId,
    super.article,
    super.wikipedia,
  });

  factory LaunchLinksModel.fromJson(Map<String, dynamic> json) {
    return LaunchLinksModel(
      patch: json['patch'] != null
          ? PatchLinksModel.fromJson(json['patch'])
          : null,
      reddit: json['reddit'] != null
          ? RedditLinksModel.fromJson(json['reddit'])
          : null,
      flickr: json['flickr'] != null
          ? FlickrLinksModel.fromJson(json['flickr'])
          : null,
      presskit: json['presskit'],
      webcast: json['webcast'],
      youtubeId: json['youtube_id'],
      article: json['article'],
      wikipedia: json['wikipedia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patch': patch != null && patch is PatchLinksModel
          ? (patch as PatchLinksModel).toJson()
          : null,
      'reddit': reddit != null && reddit is RedditLinksModel
          ? (reddit as RedditLinksModel).toJson()
          : null,
      'flickr': flickr != null && flickr is FlickrLinksModel
          ? (flickr as FlickrLinksModel).toJson()
          : null,
      'presskit': presskit,
      'webcast': webcast,
      'youtube_id': youtubeId,
      'article': article,
      'wikipedia': wikipedia,
    };
  }
}

class PatchLinksModel extends PatchLinks {
  const PatchLinksModel({
    super.small,
    super.large,
  });

  factory PatchLinksModel.fromJson(Map<String, dynamic> json) {
    return PatchLinksModel(
      small: json['small'],
      large: json['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'large': large,
    };
  }
}

class RedditLinksModel extends RedditLinks {
  const RedditLinksModel({
    super.campaign,
    super.launch,
    super.media,
    super.recovery,
  });

  factory RedditLinksModel.fromJson(Map<String, dynamic> json) {
    return RedditLinksModel(
      campaign: json['campaign'],
      launch: json['launch'],
      media: json['media'],
      recovery: json['recovery'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'campaign': campaign,
      'launch': launch,
      'media': media,
      'recovery': recovery,
    };
  }
}

class FlickrLinksModel extends FlickrLinks {
  const FlickrLinksModel({
    required super.small,
    required super.original,
  });

  factory FlickrLinksModel.fromJson(Map<String, dynamic> json) {
    return FlickrLinksModel(
      small: List<String>.from(json['small'] ?? []),
      original: List<String>.from(json['original'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'original': original,
    };
  }
}
