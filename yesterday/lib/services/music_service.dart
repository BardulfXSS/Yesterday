import 'dart:collection';

import 'package:yesterday/models/models.dart';

abstract class MusicService<T> {
  Future<MusicData> getMusic(T user);
}

// TODO: Implement a real MusicService and test it
class PlaceholderMusicService<T> implements MusicService<T> {
  final albums = [
    Album((b) => b
      ..name = 'Sgt. Pepper’s Lonely Hearts Club Band'
      ..artist.name = 'The Beatles'
      ..coverArtUrl =
          'https://www.rollingstone.com/wp-content/uploads/2018/06/sgt-peppers-e4860c12-4da1-4e6d-bb86-81698a88dbde.jpg'
      ..tracks.addAll([
        Song((b) => b
          ..title = 'Sgt. Pepper’s Lonely Hearts Club Band'
          ..duration = Duration(minutes: 2, seconds: 2)),
        Song((b) => b
          ..title = 'With A Little Help From My Friends'
          ..duration = Duration(minutes: 2, seconds: 44)),
        Song((b) => b
          ..title = 'Lucy In The Sky With Diamonds'
          ..duration = Duration(minutes: 3, seconds: 28)),
        Song((b) => b
          ..title = 'Getting Better'
          ..duration = Duration(minutes: 2, seconds: 48)),
        Song((b) => b
          ..title = 'Fixing A Hole'
          ..duration = Duration(minutes: 2, seconds: 36)),
        Song((b) => b
          ..title = "She's Leaving Home"
          ..duration = Duration(minutes: 3, seconds: 35)),
        Song((b) => b
          ..title = "Being For The Benefit Of Mr. Kite!"
          ..duration = Duration(minutes: 2, seconds: 37)),
        Song((b) => b
          ..title = "Within You Without You"
          ..duration = Duration(minutes: 5, seconds: 4)),
        Song((b) => b
          ..title = "When I'm Sixty Four"
          ..duration = Duration(minutes: 2, seconds: 37)),
        Song((b) => b
          ..title = "Lovely Rita"
          ..duration = Duration(minutes: 2, seconds: 42)),
        Song((b) => b
          ..title = "Good Morning Good Morning"
          ..duration = Duration(minutes: 2, seconds: 41)),
        Song((b) => b
          ..title = "Sgt. Pepper's Lonely Hearts Club Band (Reprise)"
          ..duration = Duration(minutes: 1, seconds: 20)),
        Song((b) => b
          ..title = "A Day In The Life"
          ..duration = Duration(minutes: 5, seconds: 12)),
      ])),
    Album((b) => b
      ..name = 'Pet Sounds'
      ..artist.name = 'The Beach Boys'
      ..coverArtUrl =
          'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-136791-eafbc592120358b4d3d14cda5acebf62ae50a522.jpg'
      ..tracks.addAll([
        Song((b) => b
          ..title = "Wouldn't It Be Nice"
          ..duration = Duration(minutes: 2, seconds: 32)),
        Song((b) => b
          ..title = "You Still Believe In Me"
          ..duration = Duration(minutes: 2, seconds: 37)),
        Song((b) => b
          ..title = "That's Not Me"
          ..duration = Duration(minutes: 2, seconds: 31)),
        Song((b) => b
          ..title = "Don't Talk (Put Your Head On My Shoulders)"
          ..duration = Duration(minutes: 2, seconds: 58)),
        Song((b) => b
          ..title = "I'm Waiting for the Day"
          ..duration = Duration(minutes: 3, seconds: 4)),
        Song((b) => b
          ..title = "Let's Go Away For A While"
          ..duration = Duration(minutes: 2, seconds: 24)),
        Song((b) => b
          ..title = "Sloop John B"
          ..duration = Duration(minutes: 2, seconds: 53)),
        Song((b) => b
          ..title = "God Only Knows"
          ..duration = Duration(minutes: 2, seconds: 54)),
        Song((b) => b
          ..title = "I Know There's an Answer"
          ..duration = Duration(minutes: 3, seconds: 9)),
        Song((b) => b
          ..title = "Here Today"
          ..duration = Duration(minutes: 2, seconds: 52)),
        Song((b) => b
          ..title = "I Just Wasn't Made for These Times"
          ..duration = Duration(minutes: 3, seconds: 21)),
        Song((b) => b
          ..title = "Pet Sounds"
          ..duration = Duration(minutes: 2, seconds: 34)),
        Song((b) => b
          ..title = "Caroline No"
          ..duration = Duration(minutes: 2, seconds: 16)),
      ])),
    Album((b) => b
      ..name = 'Abbey Road'
      ..artist.name = 'The Beatles'
      ..coverArtUrl =
          'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-136803-0921fbfa76c66953268f4bdeee9410ef7ef02536.jpg'
      ..tracks.addAll([
        Song((b) => b
          ..title = 'Come Together'
          ..duration = Duration(minutes: 4, seconds: 18)),
        Song((b) => b
          ..title = 'Golden Slumbers / Carry That Weight'
          ..duration = Duration(minutes: 5, seconds: 15)),
        Song((b) => b
          ..title = 'Old Brown Shoe'
          ..duration = Duration(minutes: 3, seconds: 21)),
        Song((b) => b
          ..title = 'The Long One'
          ..duration = Duration(minutes: 16, seconds: 10)),
        Song((b) => b
          ..title = 'Come and Get It'
          ..duration = Duration(minutes: 2, seconds: 30)),
        Song((b) => b
          ..title = 'Because (Take 1 / Instrumental)'
          ..duration = Duration(minutes: 3, seconds: 7)),
        Song((b) => b
          ..title = 'Goodbye (Home Demo)'
          ..duration = Duration(minutes: 2, seconds: 23)),
        Song((b) => b
          ..title = 'Oh! Darling'
          ..duration = Duration(minutes: 3, seconds: 28)),
        Song((b) => b
          ..title = 'Abbey Road (documentary)'
          ..duration = Duration(minutes: 3, seconds: 51)),
      ])),
    Album((b) => b
      ..name = 'Nevermind'
      ..artist.name = 'Nirvana'
      ..coverArtUrl =
          'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-136806-21ccd83b5593ecaed7b7b09b5bcfa2aed935b208.jpg'
      ..tracks.addAll([
        Song((b) => b
          ..title = 'Smells Like Teen Spirit'
          ..duration = Duration(minutes: 4, seconds: 38)),
        Song((b) => b
          ..title = 'In Bloom (Nevermind Version)'
          ..duration = Duration(minutes: 4, seconds: 59)),
        Song((b) => b
          ..title = 'Come As You Are'
          ..duration = Duration(minutes: 3, seconds: 45)),
        Song((b) => b
          ..title = 'Breed'
          ..duration = Duration(minutes: 3)),
        Song((b) => b
          ..title = 'Lithium'
          ..duration = Duration(minutes: 3, seconds: 15)),
        Song((b) => b
          ..title = 'Polly'
          ..duration = Duration(minutes: 3, seconds: 47)),
        Song((b) => b
          ..title = 'Territorial Pissings'
          ..duration = Duration(minutes: 2, seconds: 31)),
        Song((b) => b
          ..title = 'Drain You'
          ..duration = Duration(minutes: 3, seconds: 45)),
        Song((b) => b
          ..title = 'Lounge Act'
          ..duration = Duration(minutes: 2, seconds: 39)),
        Song((b) => b
          ..title = 'Stay Away'
          ..duration = Duration(minutes: 3, seconds: 42)),
        Song((b) => b
          ..title = 'On A Plain'
          ..duration = Duration(minutes: 3, seconds: 41)),
        Song((b) => b
          ..title = 'Something In The Way'
          ..duration = Duration(minutes: 8, seconds: 1)),
        Song((b) => b
          ..title = 'Endless, Nameless'
          ..duration = Duration(minutes: 12, seconds: 37)),
        Song((b) => b
          ..title = 'Even In His Youth (B-Side)'
          ..duration = Duration(minutes: 3, seconds: 7)),
        Song((b) => b
          ..title = 'Aneurysm (B-Side)'
          ..duration = Duration(minutes: 4, seconds: 45)),
        Song((b) => b
          ..title = 'Curmudgeon (B-Side)'
          ..duration = Duration(minutes: 2, seconds: 57)),
      ])),
    Album((b) => b
      ..name = 'Hotel California'
      ..artist.name = 'The Eagles'
      ..coverArtUrl =
          'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-136826-c1cb2fd484afdaff16cb9f5c0a397c120ff3f74a.jpg'
      ..tracks.addAll([
        // TODO: Add tracks
      ])),
  ];

