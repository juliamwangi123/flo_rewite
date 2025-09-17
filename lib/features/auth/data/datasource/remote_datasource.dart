
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/exception.dart';
import 'package:floo_aid_rewrite/core/errors/firebase_error_mapper.dart';
import 'package:floo_aid_rewrite/features/auth/data/models/auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AuthModel> signUpUserWithEmailAndPassword(AuthParams params);
  Future<AuthModel> signInUserWithEmailAndPassword(AuthParams params);
  Future<AuthModel> signInUserWithGoogle();
  Future<bool> getCurrentUser();
  Future<void> signOutUser();
  Future<void> passwordReset(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseDatabase firebaseDatabase;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firebaseDatabase
  });

  Future<void> _createUserProfile(User user, {bool isNewUser = false}) async {
    try {
      final userRef = firebaseDatabase.ref().child('profile');
      DataSnapshot snapshot = await userRef.get();
      
      
      final profileData = {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName ?? '',
        'photoURL': user.photoURL ?? '',
        'phoneNumber': user.phoneNumber ?? '',
        'emailVerified': user.emailVerified,
        'createdAt': ServerValue.timestamp,
        'lastLoginAt': ServerValue.timestamp,
      };

      if (!snapshot.exists || isNewUser) {
        await userRef.set(profileData);
      } else {
        await userRef.update({
          'lastLoginAt': ServerValue.timestamp,
          'emailVerified': user.emailVerified,
        });
      }
    } catch (e) {
      throw ServerException('Failed to sign up with email and password: $e');

    }
  }

  @override
  Future<AuthModel> signUpUserWithEmailAndPassword(AuthParams params) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw const ServerException('User creation failed');
      }

      // Create user profile in database
      await _createUserProfile(user, isNewUser: true);

      // TODO: Implement OTP verification
      // if (user.emailVerified == false) {
      //   await user.sendEmailVerification();
      // }

      return AuthModel(
        uuid: user.uid,
        email: user.email ?? '',
        isEmailVerified: user.emailVerified,
        isNewUser: userCredential.additionalUserInfo?.isNewUser ?? true,
        displayName: user.displayName,
        photoURL: user.photoURL,
        phoneNumber: user.phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
    } catch (e) {
      throw ServerException('Failed to sign up with email and password: $e');
    }
  }

  @override
  Future<AuthModel> signInUserWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw const ServerException('Google sign-in was cancelled');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      
      final user = userCredential.user;
      if (user == null) {
        throw const ServerException('Google sign-in failed');
      }

      await _createUserProfile(
        user, 
        isNewUser: userCredential.additionalUserInfo?.isNewUser ?? false
      );

      return AuthModel(
        uuid: user.uid,
        email: user.email ?? '',
        isEmailVerified: user.emailVerified,
        isNewUser: userCredential.additionalUserInfo?.isNewUser ?? false,
        displayName: user.displayName,
        photoURL: user.photoURL,
        phoneNumber: user.phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
    } catch (e) {
      throw ServerException('Failed to sign in with Google: $e');
    }
  }

  @override
  Future<void> signOutUser() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw ServerException('Failed to sign out: $e');
    }
  }

  @override
  Future<AuthModel> signInUserWithEmailAndPassword(AuthParams params) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw const ServerException('Sign in failed');
      }

  
      return AuthModel(
        uuid: user.uid,
        email: user.email ?? '',
        isEmailVerified: user.emailVerified,
        isNewUser: false,
        displayName: user.displayName,
        photoURL: user.photoURL,
        phoneNumber: user.phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
    } catch (e) {
      throw ServerException('Failed to sign in with email and password: $e');
    }
  }

  @override
  Future<bool> getCurrentUser() async {
    try {
      final User? user = firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      throw ServerException('Failed to get current user: $e');
    }
  }

  @override
  Future<void> passwordReset(String email) async {
    try {
      final url = Uri.parse('https://floaid-fd7ad-default-rtdb.firebaseio.com/profile.json');
      final response =  await http.get(
        url,
        headers: {'Content-Type': 'application/json'},

      );
      if(response.statusCode == 200){
        final decodedResult = jsonDecode(response.body);
        if(decodedResult['email'] == email){
         await firebaseAuth.sendPasswordResetEmail(email: email);

      }else{
        throw  const ServerException('Email was not found');
      }
      }
      
    } on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
    } catch (e) {
      throw ServerException('Failed to reset password: $e');
    }
  }
}