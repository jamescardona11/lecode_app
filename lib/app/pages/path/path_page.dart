import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lepath_app/app/widgets/round_container.dart';

class PathPage extends StatelessWidget {
  /// default constructor
  const PathPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello there 🖐',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 20),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  itemCount: 10,
                  itemBuilder: (context, index) => RoundContainer(
                    height: index % 2 == 0 ? 250 : 300,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
