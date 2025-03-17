import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> initiateGPayPayment(String amount) async {
  String upiUrl = 'upi://pay?pa=gansh8201@ok&pn=EverydayCafe'
      '&mc=1234&tid=TXN123456&tr=ORDER1234&tn=Coffee Order&am=$amount&cu=INR';

  try {
    if (await canLaunchUrl(Uri.parse(upiUrl))) {
      await launchUrl(Uri.parse(upiUrl), mode: LaunchMode.externalApplication);
      await savePaymentStatus(amount, "Success");
    } else {
      throw 'Could not launch GPay';
    }
  } catch (e) {
    print("Error launching GPay: $e");
    await savePaymentStatus(amount, "Failed");
  }
}

Future<void> savePaymentStatus(String amount, String status) async {
  CollectionReference payments = FirebaseFirestore.instance.collection('payments');
  await payments.add({
    'amount': amount,
    'status': status,
    'timestamp': DateTime.now().toString(),
  });
}