  @override
  Future<MusicData> getMusic(T user) async {
    final artists = LinkedHashSet<Artist>.from(albums
        .where((a) => a.artist != null)
        .map((a) => a.artist)
        .map((a) => a.rebuild((b) => b
          ..albums.addAll(
            albums.where((a2) => a2.artist?.name == a.name),
          )))).toList();
    final playlists = [
      Playlist((b) => b..name = 'Empty'),
      Playlist((b) => b
        ..name = '1 Album'
        ..songs.addAll(
          albums.first.tracks.map((s) => s.rebuild((b) => b
            ..artist.replace(albums.first.artist)
            ..album.replace(albums.first))),
        )),
      Playlist((b) => b
        ..name = '<4 Albums'
        ..songs.addAll(albums.take(3).expand(
              (a) => a.tracks.map((s) => s.rebuild(
                    (b) => b..artist.replace(a.artist)..album.replace(a),
                  )),
            ))),
      Playlist((b) => b
        ..name = '4 Albums'
        ..songs.addAll(albums.take(4).expand(
              (a) => a.tracks.map((s) => s.rebuild(
                    (b) => b..artist.replace(a.artist)..album.replace(a),
                  )),
            ))),
      Playlist((b) => b
        ..name = '>4 Albums'
        ..songs.addAll(albums.expand(
          (a) => a.tracks.map((s) => s.rebuild(
                (b) => b..artist.replace(a.artist)..album.replace(a),
              )),
        ))),
    ];
    final songs = albums.expand((a) => a.tracks.map((s) => s.rebuild(
          (b) => b..artist.replace(a.artist)..album.replace(a),
        )));
    return MusicData((b) => b
      ..artists.addAll(artists)
      ..playlists.addAll(playlists)
      ..songs.addAll(songs));
  }
}
