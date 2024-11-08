import 'package:flutter/cupertino.dart';
import 'package:niamu_project/feature/common/presentation/utility/show_custom_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(BuildContext context, double latitude, double longitude)
  async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    String appleUrl = 'https://maps.apple.com/?sll=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else if (await canLaunchUrl(Uri.parse(appleUrl))) {
      await launchUrl(Uri.parse(appleUrl));
    } else {
      if(context.mounted){
        showCustomAlertDialog(context, 'Could not open map');
      }
    }
  }
}
