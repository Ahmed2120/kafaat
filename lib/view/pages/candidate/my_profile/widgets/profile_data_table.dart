
import 'package:kafaat/core/core_exports.dart';

class ProfileDataTable extends StatefulWidget {
  const ProfileDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  State<ProfileDataTable> createState() => _ProfileDataTableState();
}

class _ProfileDataTableState extends State<ProfileDataTable> {
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 200,
      child: Scrollbar(
        controller: _controllerOne,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _controllerOne,
          child: Scrollbar(
            controller: _controllerTwo,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controllerTwo,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: DataTable(
                  horizontalMargin: 4,
                  columnSpacing: 20,
                  showBottomBorder: false,
                  dividerThickness: 0,
                  columns: widget.columns,
                  rows: widget.rows,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
