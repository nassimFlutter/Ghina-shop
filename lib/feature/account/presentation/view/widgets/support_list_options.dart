import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/account/presentation/view/widgets/option_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportListOptions extends StatelessWidget {
  const SupportListOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.accountContainerDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          OptionItem(
              trailing: SvgPicture.asset(
                IconsPath.rightArrowIcon,
              ),
              title: "About Best price",
              iconPath: IconsPath.aboutIcon),
          OptionItem(
              trailing: SvgPicture.asset(
                IconsPath.rightArrowIcon,
              ),
              title: "Our Policies",
              iconPath: IconsPath.policiesIcon),
          OptionItem(
              trailing: SvgPicture.asset(
                IconsPath.rightArrowIcon,
              ),
              title: "Terms & Conditions",
              iconPath: IconsPath.policiesIcon),
          OptionItem(
              trailing: SvgPicture.asset(
                IconsPath.rightArrowIcon,
              ),
              title: "Contact Us",
              iconPath: IconsPath.contactIcon),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
