import 'package:flutter/material.dart';
import 'package:gympal/common/extension.dart';
import '../common/Color.dart';

class SelectDateTime extends StatelessWidget {
  final DateTime? selectDate;
  final String title;
  final Function(DateTime) didChange;

  const SelectDateTime({
    super.key,
    required this.title,
    required this.didChange,
    this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.primary, // Header background color
                  onPrimary: Colors.white, // Header text color
                  onSurface: AppColor.secondaryText, // Body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primary, // Button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          didChange(pickedDate);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: media.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColor.secondaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              selectDate == null
                  ? "Select Date"
                  : selectDate!.stringFormat(format: "MMM dd, yyyy"),
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
