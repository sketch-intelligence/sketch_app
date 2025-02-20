import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/auth/domain/use_case/login_use_case.dart';
import 'package:sketch/features/chat/data/model/custom_token_model.dart';
import 'package:sketch/features/chat/data/use_case/get_token_use_case.dart';

Future<void> registerUserInFirestore(
    String name, String email, String pic) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    await userRef.set({
      'name': name,
      'email': email,
      'profilePic': pic,
    });
  }
}

Future<void> updateFirebaseUid(int userId, String firebaseUid) async {
  final url = Uri.parse('${baseUrl}users/$userId/firebase-uid');
  final String token = CacheHelper.token!;

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token", // Add token to headers
    },
    body: jsonEncode({
      'firebaseUid': firebaseUid,
    }),
  );

  if (response.statusCode == 200) {
    print("Firebase UID updated successfully.");
  } else {
    print("Failed to update Firebase UID: ${response.body}");
  }
}

Future<void> signUpWithCred(LoginParams params) async {
  try {
    print("🔹 Attempting to sign in with email: ${params.email}");
// UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: params.email ?? '',
      password: params.password ?? '',
    );

    // ✅ Debugging: Check if sign-in was successful
    if (userCredential.user != null) {
      print("✅ Successfully signed in as: ${userCredential.user?.email}");
      print("🔹 Firebase UID: ${userCredential.user?.uid}");
    } else {
      print("⚠️ Sign-in failed: UserCredential returned null");
    }
  } catch (e) {
    print("🚨 Error signing in with email and password: $e");
  }
}

Future<void> signInWithCred(int userId, LoginParams params) async {
  try {
    print("🔹 Attempting to sign in with email: ${params.email}");
// UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: params.email!.trim(),
      password: params.password ?? '',
    );

    // ✅ Debugging: Check if sign-in was successful
    if (userCredential.user != null) {
      await updateFirebaseUid(userId, userCredential.user!.uid);
      print("✅ Successfully signed in as: ${userCredential.user?.email}");
      print("🔹 Firebase UID: ${userCredential.user?.uid}");
    } else {
      print("⚠️ Sign-in failed: UserCredential returned null");
    }
  } catch (e) {
    print("🚨 Error signing in with email and password: $e");
  }
}

Future<String?> getToken(String uid) async {
  final String url = "${baseUrl}firebase/customToken";

  try {
    final String token = CacheHelper.token!;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // Add token to headers
      },
      body: jsonEncode({"uid": uid}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data["success"] == true) {
        return data["data"]["customToken"];
      } else {
        print("Error: ${data["message"]}");
        return null;
      }
    } else {
      print("Failed to get token: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Exception while fetching token: $e");
    return null;
  }
}

class ChatRepository extends CoreRepository {
  Future<Result<CustomTokenModel>> getToken(
      {required GetTokenParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        responseStr: 'toek',
        data: params.toJson(),
        converter: (json) => CustomTokenModel.fromJson(json['data']),
        method: HttpMethod.GET,
        url: '${baseUrl}firebase/customToken');
    return call(result: result);
  }
}
