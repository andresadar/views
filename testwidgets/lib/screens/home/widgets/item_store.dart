import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/store_model.dart';
import '../../../theme/app_color.dart';

class ItemStore extends StatelessWidget {
  const ItemStore({Key? key, required this.store, this.onTap})
      : super(key: key);

  final Store store;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 140,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Left
            Expanded(
              child: FittedBox(
                child: Container(
                  margin: const EdgeInsets.all(0),
                  clipBehavior: Clip.antiAlias,
                  constraints: const BoxConstraints(
                      maxWidth: 60, maxHeight: 60, minWidth: 60, minHeight: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: store.img ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return const Icon(Icons.restaurant, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),

            //Center
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.tag}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${store.address}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(Icons.hourglass_bottom, size: 11),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                text: '${store.time} mnts.',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Right
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Rating
                    if (store.rating != null)
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                                child: Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                alignment: PlaceholderAlignment.middle),
                            TextSpan(
                              text: '${store.rating}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    //Promo
                    if (store.promo != null)
                      FittedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(Icons.percent_outlined,
                                      color: AppColors.primary, size: 18),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                text: '${store.promo}',
                                style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
