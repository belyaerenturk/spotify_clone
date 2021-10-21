import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectSong(Song track) {
    selected = track;
    notifyListeners();
  }
}
