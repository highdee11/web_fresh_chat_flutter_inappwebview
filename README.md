# web_fresh_chat_flutter

A web fresh-chat sdk integration into flutter InAppWebView plugin.

This project uses flutter InAppWebView plugin to create a localserver to run an html file that contains the fresh-chat web sdk implementation.
It allows you to pass in your fresh-chat sdk and other parameters like user_id, firstname, lastname of the user.


# Fews things to configure in case you want to use this project as a sample to follow in other to create yours.

Locate your Android Manifest file at "android/app/src/main/AndroidManifest.xml" and add this line
into your <application> tag android:usesCleartextTraffic="true" so it look this way
```
<application
android:label="web_fresh_chat_flutter"
android:icon="@mipmap/ic_launcher"
android:usesCleartextTraffic="true">
```
