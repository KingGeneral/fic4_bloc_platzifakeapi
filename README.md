# fic_akatalog_final

Flutter 
project AKATALOG.
Dart 2.18

flutter_bloc: ^8.1.3
http: 0.13.5
shared_preferences: ^2.1.1

API
fakeapi.platzi.com
- auth : login register
- view : get-all 
- product : create read edit

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generate Key
-> Create
keytool -genkey -v -keystore %userprofile%\keyflutter\akatalog-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias akatalog

-> Migrate the key to pkcs12
keytool -importkeystore -srckeystore %userprofile%\keyflutter\akatalog-keystore.jks -destkeystore C:\Users\zonet\keyflutter\akatalog-keystore.jks -deststoretype pkcs12
