import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/shortlisted_model.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class ShortlistedItem extends StatelessWidget {
  const ShortlistedItem({Key? key, required this.shortlisted})
      : super(key: key);
  final Shortlisted shortlisted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: AppColors.yWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.yBlackColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(
                text: shortlisted.candidat!.title,
                font: 16,
                weight: FontWeight.bold,
              ),
              Image.asset(
                getAsset('download_icon'),
                height: 24,
                width: 24,
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Image.asset(getAsset('pdf_icon'), height: 45, width: 45),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text:
                        '${shortlisted.candidat?.cvs?[0].media?.fileName} - ${shortlisted.candidat?.user?.name ?? ''}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    font: 14,
                    color: AppColors.yDarkColor,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 4),
                  MainText(
                    text:
                        '${shortlisted.candidat!.cvs![0].media!.fileSize ?? 0} Kb   ${(shortlisted.candidat?.cvs?[0].media?.createdAt) ?? ''} ',
                    font: 14,
                    color: AppColors.yBodyColor,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
