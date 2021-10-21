import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildColumn(context);
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        buildRow(context),
        const SizedBox(height: 20.0),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
      children: [
        buildImage(),
        const SizedBox(width: 16.0),
        buildExpanded(context),
      ],
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: buildColumn2(context),
    );
  }

  Column buildColumn2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PLAYLIST",
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        ),
        const SizedBox(height: 12.0),
        Text(playlist.name, style: Theme.of(context).textTheme.headline2),
        const SizedBox(height: 16.0),
        Text(playlist.description,
            style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(height: 16.0),
        Text(
          'Created by ${playlist.creator} - ${playlist.songs.length} songs, ${playlist.duration}',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Image buildImage() {
    return Image.asset(
      playlist.imageURL,
      height: 200.0,
      width: 200.0,
      fit: BoxFit.cover,
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;

  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildRow(context);
  }

  Row buildRow(BuildContext context) {
    return Row(
      children: [
        buildTextButton(context),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          icon: Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          icon: Icon(Icons.more_horiz),
        ),
        const Spacer(),
        buildText(context),
      ],
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      'FOLLOWERS\n$followers',
      style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      textAlign: TextAlign.right,
    );
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Theme.of(context).accentColor,
        primary: Theme.of(context).iconTheme.color,
        textStyle: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontSize: 12.0, letterSpacing: 2.0),
      ),
      onPressed: () {},
      child: Text("PLAY"),
    );
  }
}
