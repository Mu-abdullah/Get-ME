import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../widgets/social_count.dart';

class BloggerSocialCount extends StatelessWidget {
  const BloggerSocialCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Row(
            children: [
              SocialIcon(
                icon: HugeIcons.strokeRoundedFacebook01,
                count: '1000',
              ),
              SocialIcon(
                icon: HugeIcons.strokeRoundedInstagram,
                count: '1000',
              ),
              SocialIcon(
                icon: HugeIcons.strokeRoundedTiktok,
                count: '1000',
              ),
            ],
          ),
        )
      ],
    ));
  }
}
