import 'package:banner_carousel/banner_carousel.dart';
import 'package:computify/components/search_bar.dart';
import 'package:computify/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SearchBarWidget(your_text: "Search for products..."),
        ),
        // Carousel
        BannerCarousel(
          banners: listBanners,
          customizedIndicators: const IndicatorModel.animation(
              width: 15, height: 5, spaceBetween: 2, widthAnimation: 50),
          height: 120,
          activeColor: Colors.amberAccent,
          disableColor: Colors.white,
          animation: true,
          borderRadius: 10,
          width: screenWidth,
          indicatorBottom: false,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All categories",
                style: textTheme.bodyLarge,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categoriesImg.length,
                    (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                  width: 70,
                                  child: Image.asset(categoriesImg[index])),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                categoriesNames[index],
                                style: textTheme.labelMedium,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
