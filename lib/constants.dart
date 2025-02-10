import 'package:sketch/core/classes/cashe_helper.dart';

const dummyProfileImage =
    'https://staging-api.rentchicken.net/storage/images/profile.jpg';

bool? isUser = CacheHelper.userInfo != null
    ? CacheHelper.userInfo!.user!.roles!.elementAt(0).name == 'USER'
    : null;
