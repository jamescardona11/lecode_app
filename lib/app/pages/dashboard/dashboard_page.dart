import 'package:flutter/material.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_state.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lepath_app/app/widgets/round_container.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/core/core.dart';

class DashboardPage
    extends MvvMProviderWidget<DashboardViewModel, DashboardState> {
  /// default constructor
  const DashboardPage({
    super.key,
  });

  @override
  DashboardViewModel get viewModelBuilder => getIt<DashboardViewModel>();

  @override
  Widget buildWidget(BuildContext context, DashboardState state) {
    return Scaffold(
      body: SafeArea(
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
              Container(
                width: context.widthPx,
                height: context.heightPct(40),
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      RoundContainer(
                        width: constraints.maxWidth / 2,
                        color: Colors.red,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: RoundContainer(
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: RoundContainer(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'In progress',
                style: Theme.of(context).textTheme.headline6,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: RoundContainer(
                      width: context.widthPx,
                      height: 70,
                      border: 10,
                      color: Colors.blue,
                    ),
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
