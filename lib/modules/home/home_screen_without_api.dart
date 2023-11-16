import 'package:flutter/material.dart';

class HomeScreenWithoutApi extends StatefulWidget {
  @override
  State<HomeScreenWithoutApi> createState() => _HomeScreenWithoutApiState();
}

class _HomeScreenWithoutApiState extends State<HomeScreenWithoutApi> {
  ScrollController controller = ScrollController();
  List<String> peopleImages = [
    'assets/images/image.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
    'assets/images/image_4.jpg',
    'assets/images/image_5.jpg',
    'assets/images/image.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
    'assets/images/image_4.jpg',
    'assets/images/image_5.jpg',
  ];

  Future refresh() async {
    setState(() {
      peopleImages = [
        'assets/images/image.jpg',
        'assets/images/image_2.jpg',
        'assets/images/image_3.jpg',
        'assets/images/image_4.jpg',
        'assets/images/image_5.jpg',
      ];
    });
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    peopleImages.addAll([
      'assets/images/image.jpg',
      'assets/images/image_2.jpg',
      'assets/images/image_3.jpg',
      'assets/images/image_4.jpg',
      'assets/images/image_5.jpg',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: GridView.count(
                  controller: controller,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(
                    peopleImages.length + 1,
                    (index) {
                      if (index < peopleImages.length) {
                        final images = peopleImages[index];
                        return Image.asset(
                          images,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
