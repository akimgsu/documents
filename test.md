# Overview
The Fusion tasks are usually transferring data between Fusion sftp server and the Pcard service and ORDS. There are 3 tasks in the task-runner-container. 

* Member Portal URL: https://myrec.gsu.edu/
* This Specific Query: https://myrec.gsu.edu/Query?apiId=memstat (Authentication and proper permission required)

## Description

* Transfer the membership data from ORDS to the Fusion SFTP server that name is "georgiastate.innosoftfusion.com".
* Transfer member's file from Fusion SFTP server that folder name is "MemberStatistics" to the ORDS.
* Transfer member's file from Fusion SFTP server that folder name is "Extract" to the Pcard server.

### Fusion SFTP

* Host: georgiastate.innosoftfusion.com
* User: GSU
* Key file: [Lastpass]

## FLOW

### fusion-getdemographics
* Run everyday at 2:30:00 AM
> 1. Get membership data from DB(ORDS)
> 2. Store the data into a file
> 3. Send the file to the Fusion server via sftp

```mermaid
sequenceDiagram
    par Task to DB(ORDS)
        Task->>DB(ORDS): get membership data from DB
    and DB(ORDS) to Task
        DB(ORDS)->>Task: store membership data into a file
    end
    par Task to SFTP-Fusion
        Task->>SFTP-Fusion: sending membership file to fusion
    end
```
* This task finally creates "gsuDemographicsNewFormat.csv" into fusion sftp server.
* File format:
```
[
      "pantherId",
      "firstName",
      "middleInitial",
      "lastName",
      "externalUser",
      "gender",
      "pidm",
      "birthdate",
      "email",
      "feePaying",
      "tuitionRemission",
      "enrolled",
      "primaryCampus",
      "fullPartTime",
      "membershipType",
      "customType",
      "employeeId",
      "employeeGsu",
      "employeeOther",
      "isStudent",
      "isAlumni",
      "isEmployee",
      "isRetiree"
]
 
```
<img width="636" alt="getDemographics.csv" src="https://user-images.githubusercontent.com/46454047/222540518-a6a3fa78-3097-4a2a-8c23-bb730fe01e11.png">


### fusion-innoapi
* Run everyday at 4:00:00 PM
> 1. Get membership data from DB(ORDS)
> 2. Send the file(s) to Task
> 3. Send the processed data to the DB

```mermaid
sequenceDiagram
    par Task to SFTP-Fusion
        Task->>SFTP-Fusion: get file(s) from Fusion server in MemberStatistics folder 
    and SFTP-Fusion to Task
        SFTP-Fusion->>Task: send the file(s) to Task
    end
    par Task to DB(ORDS)
        Task->>DB(ORDS): send the processed data to the DB
    end
```
* This task creates data into FUSION_ACTIVITY_API table in Biprod DB.
Dat format:
```
[
    'PantherID', 
    'FirstName', 
    'LastName', 
    'PartyId', 
    'Description'
]
```

### fusion-update
* Run everyday at 3:50:00 AM 
> 1. Get membership data from Fusion server in Extract folder
> 2. Send the file(s) to Task
> 3. Send the data by processed to the Pcard

```mermaid
sequenceDiagram
    par Task to SFTP-Fusion
        Task->>SFTP-Fusion: get file(s) from Extract folder 
    and SFTP-Fusion to Task
        SFTP-Fusion->>Task: send the file(s) to Task
    end
    par Task to S3(Bucket)
        Task->>S3(Bucket): send file(s) to S3
    and Task to Pcard
        Task->>Pcard: send data to Pcard
    end
```
* This jog creates data into pcarprodproxy.server.gsu.edu server. 
* Data format: [pantherid,[AddorRemove],20230228]

## External Resources

* task-runner-container – https://github.com/gastate/documentation/wiki/Infrastructure:-Task-Runner-Container
* Tasks – https://github.com/gastate/documentation/wiki#tasks
* ORDS - https://github.com/gastate/documentation/wiki/ORDS

