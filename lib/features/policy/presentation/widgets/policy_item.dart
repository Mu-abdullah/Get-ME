import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/style/widgets/custom_shimmer.dart';

import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/services/translate_services.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../data/model/plicy_model.dart';

class PolicyItem extends StatefulWidget {
  final PolicyModel policy;
  final int index;
  final String sourceLanguage; // Source language of the policy content

  const PolicyItem({
    super.key,
    required this.policy,
    required this.index,
    this.sourceLanguage = 'auto', // Default to auto-detect
  });

  @override
  State<PolicyItem> createState() => _PolicyItemState();
}

class _PolicyItemState extends State<PolicyItem> {
  String _translatedTitle = '';
  String? _translatedSubTitle;
  String _translatedBody = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _translateContent();
  }

  Future<void> _translateContent() async {
    final currentLanguage = context.read<LanguageCubit>().state;

    if (widget.sourceLanguage != currentLanguage) {
      try {
        final translatedTitle = await TranslationService.translateText(
          widget.policy.title!,
          currentLanguage,
          sourceLanguage: widget.sourceLanguage,
        );
        final translatedBody = await TranslationService.translateText(
          widget.policy.body!,
          currentLanguage,
          sourceLanguage: widget.sourceLanguage,
        );
        final translatedSubTitle = widget.policy.subTitle != null
            ? await TranslationService.translateText(
                widget.policy.subTitle!,
                currentLanguage,
                sourceLanguage: widget.sourceLanguage,
              )
            : null;

        if (mounted) {
          setState(() {
            _translatedTitle = translatedTitle;
            _translatedSubTitle = translatedSubTitle;
            _translatedBody = translatedBody;
            _isLoading = false;
          });
        }
      } catch (e) {
        // Fallback to original text if translation fails
        if (mounted) {
          setState(() {
            _translatedTitle = widget.policy.title!;
            _translatedSubTitle = widget.policy.subTitle;
            _translatedBody = widget.policy.body!;
            _isLoading = false;
          });
        }
      }
    } else {
      // No translation needed, use original text
      setState(() {
        _translatedTitle = widget.policy.title!;
        _translatedSubTitle = widget.policy.subTitle;
        _translatedBody = widget.policy.body!;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return CustomShimmer(
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackground.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          "${widget.index + 1}. $_translatedTitle:",
          maxLines: 5,
          color: AppColors.black,
          isTitle: true,
        ),
        _translatedSubTitle == null
            ? const SizedBox()
            : AppText(
                _translatedSubTitle!,
                maxLines: 5,
                color: AppColors.black.withValues(alpha: 0.8),
              ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppText(
            _translatedBody,
            color: AppColors.black.withValues(alpha: 0.6),
            maxLines: 10,
            height: 2,
          ),
        ),
      ],
    );
  }
}
