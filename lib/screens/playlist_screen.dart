import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/widgets/playlist_header.dart';
import 'package:spotify_clone/widgets/tracks_list.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: buildBoxDecoration(context),
      child: buildScrollbar(),
    );
  }

  Scrollbar buildScrollbar() {
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 60.0,
      ),
      children: [
        PlaylistHeader(playlist: widget.playlist),
        TracksList(tracks: widget.playlist.songs),
      ],
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: buildLinearGradient(context),
    );
  }

  LinearGradient buildLinearGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xffaf1018),
        Theme.of(context).backgroundColor,
      ],
      stops: const [0, 0.3],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 140.0,
      leading: buildPadding(),
      actions: [
        buildTextButton(context),
        const SizedBox(height: 8.0),
        buildIconButton(),
        const SizedBox(width: 20.0),
      ],
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      padding: const EdgeInsets.only(),
      onPressed: () {},
      icon: const Icon(Icons.keyboard_arrow_down, size: 30.0),
    );
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        primary: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.account_circle_outlined,
        size: 30.0,
      ),
      label: const Text("Souma"),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: buildRow(),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _playlistScreenAppBarButton(
          iconData: Icons.chevron_left,
          size: 28.0,
        ),
        SizedBox(width: 16.0),
        _playlistScreenAppBarButton(iconData: Icons.chevron_right, size: 28.0),
      ],
    );
  }
}

// ignore: camel_case_types
class _playlistScreenAppBarButton extends StatelessWidget {
  final IconData iconData;
  final double size;

  const _playlistScreenAppBarButton({
    Key? key,
    required this.iconData,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildInkWell();
  }

  InkWell buildInkWell() {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
      child: buildIcon(),
    );
  }

  Icon buildIcon() {
    return Icon(
      iconData,
      size: size,
    );
  }
}
