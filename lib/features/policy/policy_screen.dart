import 'package:flutter/material.dart';

import '../../core/extextions/extentions.dart';
import '../../core/style/widgets/app_button.dart';
import '../../core/entities/custom_app_bar.dart';
import '../../core/language/lang_keys.dart';
import '../../core/style/color/color_light.dart';
import '../../core/style/widgets/app_text.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = context.translate(LangKeys.appName);
    return Scaffold(
      appBar: CustomAppBar(
        LangKeys.policy,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, appName: appName),
              _customSpace(),
              _buildSection(
                title: '1. المعلومات التي نجمعها',
                content: [
                  'عند استخدامكم لتطبيق "نبته"، قد نجمع الأنواع التالية من المعلومات:',
                  '- المعلومات الشخصية: مثل الاسم، عنوان البريد الإلكتروني، رقم الهاتف، العناوين.',
                  // '- معلومات الجهاز: مثل نوع الجهاز، نظام التشغيل، وعنوان IP.',
                  // '- معلومات الاستخدام: مثل الصفحات التي تزورونها والمنتجات التي تبحثون عنها.',
                ],
              ),
              _customSpace(),
              _buildSection(
                title: '2. كيفية استخدام المعلومات',
                content: [
                  'نستخدم المعلومات التي نجمعها للأغراض التالية:',
                  '- توفير خدمات التطبيق، مثل معالجة الطلبات وإدارة الحسابات.',
                  '- تحسين تجربة المستخدم وتقديم عروض مخصصة.',
                  '- حماية التطبيق من الأنشطة غير المصرح بها.',
                ],
              ),
              _customSpace(),
              _buildSection(
                title: '3. مشاركة المعلومات',
                content: [
                  'نحن لا نبيع أو نؤجر معلوماتكم الشخصية لأطراف ثالثة. ومع ذلك، قد نشارك المعلومات مع:',
                  // '- مقدمي الخدمات: مثل شركات الشحن وشركات الدفع.',
                  '- الجهات القانونية: في حال طلب منا ذلك.',
                ],
              ),
              _customSpace(),
              _buildSection(
                title: '4. حقوقكم',
                content: [
                  'لديكم الحق في الوصول إلى معلوماتكم الشخصية، طلب تصحيحها، أو حذفها. يمكنكم أيضًا إلغاء الاشتراك في الرسائل التسويقية في أي وقت.',
                ],
              ),
              _customSpace(),
              _buildSection(
                title: '5. التغييرات على سياسة الخصوصية',
                content: [
                  'قد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. يُرجى مراجعة هذه الصفحة بشكل دوري للاطلاع على أي تغييرات.',
                ],
              ),
              _customSpace(),
              _buildSection(
                title: '6. اتصل بنا',
                content: [
                  'إذا كانت لديكم أي أسئلة أو استفسارات حول سياسة الخصوصية، يُرجى الاتصال بنا عبر:',
                  '- البريد الإلكتروني: support@$appName.com',
                ],
              ),
              _customSpace(),
              AppButton(
                text: LangKeys.acceptPolicy,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customSpace({double height = 36}) {
    return SizedBox(height: height);
  }

  // بناء العنوان الرئيسي
  Widget _buildHeader(BuildContext context, {required String appName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'سياسة الخصوصية لتطبيق "$appName"',
          isTitle: true,
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: customTextStyle(context),
            children: [
              TextSpan(
                text: 'مرحبًا بكم في تطبيق ',
                style: customTextStyle(context, isBold: false, isTitle: false),
              ),
              TextSpan(
                text: '"$appName"',
                style: customTextStyle(context, color: ColorsLight.gray),
              ),
              TextSpan(
                text:
                    '، منصة التسوق الإلكتروني التي تقدم لكم أفضل المنتجات العضوية والصديقة للبيئة. نحن نقدّر ثقتكم بنا ونلتزم بحماية خصوصية معلوماتكم الشخصية. تُوضح سياسة الخصوصية هذه كيفية جمعنا واستخدامنا ومشاركة وحماية المعلومات التي تقدمونها لنا عند استخدام التطبيق.',
                style: customTextStyle(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // بناء قسم من السياسة
  Widget _buildSection({required String title, required List<String> content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          maxLines: 5,
          color: ColorsLight.black,
          isTitle: true,
        ),
        _customSpace(height: 8),
        ...content.map((text) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppText(
              text,
              color: ColorsLight.gray,
              maxLines: 5,
            ),
          );
        }),
      ],
    );
  }
}
