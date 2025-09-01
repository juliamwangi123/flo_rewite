import 'package:firebase_auth/firebase_auth.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/exception.dart';
import 'package:floo_aid_rewrite/core/errors/firebase_error_mapper.dart';
import 'package:floo_aid_rewrite/features/auth/data/models/auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signUpUserWithEmailAndPassword(AuthParams params);
  Future<AuthModel> signInUserWithEmailAndPassword(AuthParams params);
  Future<AuthModel> signInUserWithGoogle();
  Future<bool> getCurrentUser();
  Future<void> signOutUser();
  
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({required this.firebaseAuth, required this.googleSignIn});

  @override
  Future<AuthModel> signUpUserWithEmailAndPassword(AuthParams params) async{
    try{
      final usercredential =  await firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      // TODO: Implement OTP verification
      
      // if(usercredential.user != null){
      //   await usercredential.user?.sendEmailVerification();

      // }
      return AuthModel(
        uuid: usercredential.user?.uid ?? '',
        email: usercredential.user?.email ?? '',
        isEmailVerified:usercredential.user?.emailVerified ?? false,
        isNewUser: usercredential.additionalUserInfo?.isNewUser ?? false,
      );
    }on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
    }
    catch (e) {
      throw Exception('Failed to sign up with email and password: $e');
    }
  }

  @override
  Future<AuthModel> signInUserWithGoogle() async{
   try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw  const ServerException('Google sign-in was aborted');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      final user = userCredential.user!;
      return AuthModel(
        uuid: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
        isNewUser: userCredential.additionalUserInfo!.isNewUser,
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
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
   
  }

  @override
  Future<AuthModel> signInUserWithEmailAndPassword(AuthParams params) async{
    try {
      final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
        );
        return AuthModel(
          uuid: userCredentials.user?.uid ?? '',
          email: userCredentials.user?.email ?? '',
          isEmailVerified: userCredentials.user?.emailVerified ?? false,
          isNewUser: userCredentials.additionalUserInfo?.isNewUser ?? false,
        );
    } on FirebaseAuthException catch (e) {
      throw ServerException(mapFirebaseAuthError(e.code, e.message));
      
    } catch (e) {
            throw Exception('Failed to sign in with email and password: $e');

    }
  
  }
  
  @override
Future<bool> getCurrentUser() async {
  try {
    final User? user = firebaseAuth.currentUser;
    return user != null;
  } catch (e) {
    throw Exception('Failed to get current user: $e');
  }
}
  

}