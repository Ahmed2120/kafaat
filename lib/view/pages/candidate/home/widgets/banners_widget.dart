import 'package:carousel_slider/carousel_slider.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/dashboard_provider.dart';
import 'package:shimmer/shimmer.dart';

class BannersCarousel extends StatefulWidget {
  const BannersCarousel({super.key});

  @override
  State<BannersCarousel> createState() => _BannersCarouselState();
}

class _BannersCarouselState extends State<BannersCarousel> {
  var _current = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final dashboard = DashboardProvider.get(context);
    // print(dashboard.bannersModel!.banners![0].photo);
    return Column(
      children: [
        dashboard.bannersModel != null
            ? CarouselSlider.builder(
                carouselController: controller,
                itemCount: dashboard.bannersModel!.banners!.length,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 16,
                  viewportFraction: 1,
                  initialPage: _current,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                itemBuilder: (context, i, _) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // child: Image.asset(
                        //   getAsset('banner'),
                        //   fit: BoxFit.fill,
                        //   width: context.width,
                        // ),
                        child: Image.network(
                          '${AppStrings.siteUrl}storage/${dashboard.bannersModel!.banners![i].photo!}',
                          fit: BoxFit.fill,
                          width: context.width,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[200]!,
                                    period: const Duration(seconds: 3),
                                    child: Container(
                                      height: 170,
                                      width: context.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.yRedColor
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[200]!,
                              period: const Duration(seconds: 3),
                              child: Container(
                                height: 170,
                                width: context.width,
                                decoration: BoxDecoration(
                                  color: AppColors.yRedColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[200]!,
                period: const Duration(seconds: 3),
                child: Container(
                  height: 170,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: AppColors.yBodyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
      ],
    );
  }
}
