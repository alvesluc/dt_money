import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MadeWithLoveByAlvesLuc extends StatelessWidget {
  const MadeWithLoveByAlvesLuc({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Center(
        child: TextButton(
          onPressed: _launchURL,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Made with 💙 by alvesluc'),
                SizedBox(width: 8),
                Icon(PhosphorIcons.githubLogo)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    final githubUrl = Uri.parse('https://github.com/alvesluc');
    if (await canLaunchUrl(githubUrl)) {
      await launchUrl(githubUrl);
    } else {
      throw 'Could not launch $githubUrl';
    }
  }
}
