# DECO3801 calmpet project  
# Team: 7 up
<img src="https://raw.githubusercontent.com/YuyangisCoding/calmPet-final/main/images/calmpetIcon.png" width="200" height="200" />

This project is aiming for a smooth transition from class break to start of the class
by collecting class noise and making interactive cute animals. 

# Compiling and building instructions
We recommend to use macOs for building project. Target should be ios devices, 
because it is fully tested, running on other platform
may work but may have subtle compatibility bugs. 


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
   * **_run on ios simulator_**  
   You should open simulator.app first, then run _flutter devices_ to see available 
   devices, then grab **_simulator_device_id_** at the second column of output and
   run **__flutter run -d simulator_device_id__**
   * **_run on real iPhone devices_**  
   This is a bit complicated, you have to sign app for your devices in Xcode first.
   Please read this detailed [guide](https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8)  
   Once you have signed in xcode, instead of build and run directly from xcode, we can run _flutter -d real_device_id --release_ in the 
   project directory, which seems easier and less error-prone. Wait a few seconds, you
   should be able to see calmpet in iPhone homepage!

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


