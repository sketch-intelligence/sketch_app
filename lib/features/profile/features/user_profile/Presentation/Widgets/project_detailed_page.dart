import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/chat/presentation/chat_screen.dart';
import 'package:sketch/features/chat/service/real_chat_service.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';
import 'package:sketch/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/accept_bid.dart';
import 'package:sketch/features/profile/features/user_profile/Presentation/views/profile_views.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/bids/bids.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class ProjectDetailsPage extends StatelessWidget {
  final UserProposedProjectModel project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackWidget(
              title: 'Project Details',
            ),
            SizedBox(
              height: 50.h,
            ),
            // Project Image
            // Center(
            //   child: SvgPicture.asset(
            //     project.i,
            //     height: screenHeight * 0.3,
            //     width: screenWidth * 0.4,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // SizedBox(height: screenHeight < 600 ? 16 : 24),
            // Project Title

            Text(
              project.title ?? '',
              style: AppTextStyle.getBoldStyle(
                fontSize: screenWidth < 350 ? 20 : 24,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 12),
            // Project Description
            Text(
              project.description,
              style: AppTextStyle.getRegularStyle(
                fontSize: screenWidth < 350 ? 14 : 16,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 22),
            Text(
              'Project Bids :',
              style: AppTextStyle.getBoldStyle(
                fontSize: screenWidth < 350 ? 20 : 24,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight < 600 ? 8 : 12),
            ProjectBidsList(
              projectId: project.id ?? 0,
              status: project.status,
            ),
          ],
        ),
      ),
    ));
  }
}

class ProjectBidsList extends StatelessWidget {
  final int projectId;
  String? status;

  Future<List<Bids>> getBids(int projectId) async {
    final Uri url = Uri.parse('${baseUrl}bids/project/$projectId');

    try {
      final response = await http
          .get(url, headers: {'Authorization': 'Bearer ${CacheHelper.token}'});

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ListBids.fromJson(jsonData).data ?? [];
      } else {
        throw Exception(
            "Failed to load bids. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching bids: $e");
    }
  }

  ProjectBidsList({super.key, required this.status, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bids>>(
      future: getBids(projectId), // Call the function to get bids
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No bids available'));
        } else {
          List<Bids> bids = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true, // Important for nesting inside Column
            physics:
                const NeverScrollableScrollPhysics(), // Avoid scrolling conflicts
            itemCount: bids.length,
            itemBuilder: (context, index) {
              return ArchBidDto(
                  bidDto: bids[index],
                  fuid: bids[index].architect?.fireStoreId ?? '',
                  pid: projectId,
                  status: status!); // Display each bid
            },
          );
        }
      },
    );
  }
}

class PortfolioProjectDetailsPage extends StatelessWidget {
  final PortfolioProjectModel project;

  const PortfolioProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Project Details",
          style: AppTextStyle.getBoldStyle(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth < 350 ? 12.0 : 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              // Center(
              //   child: SvgPicture.asset(
              //     project.i,
              //     height: screenHeight * 0.3,
              //     width: screenWidth * 0.4,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // SizedBox(height: screenHeight < 600 ? 16 : 24),
              // Project Title
              Center(
                child: Text(
                  project.title ?? '',
                  style: AppTextStyle.getBoldStyle(
                    fontSize: screenWidth < 350 ? 20 : 24,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight < 600 ? 8 : 12),
              // Project Description
              Text(
                project.description ?? '',
                style: AppTextStyle.getRegularStyle(
                  fontSize: screenWidth < 350 ? 14 : 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ArchBidDto extends StatelessWidget {
  ArchBidDto({
    super.key,
    required this.status,
    required this.fuid,
    required this.bidDto,
    required this.pid,
  });
  Bids bidDto;
  final int pid;
  String status;
  final String fuid;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    userId: bidDto.architect!.id ?? 0,
                                  )),
                        );
                      },
                      child: bidDto.architect!.imageUrl != null
                          ? GetModel(
                              useCaseCallBack: () {
                                return GetImageUseCase(
                                        homeRepository: HomeRepository())
                                    .call(
                                  params: GetImageParams(
                                    imageName: bidDto.architect!.imageUrl!,
                                  ),
                                );
                              },
                              onSuccess: (ImageModel image) {},
                              errorWidget: Icon(Icons.image_not_supported,
                                  size: 50, color: Colors.grey),
                              modelBuilder: (ImageModel model) {
                                return CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.grey,
                                  child: ClipOval(
                                    child: CacheHelper.profileImageUrl!
                                            .endsWith('.svg')
                                        ? SvgPicture.memory(model.imageData)
                                        : Image.memory(
                                            model.imageData,
                                          ),
                                  ),
                                );
                              },
                            )
                          : CircleAvatar(
                              radius: 26,
                              foregroundImage:
                                  const NetworkImage(dummyProfileImage),
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: Image.network(
                                  dummyProfileImage,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(bidDto.architect!.name ?? 'no name')
                  ],
                ),
                status == 'closed'
                    ? CreateModel(
                        child: CustomButton(
                          text: 'Accept',
                          h: 30,
                          w: 75,
                        ),
                        withValidation: false,
                        useCaseCallBack: (m) {
                          return AcceptBid(
                                  profileRepository: ProfileRepository())
                              .call(
                                  params: AcceptParams(
                                      bid: bidDto.id,
                                      pid: pid,
                                      uid: CacheHelper.userID));
                        },
                        onSuccess: (s) async {
                          Dialogs.showSnackBar(
                              message: "Bid Accepted success",
                              context: context);
                          ChatService _chatService = ChatService();
                          print(
                              'is the id ${FirebaseAuth.instance.currentUser!.uid}');
                          print('is the idddd ${fuid}');
                          String chatId = await _chatService.getOrCreateChat(
                            FirebaseAuth.instance.currentUser!.uid,
                            fuid,
                          );

                          if (chatId.isNotEmpty) {
                            GoRouter.of(context).push(AppRouter.kChatScreen,
                                extra:
                                    ChatChat(chatId: chatId, receiverId: fuid));
                          } else {
                            print("🚨 Failed to create or retrieve chat");
                          }
                        },
                        onError: (s) {
                          Dialogs.showErrorSnackBar(
                              message: s, context: context);
                        },
                      )
                    : CustomButton(
                        text: 'Accept',
                        h: 30,
                        w: 75,
                        textStyle:
                            AppTextStyle.getLightStyle(color: Colors.grey),
                      )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text('Price : '),
                Text('${bidDto.price.toString()}\$'),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text('Expected durations :'),
                Text('${bidDto.expectedDuration.toString()} months'),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text('Description : '),
                Text(
                  bidDto.description ?? "no description",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
