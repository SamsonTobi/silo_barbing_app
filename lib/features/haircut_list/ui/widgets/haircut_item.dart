import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:silo_barbing_app/style_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HaircutItem extends StatefulWidget {
  final String haircutName;
  final double? haircutPrice;
  final String? description;
  final String? haircutImgUrl;

  const HaircutItem(
      {super.key,
      required this.haircutName,
      required this.haircutPrice,
      required this.description,
      required this.haircutImgUrl});

  @override
  State<HaircutItem> createState() => _HaircutItemState();
}

class _HaircutItemState extends State<HaircutItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1.0,
              color: AppColors.cardBorder,
              strokeAlign: BorderSide.strokeAlignInside)),
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl:
                    "https://api.timbu.cloud/images/${widget.haircutImgUrl}",
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 290,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.haircutName,
                            // overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '₦${widget.haircutPrice?.toInt()}',
                          style: const TextStyle(
                            fontFamily: 'Encode',
                            fontSize: 18,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.description ?? '',
                      style: const TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 16,
                        letterSpacing: -.2,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff000000),
                                    Color(0xff666666),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              border: Border.all(
                                  color: const Color(0xff1B1B1B),
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          child: const Text(
                            'Book this Haircut',
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
