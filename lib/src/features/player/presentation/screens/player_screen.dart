import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fplayer/src/core/config/constants/app_constants.dart';
import 'package:fplayer/src/core/extensions/context_extensions.dart';
import 'package:fplayer/src/core/extensions/int_extensions.dart';
import 'package:fplayer/src/core/presentation/blocs/selected_audio_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset('assets/music/07_starlit_night.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        context.read<SelectedAudioCubit>().unselect();
        context.pop();
      },
      child: Scaffold(
        body: BlocBuilder<SelectedAudioCubit, SelectedAudioState>(
          builder: (context, state) {
            if (state is SelectedState) {
              final audio = state.audioFileModel;
              final Uint8List cover = base64Decode(audio.cover);
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.memory(
                      cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      color: Colors.black.withAlpha(70.toAlpha()),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // appbar
                          SizedBox(
                            height: AppConstants.appBarHeight,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.chevron_down),
                                  padding: EdgeInsets.all(12),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.heart),
                                ),
                                const SizedBox(width: 8),
                                Expanded(child: const SizedBox()),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.ellipsis_vertical),
                                ),
                              ],
                            ),
                          ),

                          // cover
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            width: MediaQuery.of(context).size.width - 48,
                            height: MediaQuery.of(context).size.width - 48,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: MemoryImage(cover), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          // title
                          Text(
                            audio.title,
                            style: context.h5Bold()?.copyWith(color: context.text2()),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${audio.artist} - ${audio.album}',
                            style: context.h6Medium()?.copyWith(color: context.text6()),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Expanded(child: const SizedBox()),

                          // controller
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2, // ضخامت خط Slider
                              overlayShape: SliderComponentShape.noOverlay, // حذف افکت کلیک دایره‌ای
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), // اندازه دایره دسته
                              trackShape: const RectangularSliderTrackShape(), // شکل خط اسلایدر
                              // همچنین می‌تونی رنگ‌ها رو اینجا تغییر بدی
                            ),
                            child: Slider(
                              value: 0.4,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '0:03',
                                style: context.body2Medium()?.copyWith(color: context.text7()),
                                textAlign: TextAlign.start,
                              ),
                              Expanded(child: const SizedBox()),
                              Text(
                                '2:42',
                                style: context.body2Medium()?.copyWith(color: context.text7()),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.shuffle),
                                padding: const EdgeInsets.all(12),
                              ),


                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.backward_end, size: 32),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 12),
                                    height: 80,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(
                                      CupertinoIcons.play,
                                      color: context.text8(),
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.forward_end, size: 32),
                                  ),
                                ],
                              ),


                              IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.shuffle),
                                padding: const EdgeInsets.all(12),
                              ),
                            ],
                          ),

                          Expanded(child: const SizedBox()),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
