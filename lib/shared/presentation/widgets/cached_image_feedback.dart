import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class CachedImageLoading extends StatelessWidget {
  const CachedImageLoading({this.progress, super.key});

  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassProgressIndicator.circular(
        value: progress,
        size: 32,
        useOwnLayer: true,
      ),
    );
  }
}

class CachedImageError extends StatelessWidget {
  const CachedImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.exclamationmark_circle,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
        size: 32,
      ),
    );
  }
}

Widget buildCachedImageLoading(
  BuildContext context,
  String url,
  DownloadProgress progress,
) {
  return CachedImageLoading(progress: progress.progress);
}

Widget buildCachedImageError(
  BuildContext context,
  String url,
  Object error,
) {
  return const CachedImageError();
}
