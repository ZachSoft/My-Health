import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/content/addresscontent.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/content/imagecontent.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/content/qualificationcontent.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/content/workingschedule.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/singlepagesetup.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class DoctorSetupAccountScreen extends StatelessWidget {
  const DoctorSetupAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctorsetupcontroller = Get.put(DoctorSetupController());
    return Scaffold(
      appBar: TappBar(
        title: Text('Account setup',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w800)),
      ),
      body: PageView(
        controller: doctorsetupcontroller.pagecontroller,
        onPageChanged: doctorsetupcontroller.updatePageindicator,
        children: const [
          SingleViewPageSetup(
            title: "Add a profile picture",
            stepnumber: "1",
            content: ImageContentDoctorSetup(),
            subtitle:
                "Ensure a standout presence on MyHealth by adding a captivating profile picture. Your image is the first impression users will have across the app. Click to upload your photo now for enhanced visibility and connection",
          ),
          SingleViewPageSetup(
            subtitle:
                "Maximize your visibility on MyHealth by adding your practice address. Patients rely on accurate location details for appointments. Click to include your address now, ensuring seamless connections with those seeking your expertise",
            title: "Add your address",
            stepnumber: "2",
            content: AddressContentDoctorSetup(),
          ),
          SingleViewPageSetup(
            subtitle:
                "Highlight your expertise on MyHealth by adding your qualifications.",
            title: "Add your Qualifications",
            stepnumber: "3",
            content: QualificationContentDoctorSetupAccount(),
          ),
          SingleViewPageSetup(
            subtitle:
                "Choose your working schedule now for a more efficient and well-coordinated practice.",
            title: "Add your working schedule",
            stepnumber: "4",
            content: WorkingScheduleDoctor(),
          ),
        ],
      ),
    );
  }
}
