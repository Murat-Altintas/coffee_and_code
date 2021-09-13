import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainOptionsPage extends StatelessWidget {
  const MainOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Change language:',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 12),
              Theme(
                data: ThemeData.dark(),
                child: Container(
                  color: Colors.grey.shade500,
                  child: SimpleLangPicker(
                    onSelected: (locale) {
                      Get.updateLocale(locale);
                    },
                    selected: Get.locale,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
