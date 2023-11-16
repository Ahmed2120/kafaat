import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/shortlisted_provider.dart';
import 'package:kafaat/view/pages/employer/shortlisted/widgets/shortlisted_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class ShortlistedPage extends StatefulWidget {
  const ShortlistedPage({super.key});

  @override
  State<ShortlistedPage> createState() => _ShortlistedPageState();
}

class _ShortlistedPageState extends State<ShortlistedPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ShortlistedProvider.listenFalse(context).shortlisted();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shortlists = ShortlistedProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Shortlisted'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextField(
                    hint: 'Search By Name',
                    prefixPath: 'search_icon',
                    onChanged: (value) async {
                      await shortlists.shortlisted(keyword: value!);
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: shortlists.shortlistedStatus == DataStatus.loading
                        ? const LoadingWidget()
                        : shortlists.shortlistedStatus == DataStatus.successed
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    ShortlistedItem(
                                  shortlisted: shortlists
                                      .shortlistedModel!.shortlists![i],
                                ),
                                itemCount: shortlists
                                    .shortlistedModel!.shortlists!.length,
                              )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
