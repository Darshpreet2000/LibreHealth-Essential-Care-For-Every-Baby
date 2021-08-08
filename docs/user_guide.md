# User Guide on App usage

Welcome to the user guide of Essential Care For Every Baby project

## DHIS2 Setup

### Setting up DHIS2 instance for your organization
This mobile app uses DHIS2 as backend, so this needs to be setup for your organization.

[**Documentation to setup DHIS2**](https://docs.dhis2.org/en/manage/performing-system-administration/dhis-core-version-234/installation.html)

### Importing the metadata in DHIS2

To setup this application for your DHIS2 instance, first import the metadata from the link provided below in your DHIS2 instance.

1. Essential Care For Every Baby Program [**Link**](https://gitlab.com/librehealth/incubating-projects/mhbs/lh-mhbs-eceb/-/blob/master/metadata_eceb_program.json)


2. On Call Doctors Program [**Link**](https://gitlab.com/librehealth/incubating-projects/mhbs/lh-mhbs-eceb/-/blob/master/metadata_on_call_doctor_program.json)

### Adding Link for server

Add the link for server in this app screen, the app will use this DHIS2 server for all other functionalities.


### Creating On Call Doctors in DHIS2 program event

To Create On Call Doctors following details need to be filled

1. Doctor's dhis2 ID
2. Doctor's name
3. Doctor's shift date
4. Doctor's shift start time
5. Doctor's shift end time

After creating events in on call doctor program , the doctor's which are on call will appear inside the app.


## App Tutorial

### Home Screen

This screen has 3 parts

#### Summary of 24 Hours

This displays the activity summary of the last 24 hours, It fetches data using API & then calculate summary using an algorithm.

1. Admitted - The babies which were admitted in last 24 hours
2. Discharged - The babies which were discharged in last 24 hours
3. High Risk - The babies which are in danger & were admitted in last 24 hours

#### Register Baby Button

This button will take user to a new screen to register new babies.


#### On Call Doctors

The doctors which are on call in the current time will be shown here. And on tapping a doctor will send a alert message from the user.

### List of Babies Screen

It displays the list of babies which were registered.

#### Features of child list item:
1. Displays Mother name, ward name, birth time, gender
2. Displays health with color:
   1. Normal - Green
   2. Problem - Yellow
   3. Danger - Red
3. On Tap of baby list item navigates to assessments screen

#### Search Bar:
This screen has search bar with which a child can be searched by entering mother's name.

#### Sorting Feature:
List can be sorted in 3 ways:
1. Time - Birth time
2. Status - The health classification status
3. Location - Ward name 

### Notifications Screen

This screen has two parts Risk assessments & monitoring alerts, Let's have a look at them.

#### Risk Assessments

This will display any health status changed currently, baby's name, ward name & its birth time.

On tap of list item will navigate to assessments screen of that baby

#### Monitoring Alerts

This will display what is the next upcoming assessment for a child with classification as Problem & Danger.

On tap of list item will navigate to assessments screen of that baby


### Profile Screen

This screen has 3 parts

#### User profile header

This displays the user's profile details such as:
1. User name
2. User ID
3. User's profile image

#### Settings Button

On tapping this will open a drawer from right with features:
1. Notification Toggle - To turn On/Off app's notification
2. Notification Sound Toggle - To turn On/Off app's notification sound only
3. Dark Mode Toggle - To turn On/Off app's dark mode


#### Notifcations List with activity & load more button

This displays the list of last 5 notification from DHIS2 , On tapping load more it will display the next 5 notifications.

### Assessments Screen

It shows a list of assessments done and next assessments.

There are a total of 5 Assessments & are increased based on automated baby classification

#### Stages 

1. Stage - 1 (0 to 60 minutes from birth)
2. Stage - 2 (60 to 90 minutes from birth)
3. Stage - 3: This has 3 different stages based on classification the appropriate stage is added 
   1. Stage 3 Normal
   2. Stage 3 Problem
   3. Stage 3 Danger
4. Stage - 4: This stage is repeated till the baby is not classified as normal
5. Stage - 5: This is the final discharge stage and is done with a discharge button

#### Notification/Reminder

After a stage is added a reminder is scheduled & is shown as a notification in mobile if the user has not completed the assessment before its end.

On pressing the notification the user is taken to the assessments screen.

#### Discharge button

It appears only after 24 hours from birth & after the baby is classified as normal. On pressing this a discharge stage is added.

### On Call Doctor's Schedule Screen

This screen displays all the doctor's schedule added to on call doctor program in dhis2.

The List item shows the following information:
1. Doctor's profile photo
2. Doctor's name
4. Doctor's shift date
5. Doctor's shift start time
6. Doctor's shift end time

### About Us Screen

Displays about the project & the LibreHealth community with a button to visit the project

### Report a Bug

To file a bug report, on pressing will take to issues of the project & a bug can be reported there.

### Share App
To share the app with other users, on pressing this will open social media platforms to share the app.  
