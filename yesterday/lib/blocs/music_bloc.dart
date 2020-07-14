import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/foundation.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/services/services.dart';

part 'music_bloc.g.dart';

// TODO: Test
class MusicBloc<T> extends Bloc<MusicEvent, MusicState> {
  final T user;
  final MusicService musicService;

  MusicBloc({@required this.user, @required this.musicService});

  @override
  MusicState get initialState => MusicInitial();

  @override
  Stream<MusicState> mapEventToState(MusicEvent event) async* {
    if (event is GetMusic) {
      yield* mapGetMusicToState(event);
    }
  }

  Stream<MusicState> mapGetMusicToState(GetMusic event) async* {
    yield MusicLoading();
    try {
      final data = await musicService.getMusic(user);
      if (data != null) {
        yield MusicHasData((b) => b.data.replace(data));
      } else {
        yield MusicFailure((b) => b.message = 'Something weird happened');
      }
    } catch (e) {
      yield MusicFailure((b) => b.message =
          e.message ?? 'An error occurred while getting music data');
    }
  }
}

abstract class MusicEvent {}

abstract class GetMusic
    implements Built<GetMusic, GetMusicBuilder>, MusicEvent {
  @nullable
  String get query;

  GetMusic._();
  factory GetMusic([void Function(GetMusicBuilder) updates]) = _$GetMusic;
}

abstract class MusicState {}

abstract class MusicInitial
    implements Built<MusicInitial, MusicInitialBuilder>, MusicState {
  MusicInitial._();
  factory MusicInitial([void Function(MusicInitialBuilder) updates]) =
      _$MusicInitial;
}

abstract class MusicLoading
    implements Built<MusicLoading, MusicLoadingBuilder>, MusicState {
  MusicLoading._();
  factory MusicLoading([void Function(MusicLoadingBuilder) updates]) =
      _$MusicLoading;
}

abstract class MusicHasData
    implements Built<MusicHasData, MusicHasDataBuilder>, MusicState {
  MusicData get data;

  MusicHasData._();
  factory MusicHasData([void Function(MusicHasDataBuilder) updates]) =
      _$MusicHasData;
}

abstract class MusicFailure
    implements Built<MusicFailure, MusicFailureBuilder>, MusicState {
  String get message;
  MusicFailure._();
  factory MusicFailure([void Function(MusicFailureBuilder) updates]) =
      _$MusicFailure;
}
