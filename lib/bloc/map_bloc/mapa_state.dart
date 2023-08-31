part of 'mapa_bloc.dart';

class MapaState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;

  const MapaState({this.isMapInitialized = false, this.followUser = false});

  MapaState copyWith({
    bool? isMapInitialized,
    bool? followUser,
  }) =>
      MapaState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        followUser: followUser ?? this.followUser,
      );

  @override
  List<Object> get props => [isMapInitialized, followUser];
}
