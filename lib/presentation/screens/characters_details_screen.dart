import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final int index;
  final CharactersModel charactersModel;
  const CharactersDetailsScreen({
    Key? key,
    required this.index,
    required this.charactersModel,
  }) : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          charactersModel.results![index].name!,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
        background: Hero(
          tag: charactersModel.results![index].id!,
          child: Image.network(
            charactersModel.results![index].image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
            ),
          ),
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: AppColors.yellow,
      height: 4.h,
      endIndent: endIndent, //width
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (charactersModel.results![index].status! != "unknown")
                        characterInfo('status :  ',
                            charactersModel.results![index].status!),
                      if (charactersModel.results![index].status! != "unknown")
                        buildDivider(75.w),
                      characterInfo('species :  ',
                          charactersModel.results![index].species!),
                      buildDivider(70.w),
                      characterInfo('gender :  ',
                          charactersModel.results![index].gender!),
                      buildDivider(70.w),
                      characterInfo('location :  ',
                          charactersModel.results![index].location!.name!),
                      buildDivider(70.w),
                      characterInfo('created :  ',
                          charactersModel.results![index].created!),
                      buildDivider(70.w),
                      if (charactersModel.results![index].origin!.name! !=
                          "unknown")
                        characterInfo('origin :  ',
                            charactersModel.results![index].origin!.name!),
                      if (charactersModel.results![index].origin!.name! !=
                          "unknown")
                        buildDivider(70.w),
                      if (charactersModel.results![index].type! != "")
                        characterInfo(
                            'type :  ', charactersModel.results![index].type!),
                      if (charactersModel.results![index].type! != "")
                        buildDivider(80.w),
                      SizedBox(
                        height: 5.h,
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FlickerAnimatedText(
                              charactersModel.results![index].name!,
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.white,
                                  shadows: const [
                                    Shadow(
                                        blurRadius: 7,
                                        color: AppColors.yellow,
                                        offset: Offset(0, 0))
                                  ])),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
