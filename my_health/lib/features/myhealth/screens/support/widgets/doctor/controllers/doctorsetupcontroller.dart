import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/doctorrepository/doctorrepository.dart';
import 'package:my_health/data/repositories/userRepository/userRepository.dart';
import 'package:my_health/doctornavigation.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/DoctorReviewModel.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/Doctormodel.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class DoctorSetupController extends GetxController {
  static DoctorSetupController get instance => Get.find();
  final pagecontroller = PageController();
  final _userrepository = Get.put(UserRepository());
  final _doctorRepository = Get.put(DoctorRepository());

  Rx<int> currentPage = 0.obs;

  RxBool isnextbuttonenabled = false.obs;
  final Rx<DoctorModel> doctor = DoctorModel(
    appointments: [],
    id: "",
    specialization: "",
    qualifications: [],
    experience: 0,
    address: AddressModel(street: "", city: "", state: "", country: ""),
    reviews: [],
    averageRating: 0.0,
    schedules: [],
  ).obs;

  @override
  void onReady() {
    fetchingDoctorData();
    checkUserHaveAnImage();
  }

  void checkUserHaveAnImage() async {
    try {
      final usermodel = await _userrepository.fetchUserData();
      if (usermodel.profilePicture.isNotEmpty) {
        isnextbuttonenabled.value = true;
      }
    } catch (e) {
      Loaders.errorSnackbar(title: 'Oh snap', message: e.toString());
    }
  }

  void fetchingDoctorData() async {
    try {
      final data = await _doctorRepository.fetchDoctorData();
      doctor(data);
    } catch (e) {
      Loaders.errorSnackbar(title: 'Oh snap', message: e.toString());
    }
  }

  // update current index when page scroll

  void updatePageindicator(index) {
    currentPage.value = index;
  }

  // jumb to a specific dot selected page

  void nextPage() async {
    if (currentPage.value == 3) {
      final Map<String, dynamic> issetupaccount = {'IsAccountSetup': true};
      await _doctorRepository.updateSingleDoctorField(issetupaccount);
      Get.offAll(() => const DoctorNavigationMenu());
    }
    final page = currentPage.value + 1;
    pagecontroller.jumpToPage(page);
  }

  // Main controller

// 1. Saving the address
// this is where we start saving the doctorModel
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final addressformkey = GlobalKey<FormState>();

  Future<void> saveAddress() async {
    try {
      // loading the loader

      TfullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImagestring.processing);
// Check connectivity
      final isConnected = await NetworkManager.instance.isconnected();

      if (!isConnected) return;

// Form Validation
      if (!addressformkey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }

// creating the address
      final address = AddressModel(
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim());

// finding the userid
      final userid = AuthentificationRepository.instance.authUser?.uid;
      final doctor = DoctorModel(
        appointments: [],
        id: userid!,
        specialization: "",
        qualifications: [],
        experience: 0,
        address: address,
        reviews: [],
        averageRating: 0.0,
        schedules: [],
      );

      await _doctorRepository.saveDoctor(doctor);
      isnextbuttonenabled.value = true;

// Remove the loader
      TfullScreenLoader.stoploading();

// Display the success message after saving the user

// Uploading the doctor

      Loaders.successSnackbar(
          title: "Congratulations.",
          message: "Your address was added successfully.");

// Enable the nextButton
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: 'Oh snap', message: e.toString());
    }
  }

