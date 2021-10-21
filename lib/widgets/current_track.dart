import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildContainer(context);
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      padding: const EdgeInsets.all(12.0),
      child: buildRow(context),
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
      children: [
        _TrackInfo(),
        const Spacer(),
        _PlayerControls(),
        const Spacer(),
        if (MediaQuery.of(context).size.width > 800) _MoreControls(),
      ],
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return SizedBox.shrink();
    return buildRowTrackInfo(selected, context);
  }

  Row buildRowTrackInfo(Song selected, BuildContext context) {
    return Row(
      children: [
        buildImage(),
        const SizedBox(width: 12.0),
        buildColumn(selected, context),
        const SizedBox(width: 12.0),
        buildIconButton(),
      ],
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.favorite_border),
    );
  }

  Column buildColumn(Song selected, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          selected.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 4.0),
        Text(
          selected.artist,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey.shade300,
                fontSize: 12.0,
              ),
        ),
      ],
    );
  }

  Image buildImage() {
    return Image.asset(
      'assets/lofigirl.jpg',
      height: 60.0,
      width: 60.0,
      fit: BoxFit.cover,
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return buildColumnPlayerControls(context, selected);
  }

  Column buildColumnPlayerControls(BuildContext context, Song? selected) {
    return Column(
      children: [
        buildRowPlayerControls(),
        const SizedBox(height: 4.0),
        buildRowPlayerControlsTime(context, selected),
      ],
    );
  }

  Row buildRowPlayerControlsTime(BuildContext context, Song? selected) {
    return Row(
      children: [
        buildText(context),
        const SizedBox(width: 8.0),
        buildContainer(context),
        const SizedBox(width: 8.0),
        buildTextTimeDuration(selected, context),
      ],
    );
  }

  Text buildTextTimeDuration(Song? selected, BuildContext context) {
    return Text(
      selected?.duration ?? "0:00",
      style: Theme.of(context).textTheme.caption,
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: 5.0,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }

  Text buildText(BuildContext context) =>
      Text("0:00", style: Theme.of(context).textTheme.caption);

  Row buildRowPlayerControls() {
    return Row(
      children: [
        PlayerControlRowIconButton(size: 20.0, iconData: Icons.shuffle),
        PlayerControlRowIconButton(
            size: 20.0, iconData: Icons.skip_previous_outlined),
        PlayerControlRowIconButton(
            size: 34.0, iconData: Icons.play_circle_outline),
        PlayerControlRowIconButton(
            size: 20.0, iconData: Icons.skip_next_outlined),
        PlayerControlRowIconButton(size: 20.0, iconData: Icons.repeat),
      ],
    );
  }
}

class PlayerControlRowIconButton extends StatelessWidget {
  final double size;
  final IconData iconData;

  const PlayerControlRowIconButton({
    Key? key,
    required this.size,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(),
      iconSize: size,
      icon: Icon(iconData),
      onPressed: () {},
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.fullscreen_outlined),
        )
      ],
    );
  }
}
