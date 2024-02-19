import 'package:vrikka/onboarding/onboarding_info.dart';
import 'package:vrikka/utils/constants/image_strings.dart';
import 'package:vrikka/utils/constants/text_strings.dart';

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: VrikkaTexts.onBoardingTitle1,
        description: VrikkaTexts.onBoardingSubTitle1,
        image: VrikkaImages.onBoardingImage1),
    OnBoardingInfo(
      title: VrikkaTexts.onBoardingTitle2,
      description: VrikkaTexts.onBoardingSubTitle2,
      image: VrikkaImages.onBoardingImage2,
    ),
    OnBoardingInfo(
      title: VrikkaTexts.onBoardingTitle3,
      description: VrikkaTexts.onBoardingSubTitle3,
      image: VrikkaImages.onBoardingImage3,
    ),
  ];
}
