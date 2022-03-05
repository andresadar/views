import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:testwidgets/screens/store/widgets/toggle.dart';

import '../../../models/store_model.dart';
import '../../../widgets/icon_button.dart';

class SliverAppBarStoreScreen extends StatefulWidget {
  const SliverAppBarStoreScreen(
      {Key? key, required this.pageController, required this.dotsPosition})
      : super(key: key);

  final PageController pageController;
  final double dotsPosition;

  @override
  State<SliverAppBarStoreScreen> createState() =>
      _SliverAppBarStoreScreenState();
}

class _SliverAppBarStoreScreenState extends State<SliverAppBarStoreScreen> {
  int _toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    const _bottomHeight = kToolbarHeight + 65;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green,
      // floating: true,
      pinned: true,
      elevation: 0,
      expandedHeight: 400,
      // snap: true,
      title: Row(
        children: [
          AppIconButton(
              icon: Icons.arrow_back, tooltip: 'Volver', onTap: () {}),
          const Spacer(),
          AppIconButton(icon: Icons.search, tooltip: 'Buscar', onTap: () {})
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: widget.pageController,
                itemCount: storeCurrent.banners?.length ?? 0,
                itemBuilder: ((context, index) {
                  return CachedNetworkImage(
                    imageUrl: storeCurrent.banners?[index] ?? '',
                    placeholder: (_, __) {
                      return Container(color: Colors.grey[200]);
                    },
                    fit: BoxFit.cover,
                    // color: Colors.grey[200],
                    errorWidget: (_, __, ___) {
                      return const Center(
                        child: Icon(Icons.restaurant, color: Colors.grey),
                      );
                    },
                  );
                }),
              ),
            ),
            Positioned(
                left: 10,
                right: 10,
                bottom: _bottomHeight,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      if (storeCurrent.rating != null)
                        Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.star,
                                    color: Colors.white, size: 15),
                              ),
                              TextSpan(
                                text: ' ${storeCurrent.rating}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white38,
                            ),
                            child: DotsIndicator(
                              dotsCount: storeCurrent.banners?.length ?? 0,
                              position: widget.dotsPosition,
                              decorator: const DotsDecorator(
                                  activeColor: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      AppIconButton(
                          icon: Icons.share_outlined,
                          tooltip: 'Compartir',
                          color: Colors.white,
                          size: 16,
                          onTap: () {}),
                      const SizedBox(width: 10),
                      AppIconButton(
                          icon: Icons.favorite_border,
                          tooltip: 'Favorito',
                          color: Colors.white,
                          size: 16,
                          onTap: () {})
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(_bottomHeight),
        child: Container(
          height: _bottomHeight,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: kToolbarHeight,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ToggleStoreScreen(
                          text: 'Para Consumir',
                          icon: Icons.restaurant,
                          myIndex: 0,
                          index: _toggleIndex,
                          onTap: () {
                            setState(() {
                              _toggleIndex = 0;
                            });
                          }),
                      ToggleStoreScreen(
                          text: 'Para Llevar',
                          icon: Icons.car_repair_outlined,
                          myIndex: 1,
                          index: _toggleIndex,
                          onTap: () {
                            setState(() {
                              _toggleIndex = 1;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  indicatorColor: Colors.green,
                  padding: const EdgeInsets.all(0),
                  tabs: List.generate(
                    storeCurrent.categories?.length ?? 0,
                    (index) => Text(
                      storeCurrent.categories![index],
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[900],
                  indicator: RectangularIndicator(
                    color: Colors.green,
                    verticalPadding: 0,
                    bottomLeftRadius: 100,
                    bottomRightRadius: 100,
                    topLeftRadius: 100,
                    topRightRadius: 100,
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
