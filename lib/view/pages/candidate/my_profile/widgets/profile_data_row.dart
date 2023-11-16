import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/candidate_profile_model.dart';
import 'package:kafaat/view/widgets/data_cell_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

List<DataCell> educationDataRow(Education education) {
  return [
    DataCell(
      DataCellWidget(
        child: MainText(
          text: education.reward,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: education.location,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: education.from,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: education.to,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
  ];
}

List<DataCell> experienceDataRow(Experience experience) {
  return [
    DataCell(
      DataCellWidget(
        child: MainText(
          text: experience.position,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: experience.location,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: experience.from,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: experience.to,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
  ];
}

List<DataCell> awardDataRow(Award award) {
  return [
    DataCell(
      DataCellWidget(
        child: MainText(
          text: award.reward,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: award.location,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: award.from,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: award.to,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
  ];
}
