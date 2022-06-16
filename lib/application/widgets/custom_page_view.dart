import 'package:flutter/material.dart';

/// The custom pager that I use on various page of my app.
class CustomPageView extends StatefulWidget {
  final List<Widget> pages;
  final List<String> pagesNames;

  const CustomPageView({super.key, required this.pages, required this.pagesNames});

  @override
  State<StatefulWidget> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController pageController = PageController(initialPage: 0, viewportFraction: 1);
  late final int currentPage = pageController.initialPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildHeader(currentPage),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: widget.pages.length,
            controller: pageController,
            itemBuilder: onItemBuilder,
            onPageChanged: onPageChange,
            physics: const ClampingScrollPhysics(),
          ),
        )
      ],
    );
  }

  List<Widget> buildHeader(int index) {
    return widget.pagesNames.map((pageName) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          pageName,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      );
    }).toList();
  }

  Widget onItemBuilder(BuildContext context, int index) {
    return widget.pages[index];
  }

  onPageChange(int index) {}
}
