import 'package:flutter/material.dart';
import '../common/Color.dart';

class SelectPicker extends StatelessWidget {
  final String? selectVal;
  final String title;
  final List<String> allVal;
  final Function(String) didChange;

  const SelectPicker({
    super.key,
    required this.title,
    required this.allVal,
    required this.didChange,
    this.selectVal,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 250,
              color: AppColor.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: AppColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allVal.length,
                      itemExtent: 40,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            allVal[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () {
                            didChange(allVal[index]);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
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
              selectVal ?? "Select",
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
