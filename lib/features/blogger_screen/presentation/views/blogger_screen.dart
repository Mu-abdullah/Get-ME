import 'package:flutter/material.dart';

import '../../../../core/style/statics/image_test.dart';
import '../refactor/blogger_sliver_app_bar.dart';
import '../refactor/blogger_social_count.dart';

class BloggerScreen extends StatelessWidget {
  const BloggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BloggerSliverAppBar(imageUrl: ImageTest.bloger, name: 'Blogger Name'),
          BloggerSocialCount(),
        ],
      ),
    );
  }
}
