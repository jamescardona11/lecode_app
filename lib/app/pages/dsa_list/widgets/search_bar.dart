import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: AppColors.primary,
              focusedBorder: _border(AppColors.primary),
              border: _border(AppColors.lightGrey),
              enabledBorder: _border(AppColors.lightGrey),
              hintText: 'Search problems or topics',
              hintStyle:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppColors.grey3,
              ),
              suffixIcon: InkWell(
                child: Icon(
                  FontAwesomeIcons.sliders,
                  color: AppColors.grey3,
                ),
              ),
            ),
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
            onFieldSubmitted: (value) {},
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
