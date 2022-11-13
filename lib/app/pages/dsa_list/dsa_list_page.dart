import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/config/context_extension.dart';

class DsaListPage extends StatelessWidget {
  /// default constructor
  const DsaListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: context.widthPx,
          height: 50,
          margin: const EdgeInsets.all(8),
          color: Colors.red,
        ),
      ),
    );
  }
}

// array: FaIcon(FontAwesomeIcons.ellipsis),
// stack: FaIcon(FontAwesomeIcons.layerGroup),
// linked: FaIcon(FontAwesomeIcons.link),
// string: FaIcon(FontAwesomeIcons.font),
// binary-tree: FaIcon(FontAwesomeIcons.networkWired),
// binary-search: FaIcon(FontAwesomeIcons.magnifyingGlass),
// graph: FaIcon(FontAwesomeIcons.connectdevelop),
// hash: FaIcon(FontAwesomeIcons.hashtag),
// dynamic: FaIcon(FontAwesomeIcons.chartSimple),
// heap: FaIcon(FontAwesomeIcons.grip),
// recursion: FaIcon(FontAwesomeIcons.repeat),
// math: FaIcon(FontAwesomeIcons.plusMinus),
// trie: FaIcon(FontAwesomeIcons.diceTwo),
// sort: FaIcon(FontAwesomeIcons.arrowUpRightDots),