import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildContainer(context);
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        buildRow(),
        _SizeMenuIconTab(
          iconData: Icons.home,
          title: "Home",
          onTap: () {},
        ),
        _SizeMenuIconTab(
          iconData: Icons.search,
          title: "Search",
          onTap: () {},
        ),
        _SizeMenuIconTab(
          iconData: Icons.audiotrack,
          title: "Radio",
          onTap: () {},
        ),
        const SizedBox(height: 12.0),
        _LibraryPlaylists(),
      ],
    );
  }

  Row buildRow() {
    return Row(
      children: [
        buildPadding(),
      ],
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildImage(),
    );
  }

  Image buildImage() {
    return Image.asset(
      "assets/spotify_logo.png",
      height: 55.0,
      filterQuality: FilterQuality.high,
    );
  }
}

class _SizeMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SizeMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildListTile(context);
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
      leading: buildIcon(context),
      title: buildText(context),
      onTap: onTap,
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Icon buildIcon(BuildContext context) {
    return Icon(
      iconData,
      color: Theme.of(context).iconTheme.color,
      size: 28.0,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({Key? key}) : super(key: key);

  @override
  _LibraryPlaylistsState createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<_LibraryPlaylists> {
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
    return buildExpanded(context);
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: buildScrollbar(context),
    );
  }

  Scrollbar buildScrollbar(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      physics: const ClampingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                "YOUR LIBRARY",
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ...yourLibrary
                .map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                  ),
                )
                .toList(),
          ],
        ),
        const SizedBox(
          height: 14.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                "PLAYLISTS",
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ...playlists
                .map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
