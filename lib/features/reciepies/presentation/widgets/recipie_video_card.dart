import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../domain/entities/recipie.dart';

class RecipieVideoCard extends StatefulWidget {
  final Recipie recipie;
  const RecipieVideoCard({super.key, required this.recipie});

  @override
  State<RecipieVideoCard> createState() => _RecipieVideoCardState();
}

class _RecipieVideoCardState extends State<RecipieVideoCard> {
  late YoutubePlayerController youtubeController;

  @override
  void initState() {
    final url = widget.recipie.videoLink;

    youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url!)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          hideThumbnail: false,
          hideControls: false,
          loop: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: kSecondaryBorderRaduis,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                  actionsPadding: kDefaultPadding,
                  progressColors: ProgressBarColors(
                      playedColor: AppColorsLight.kAppPrimaryColorLight,
                      backgroundColor: Colors.grey.shade300,
                      handleColor: AppColorsLight.kAppPrimaryColorLight),
                  controller: youtubeController,
                  width: Get.width),
              builder: (context, player) {
                return player;
              },
            ),
          ),
          Positioned(
            top: 30.h,
            right: 30.w,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColorsLight.kAppPrimaryColorLight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
