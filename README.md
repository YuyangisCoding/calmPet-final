# DECO3801 calmpet project  
# Team: 7 up
<img src="https://raw.githubusercontent.com/YuyangisCoding/calmPet-final/main/images/calmpetIcon.png" width="200" height="200" />

This project is aiming for a smooth transition from class break to start of the class
by collecting class noise and making interactive cute animals. 
This project is the prototyping implementation of [this proposal](https://github.com/YuyangisCoding/calmPet-final/raw/main/007%20Disruptive%20Classroom%20transition%20times.pdf) from DECO3800 

# Compiling and building instructions
We recommend to use macOs for building project. Target should be ios devices, 
because it is fully tested, running on other platform
may work but may have subtle compatibility bugs. Please make sure you test this app in quiet place, otherwise
it will never enter last phase.


1. Install [flutter](https://docs.flutter.dev/get-started/install)
2. After installation, you should run _flutter doctor_ to check if you have 
unmet requirements. Please follow "doctor" promotes and install any missing tools.
A healthy installation should be similar to below
>$ flutter doctor                                     
Doctor summary (to see all details, run flutter doctor -v):  
[✓] Flutter (Channel stable, 3.0.5, on macOS 12.6 21G115 darwin-arm, locale en-AU)  
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)  
[✓] Xcode - develop for iOS and macOS (Xcode 14.0.1)  
[✓] Chrome - develop for the web  
[✓] Android Studio (version 2021.3)  
[✓] IntelliJ IDEA Ultimate Edition (version 2022.2.3)  
[✓] IntelliJ IDEA Ultimate Edition (version 2022.2.3)  
[✓] Connected device (3 available)  
[✓] HTTP Host Availability  
• No issues found!
3. Next, we will compile and run it, guides will be slightly different 
depending on what platforms you are going to use. I will only show IOS platform 
in this guide. Make sure you have internet connection for either simulator or iPhone because login and register need it.

First of all, run **_"flutter pub get"_** in the project directory to grab dependencies.  
   * **_run on ios simulator_**  
   You should open simulator.app first, then run _flutter devices_ to see available 
   devices, then grab **_simulator_device_id_** at the second column of output and
   run **__flutter run -d simulator_device_id__**
   * **_run on real iPhone devices_**  
   This is a bit complicated, you have to sign app for your devices in Xcode first. We recommend using your 
   own apple identity to sign it. Do not click triangle to run directly as this will not be a release build thus app will not stay
   in your phone after disconnecting with Mac  
   Please read this detailed [guide](https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8)  
   Once you have configured signing in xcode, make sure that you connect iPhone to Mac and select the device, then go to menu
   _Product->Build for->profiling_ to build and then _Product->perform action->profile without building_  
   You are all good now, I hope

# Database and Tomcat server (a spring-boot project)
We are using AWS EC2 to host Tomcat server. This server is meant to support 
login and register functions. That means you can log in and register anywhere in the 
world for our calmpet flutter app. You can skip below and just use app without any hassles;)

If you want to, however, build this server yourself, you can do it quite easily.
Spring-boot project can be found [here](https://github.com/YuyangisCoding/calmpetSQL.git) or from blackBoard submission

0. assuming you have brew or apt-get package manager.
1. install mysql-server on machine that you want to use as a server.
Create a database called calmpet under root user with password 12345678. Then run calmpet.sql that we 
provide to you, which will build tables automatically. 
2. install maven
3. Before proceeding to the next step, we need to make sure ip addresses specified in the 
frontend flutter project **_match_** tomcat server ip. That is 127.0.0.1:8010 if you 
purely run in localhost. Localhost will work for simulator test, but not real iPhone devices.
To check ip addresses, go to login.dart(line 152) and register.dart(line 186), which are
located in flutter_project/lib/pages/user. Then go and check spring-boot project
calmpetSQL/src/main/resources/application.yml
4. in the springboot project directory,
run _mvn spring-boot:run_ 
5. Now you have server up and running! 

# Troubleshooting
We try to be careful, mistakes do happen. 
Should you have any trouble compiling/running this project,  
Please email me at _yuyang.zhang1@uqconnect.edu.au_, 
I am available 24/7 during marking period ;)  
If you found login or resigter is not responding, then it's likely that AWS failed for some reasons,
please contact me immediately if this happens. Also check your internet connection and/or internet permissions.  
If app failed to run on real iPhone devices, please check the signing step && make sure device management and developer mode are all set
in setting.  
If microphone is not fired up, it's possible that you do not grant microphone permission in iPhone setting.

Thank you!

