# Developer Guide


Welcome to the developer guide of Essential Care For Every Baby project

## Prequisites

1. Flutter 
2. BLoC State management library 
3. Read the user guide of this project

This guide includes the API used on each screen & also describes the technicaly functionality.

## Project State Management Architecture

Flutter's BLoC library is used for state management of the app.

## Storing data in mobile storage

Hive package is used for storing data & displaying it when user is offline.

## Queuing up network requests to make app work Offline

For making this as an offline first app, All the POST/PUT network request goes through a queue, when an API request is made it is added in a queue of network request.

When the user is online then all the network requests are executed one by one from this queue.

In this way the app works offline & syncs data with DHIS2 when online.

## Project Directories


1. **bloc:**
It includes all the BLoC files made for state management of the app

2. **exceptions:**
This has all the exceptions & it is used for throwing an exception based on the status code of network connection.

3. **l10n:**
This folder has translations for other languages, It is used for localizing all the text used, According to the user's mobile language it translates the language.

4. **models:**
This has all the classes used for creating real world entities and objects

5. **network:**
It has network request clients for sending network request to dhis2.

6. **repository:**
This is used for communicating data between App's UI BLoC & network request. This is responsible for parsing, saving & sending data.

7. **screens:**
It includes user interface for the screens of the app.

8. **theme:**
It has configuration for light & dark theme mode of app.
9. **utils:**
This has two files:
api_config.dart - It has all the API requests urls &
dhis2_config.dart - It has ID of the varaibles of DHIS2 program, data elements.

10. **widgets:** Includes common widgets used across the app such as app bar.
11. **test:** It has the unit test of the app.


## APIs & Methods Used 

DHIS2 Tracker web API is used for sending & receiving data.

### Login Screen

| HTTP | Endpoint      | Summary |
| ----------- | ----------- | ----------- |
| GET | /api/33/me      | Gives user’s data on passing correct username & password   |


### Home Screen

#### Summary of 24 hours

Getting the enrollments using the API & then getting details of every enrollment.

Admitted Count - Check Status = ACTIVE
Discharged - Check Status = COMPLETED 
High Risk  - For each TEI (Baby) this is counted by parameter Classification


#### On Call Doctors

##### Getting List of on call doctors

API to get all events from event program, then these events will be filtered to get on call doctors 

| HTTP | Endpoint      |
| ----------- | ----------- | 
| GET | /api/events.json?orgUnit={DHIS2Config.orgUnit}&program={DHIS2Config.programOnCallDoctorsID}      |

#####  Alerting/Messaging On Call Doctors


| HTTP | Endpoint      | Summary |
| ----------- | ----------- | --|
| POST | /api/messageConversations | Sending messages to users |

##### Fetching doctor's image

| HTTP | Endpoint      |
| ----------- | ----------- | 
| GET | /api/events/files?eventUid=eventID&dataElementUid={DHIS2Config.onCallDoctorImage}   |


### List Of Babies Screen

#### Fetching List Of Enrolled Babies using APIs

This is a two step process

**Fetching List of Enrollments**


| HTTP | Endpoint      | Summary |
| ----------- | ----------- | --|
| GET |  /api/enrollments | For getting list of enrollments |

**Fetching Tracked Entity Instances by ID**


| HTTP | Endpoint      | Summary |
| ----------- | ----------- | --|
| GET | /api/trackedEntityInstances/{trackedEntityID} | Fetch details of each baby |


### Profile Screen

#### Fetching User’s Profile Data using API

| HTTP | Endpoint      | Summary |
| ----------- | ----------- | ----------- |
| GET | /api/33/me      | Gives user’s data on passing correct username & password   |


#### Fetching User’s Profile image 

| HTTP | Endpoint      | 
| ----------- | ----------- |
| GET | /api/31/fileResources/id/data      |
#### Fetching Program’s Messages/Notifications

| HTTP | Endpoint      | Summary |
| ----------- | ----------- | ----------- |
| GET | /api/messageConversations   | Gives message conversation/notification data to user  |

### Register Baby Screen

The following API does two jobs:
1. Creating a Tracked Entity Instance of Baby
2. Enrolling the Baby in tracker program

| HTTP | Endpoint      | Summary |
| ----------- | ----------- | --|
| POST  |  /api/trackedEntityInstances | To register a baby |

### Assessments Screen

####  Fetching events for a particular baby

| HTTP | Endpoint      | 
| ----------- | ----------- | 
| GET | /api/events.json?orgUnit={organization Id}&program={program id}&trackedEntityInstance={instance id} |

#### Adding Events/Assessments for baby health monitoring

| HTTP | Endpoint      | 
| ----------- | ----------- | 
| POST |/api/events.json?orgUnit=orgUnitId&program=programID&trackedEntityInstance=trackedEntityInstanceID |

#### Classification using program rules after stage 2 

Based on the input data the health of baby is classified using program rules.

### On Call Doctor's Schedule Screen

This screen uses the data fetched from the on call doctors feature on home screen. It just displays the save list from the local storage

