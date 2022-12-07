class Song {
  final String title;
  final String description;
  final String url;

  Song(
      {required this.title,
        required this.description,
        required this.url,});

  static List<Song> songs = [
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/happy.mp3',
    ),
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/please.mp3',
    ),
    Song(
      title: 'Chill Song',
      description: 'Chill song',
      url: 'assets/audio/drop_it.mp3',
    ),
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/africa.mp3',
    ),
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/calm.mp3',
    ),
    
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/inspire.mp3',
    ),
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/mountain_path.mp3',
    ),
    Song(
      title: 'Cool Songs',
      description: 'Cool songs',
      url: 'assets/audio/passion-127011.mp3',
    )
  ];
}
