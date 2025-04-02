import 'package:flutter/material.dart';

import '../../data/model/plicy_model.dart';
import 'policy_item.dart';

class PolicyListview extends StatelessWidget {
  const PolicyListview({
    super.key,
    required this.policyList,
  });
  final List<PolicyModel> policyList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: policyList.length,
      itemBuilder: (context, index) {
        final policy = policyList[index];
        return PolicyItem(policy: policy, index: index);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 30,
        child: const Divider(),
      ),
    );
  }
}
