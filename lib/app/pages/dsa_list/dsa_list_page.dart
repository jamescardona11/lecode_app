import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/core/core.dart';
import 'package:drip/drip.dart';

class DsaListPage extends BaseWidget<DsaListViewModel, DsaListState> {
  /// default constructor
  const DsaListPage({
    super.key,
  });

  @override
  DsaListViewModel get viewModelBuilder => getIt<DsaListViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaListViewModel viewModel) {
    return Scaffold(
      body: _DsaListPage(),
    );
  }
}

class _DsaListPage extends StatelessWidget {
  /// default constructor
  const _DsaListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Grind 75 questions'),
          GestureDetector(
            onTap: () {
              context.read<DsaListViewModel>().readDsaExercises();
            },
            child: Text(
                'Customize LeetCode study plans according to your needs. You are recommended to work on the questions in order'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: context.widthPx,
                height: 50,
                margin: const EdgeInsets.all(8),
                color: Colors.red,
              ),
            ),
          ),
        ],
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