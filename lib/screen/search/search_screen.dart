import 'package:flutter/material.dart';
import 'package:music_apps/model/itunes_store.dart';
import 'package:provider/provider.dart';

import 'search_provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/';

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).initialize();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Consumer<SearchProvider>(
          builder: (_, provider, __) => Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey[800],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey[600],
                      ),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.transparent,
                        ),
                        child: TextField(
                          cursorColor: Colors.green,
                          cursorHeight: 20,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          controller: provider.searchController,
                          onChanged: provider.onSearch,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: provider.searchData.isEmpty
                        ? Center(
                            child: Text(
                              'Play what you love',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            addAutomaticKeepAlives: true,
                            itemCount: provider.searchData.length,
                            itemBuilder: (_, index) => _ArtistContainer(
                              scaffoldKey: scaffoldKey,
                              data: provider.searchData[index],
                              onSelected: provider.onSelected,
                            ),
                          ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _ExpandedSection(
                  expand: provider.isSelected,
                  child: provider.selectedMusic == null
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey[800],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () => null,
                                    icon: Icon(
                                      Icons.skip_previous_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (provider.selectedMusic.isPlay)
                                    IconButton(
                                      onPressed: () => provider
                                          .onPause(provider.selectedMusic),
                                      icon: Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                      ),
                                    ),
                                  if (provider.selectedMusic.isPause)
                                    IconButton(
                                      onPressed: () => provider
                                          .onPlay(provider.selectedMusic),
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                  IconButton(
                                    onPressed: () => null,
                                    icon: Icon(
                                      Icons.skip_next_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                provider.selectedMusic.trackName,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ArtistContainer extends StatefulWidget {
  final ItunesStore data;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueChanged<ItunesStore> onSelected;

  const _ArtistContainer(
      {Key key, this.data, this.scaffoldKey, this.onSelected})
      : super(key: key);

  @override
  __ArtistContainerState createState() => __ArtistContainerState();
}

class __ArtistContainerState extends State<_ArtistContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(widget.scaffoldKey.currentContext)
            .requestFocus(new FocusNode());

        widget.onSelected(widget.data);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.data.artworkUrl100),
                backgroundColor: Colors.transparent),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.trackName,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.data.artistName,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    widget.data.collectionName,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            if (widget.data.isPlay)
              Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
              ),
            if (widget.data.isPause)
              Icon(
                Icons.pause,
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  _ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<_ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(_ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