// Saving the qualifications

  final qualification1 = TextEditingController();
  final qualification2 = TextEditingController();
  final qualification3 = TextEditingController();
  final qualification4 = TextEditingController();

  final qualificationformkey = GlobalKey<FormState>();

  // save qualification function
  Future<void> saveQualification() async {
    try {
      // loading the loader

      TfullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImagestring.processing);
// Check connectivity
      final isConnected = await NetworkManager.instance.isconnected();

      if (!isConnected) return;

// Form Validation
      if (!addressformkey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }
      final qualification1Text = qualification1.text.trim();
      final qualification2Text = qualification2.text.trim();
      final qualification3Text = qualification3.text.trim();
      final qualification4Text = qualification4.text.trim();

      var finalQualifications = [];

      if (qualification1Text != "") {
        finalQualifications.add(qualification1Text);
      }

      if (qualification2Text != "") {
        finalQualifications.add(qualification2Text);
      }

      if (qualification3Text != "") {
        finalQualifications.add(qualification3Text);
      }

      if (qualification4Text != "") {
        finalQualifications.add(qualification4Text);
      }

// creating the address

      final Map<String, dynamic> query = {
        "qualifications": finalQualifications
      };

      await _doctorRepository.updateSingleDoctorField(query);
      isnextbuttonenabled.value = true;

// Remove the loader
      TfullScreenLoader.stoploading();

// Display the success message after saving the user

// Uploading the doctor

      Loaders.successSnackbar(
          title: "Congratulations.",
          message: "Your address was added successfully.");

// Enable the nextButton
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: 'Oh snap', message: e.toString());
    }
  }

  // dealing with the Available schedule
  final RxBool value = RxBool(false);

  final RxList<ScheduleModel> schedule = [
    ScheduleModel(day: "Mon", fromTime: "", toTime: ""),
    ScheduleModel(day: "Tue", fromTime: "", toTime: ""),
    ScheduleModel(day: "Wed", fromTime: "", toTime: ""),
    ScheduleModel(day: "Thu", fromTime: "", toTime: ""),
    ScheduleModel(day: "Fri", fromTime: "", toTime: ""),
    ScheduleModel(day: "Sat", fromTime: "", toTime: ""),
    ScheduleModel(day: "Sun", fromTime: "", toTime: ""),
  ].obs;

  Future<void> selectTime(BuildContext context, int index, bool isFrom) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      String period = picked.period == DayPeriod.am ? 'AM' : 'PM';
      String selectedTime = '${picked.hourOfPeriod}:${picked.minute} $period';

      // Get a mutable copy of the item
      ScheduleModel currentDay = schedule[index].clone();

      // Update the schedule for the selected day and time type (from or to)
      isFrom
          ? currentDay.fromTime = selectedTime
          : currentDay.toTime = selectedTime;

      // Update the schedule list in the controller
      schedule[index] = currentDay;
    }
  }

  // Example method to update availability
  void updateAvailability(String day, bool isAvailable) {
    ScheduleModel currentDay = schedule.firstWhere(
      (model) => model.day == day,
      orElse: () => ScheduleModel(day: day, fromTime: "", toTime: ""),
    );

    // If the day is set as unavailable, reset the working hours
    if (!isAvailable) {
      currentDay.fromTime = "";
      currentDay.toTime = "";
    }

    // Update the schedule list in the controller
    schedule[schedule.indexWhere((model) => model.day == day)] = currentDay;
  }

  // Example method to reset time slots to default state
  void resetTimeSlots(String day) {
    ScheduleModel currentDay = schedule.firstWhere(
      (model) => model.day == day,
      orElse: () => ScheduleModel(day: day, fromTime: "", toTime: ""),
    );

    // Reset the time slots to default state
    currentDay.fromTime = "";
    currentDay.toTime = "";

    // Update the schedule list in the controller
    schedule[schedule.indexWhere((model) => model.day == day)] = currentDay;
  }

  //================= SAVING THE SCHEDULE

  Future<void> saveSchedule() async {
    try {
      // loading the loader

      TfullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImagestring.processing);
// Check connectivity
      final isConnected = await NetworkManager.instance.isconnected();

      if (!isConnected) return;

      final List<Map<String, dynamic>> scheduleMaps =
          schedule.map((scheduleModel) => scheduleModel.toMap()).toList();

      final Map<String, dynamic> query = {'schedules': scheduleMaps};

      await _doctorRepository.updateSingleDoctorField(query);

      await _doctorRepository.updateSingleDoctorField(query);
      isnextbuttonenabled.value = true;

// Remove the loader
      TfullScreenLoader.stoploading();

// Display the success message after saving the user

// Uploading the doctor

      Loaders.successSnackbar(
          title: "Congratulations.",
          message: "Your address was added successfully.");

// Enable the nextButton
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: 'Oh snap', message: e.toString());
    }
  }
}
