<div align="center">
<p align="center"><img src="assets/app_icon.png" width="150"></p> 
<h2 align="center"><b>LibreHealth Essential Care For Every Baby</b></h2>
<h4 align="center">A Newborn Baby Care Support App</h4>
<p align="center"><img src="https://f-droid.org/wiki/images/0/06/F-Droid-button_get-it-on.png"></a></p> 
</div>

</div>

## Goal

An Android/IOS application to provide clinical decision-support for nurses and doctors delivering essential newborn care interventions during the first day of life. This application provides knowledge, skills, and competencies to nurses and doctors in low/middle-income settings so that they can provide life-saving care to newborns from birth through 24 hours postnatal. App uses DHIS2 as backend & can be setup for any hospital/organization

Features

- Ability to track multiple babies at a time

- Time-stamping births to generate an essential newborn care clock for each baby being tracked in the app

- Automated classification of babies health status, based on results from observations and assessments that are conducted during the first 2 hours after birth

- Automated advice on management of babies, based on their classification; Reminders/alerts to provide recommended essential newborn care interventions

- If particular interventions are not delivered on time, or at all, capture of information regarding why this essential newborn care was late, or missed

This project is developed using Flutter, it supports Android & IOS with single codebase

## Link to documentation 

Link for User & developer documentation of this App

https://librehealth.gitlab.io/incubating-projects/mhbs/lh-mhbs-eceb/
  
  


## Maintainers and Developers

* [**Saptarshi Purkayastha**](https://gitlab.com/sunbiz)

* [**Robby O Connor**](https://gitlab.com/robbyoconnor)

* [**Darshpreet Singh**](https://gitlab.com/Darshpreet2000)


## Screenshots

|   |  | |
| ------ | ------ | ------ | 
|<img src="/screenshots/Login.png"  align="top"> |  <img src="/screenshots/Home.png" align="top">| <img src="/screenshots/List_of_Babies.png" align="top"> |
| Login Screen  |Home Screen  |List of Babies Screen  
| <img src="/screenshots/sortby.png" align="top">| <img src="/screenshots/Profile.png" align="top">|<img src="/screenshots/risk_assessments.png" align="top">|
|Sort By Feature  | Profile Screen | Risk Assessments|
| <img src="/screenshots/monitoring_alerts.png" align="top">| <img src="/screenshots/drawer.png" align="top">|<img src="/screenshots/doctor_schedule.png" align="top">|
|Monitoring Alerts  | Drawer  | Doctor Schedule Screen|
| <img src="/screenshots/settings.png" align="top">| <img src="/screenshots/home_dark.png" align="top">|<img src="/screenshots/drawer_dark.png" align="top">|
|Settings Screen | Home Screen | Drawer |
| <img src="/screenshots/list_of_babies_dark.png" align="top">| <img src="/screenshots/doctor_schedule_dark.png" align="top">|<img src="/screenshots/settings_dark.png" align="top">|
| List of Babies | Doctor Schedule Screen | Settings Screen |
| <img src="/screenshots/stage1.png" align="top">| <img src="/screenshots/stage2.png" align="top">|<img src="/screenshots/register.png" align="top">|
| Stage 1 | Stage 2 | Register |
| <img src="/screenshots/normal.png" align="top">| <img src="/screenshots/problem.png" align="top">|<img src="/screenshots/danger.png" align="top">|
| Normal | Problem | Danger |
| <img src="/screenshots/discharge.png" align="top">| <img src="/screenshots/notify.png" align="top">|<img src="/screenshots/about.png" align="top">|
| Discharge | Notification | About Screen |



## Contributions Best Practices

Please help us follow the best practice to make it easy for the reviewer as well as the contributor. We want to focus on the code quality more than on managing pull request ethics.

* Single commit per pull request
* Reference the issue numbers in the commit message. Follow the pattern ``` Fixes #<issue number> <commit message>```
* Follow uniform design practices. The design language must be consistent throughout the app.
* The pull request will not get merged until and unless the commits are squashed. In case there are multiple commits on the PR, the commit author needs to squash them and not the maintainers cherrypicking and merging squashes.
* If the PR is related to any front end change, please attach relevant screenshots in the pull request description.
* Before you join development, please set up the project on your local machine, run it and go through the application completely. Press on any button you can find and see where it leads to. Explore.
* If you would like to work on an issue, drop in a comment at the issue. If it is already assigned to someone, but there is no sign of any work being done, please free to start working on it.

## Branch Policy

We have the following branches

* **development**  All development goes on in this branch. If you're contributing, you are supposed to make a merge request to development. PRs to development branch must pass a build check and a unit-test check on Gitlab pipeline.

* **master** This contains shipped code. After significant features/bugfixes are accumulated on development, we make a version update and make a release.

## License

This project is licensed under the Mozilla Public License 2.0 with Healthcare Disclaimer. a copy of this license can be found in `LICENSE`.
