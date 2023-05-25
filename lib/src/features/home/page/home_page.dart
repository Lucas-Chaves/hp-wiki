import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt<HomeBloc>()..add(HomeEventInit()),
      child: DefaultCustomStructure(
        background: const Color(0XffCDBE94),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return const Center(child: DefaultLoadingHouses());
            }
            if (state is HomeStateError) {
              return const Center(child: Text('Error'));
            }
            if (state is HomeStateLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/logo/${state.filteredHouse.name.toLowerCase()}.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: List<Widget>.generate(
                          state.houses.length,
                          (index) => ChoiceChip(
                            label: Text(state.houses[index].name),
                            onSelected: (selectedContent) =>
                                context.read<HomeBloc>().add(
                                      HomeEventFilter(
                                          idFilter: state.houses[index].id),
                                    ),
                            selected: state.houses[index].id ==
                                state.filteredHouse.id,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.transparent),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Heads House',
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      const Divider(color: Colors.transparent),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.filteredHouse.heads.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: CustomPaint(
                                    painter: MyPainter(
                                      isLast: state.filteredHouse.heads.length -
                                              1 ==
                                          index,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 15),
                                      child: Text(
                                          "${state.filteredHouse.heads[index].firstName} ${state.filteredHouse.heads[index].lastName}"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final bool isLast;

  MyPainter({this.isLast = false});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0, 8), 5, Paint());
    if (!isLast) {
      canvas.drawLine(const Offset(0, 15), const Offset(0, 30), Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
