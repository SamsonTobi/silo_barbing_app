import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silo_barbing_app/features/haircut_list/bloc/haircuts_bloc.dart';
import 'package:silo_barbing_app/features/haircut_list/ui/widgets/error_card.dart';
import 'package:silo_barbing_app/features/haircut_list/ui/widgets/haircut_item.dart';
import 'package:silo_barbing_app/features/haircut_list/ui/widgets/skeleton_list_item.dart';
import 'package:silo_barbing_app/style_constants.dart';

class HaircutsPage extends StatefulWidget {
  const HaircutsPage({super.key});

  @override
  State<HaircutsPage> createState() => _HaircutsPageState();
}

class _HaircutsPageState extends State<HaircutsPage> {
  final HaircutsBloc haircutsBloc = HaircutsBloc();

  @override
  void initState() {
    super.initState();
    haircutsBloc.add(HaircutsInitialFetchEvent());
  }

  Future<void> _refresh() async {
    haircutsBloc.add(HaircutsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.skeltonColor,
        body: Stack(
          children: [
            Image.asset(
              'images/app-bg.png',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/barb-icon.png',
                        height: 35,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        'Discover Your Next Haircut',
                        style: TextStyle(
                            fontFamily: 'Encode',
                            fontSize: 32,
                            color: AppColors.textBlack),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Expert styles, personalized for you.',
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          fontSize: 16,
                          letterSpacing: -.2,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: BlocConsumer<HaircutsBloc, HaircutsState>(
                      bloc: haircutsBloc,
                      listenWhen: (previous, current) =>
                          current is HaircutsActionState,
                      buildWhen: (previous, current) =>
                          current is! HaircutsActionState,
                      listener: (context, state) {},
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case HaircutsFetchingLoadingState:
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, bottom: 18.0),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return const SkeletonListItem();
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 16,
                                    );
                                  },
                                  itemCount: 3),
                            );
                          case HaircutsFetchedState:
                            final succesState = state as HaircutsFetchedState;
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18.0,),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: succesState.haircuts.length,
                                itemBuilder: (context, index) {
                                  return HaircutItem(
                                      haircutName:
                                          succesState.haircuts[index].name,
                                      haircutPrice: succesState
                                          .haircuts[index].currentPrice,
                                      description: succesState
                                          .haircuts[index].description,
                                      haircutImgUrl: succesState
                                          .haircuts[index].photoUrl);
                                }),
                          );
                          default:
                            return Center(child: ErrorCard(onTap: _refresh));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
