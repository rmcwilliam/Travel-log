# API 

##Overview
Data can be accessed from the "" domain. All requests and responses will formatted as JSON.


## Authentication Notes:

To make an authenticated request in any case other than registering
or deleting an account, you must supply an `Access-Token` as written in the header along with a valid long string of numbers and letters as the value. Otherwise, you'll receive a 401 Forbidden error.

`['Access-Token'] = '9f5b8ebf876121c3fc4c0fa18a511e16' `

## Registering an Account

### POST `/signup`
#### Params:
`username:` A username, must be unique. `email:` An email address, must be unique. `Password:` A password.

#### Response:
If the user was created successfully, you should receive status code 201 and ...

`{
    "user": {
        "id": 8,
        "username": "apifan",
        "email": "such@api.wow.com",
        "access_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
    }
}`

If the user could not be created, you should receive status code 422 and ...

`{
    "errors": [
        "Email has already been taken",
        "Username has already been taken"
        ]
}`

## Deleting an Account
### Delete `/signup`

#### Params:

`username:` Your user account's username. `password:` Your user account's password

#### Response:

If successful:

`{
    success:[ 
        "Account delete successful!"
    ]

}`

Otherwise:

`{
    errors: [
        "Unable to delete your account"
    ]

}`

## Logging In
### POST `/login`

#### Params:

`username:` String `password:` String

#### Response:

`{
    "user": {
        "user_id": 1,
        "username": "apifan",
        "access_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
    }
}`

If the user could not be created, you should receive status code 422 and ...

`{
    "errors": [
        "Email has already been taken",
        "Username has already been taken"
    ]
}`



## Create new log
### Post `/logs`

#### Params:

`title:` Must be given a title as a string. `description:` Can be optionally provided.

#### Response:

`{"log":{"user_id":1,"title":"My trip to Asia","description":"Asia is awesome","log_id":6}}`


## Index of users logs 
### GET `/users/:id/logs`

#### Params:

`id:` Must provide the users id to see their index of logs.


#### Response: 

`{"logs":[{"title":"My trip to africa","description":null,"log_id":3},{"title":"My trip to the moon","description":null,"log_id":4},{"title":"My trip to Asia","description":"Asia is awesome","log_id":6}]}`


## Show a specific log 
#### GET `/logs/:id`

#### Params: 

`id:` Must provide the ID of the individual log you would like to view.

#### Response:

`{"log":{"title":"My trip to Europe","description":null,"log_id":3,"user_id":1}}`


## Update a log
### PUT `/logs/:id`

#### Params: 

`id:` Must provide the ID the individual log you would like to update. `title:` Must be given a title as a string. `description:` Must provide a description as a string.

#### Response:

`{"success":"Title: My trip to the moon, Description: "}`


## Delete a log
### DELETE `/logs/:id`

#### Params: 

`id:` Must provide the ID the individual log you would like to delete.

#### Response:

`{
  "success": "Log delete successful!"
}`


## Create new attachment
### Post `/logs/:log_id/attachments`

#### Params:

`log_id:` Must provide ID of log you would like to create an attachment in. `location:` Must provide locations as string. 
`caption:` Must provide caption as a string. 
`timestamp:` Must provide timestamp as integer with attachment. 
`attachment:` Must have attachment file attached. 

#### Response:

`{
  "attachment": {
    "user_id": 1,
    "location": "atl",
    "caption": "the pic"
  }
}`


## Show a specific attachment 
#### GET `/logs/:log_id/attachments/:id`

#### Params: 

`log_id:` Must provide the ID of the individual log that contains the attachment. `id:` Must provide the ID of the individual attachment you would like to view.

#### Response:

`{
  "attachment": {
    "user_id": 1,
    "location": "atl",
    "caption": "hello"
  }
}`


## Index of attachments within log 
### GET `/logs/:log_id/attachments`

#### Params:

`log_id:` Must provide ID of log you would would like to view all attachments in.
`id:` Must provide ID of attachment you want to index.`
#### Response:

`{
  "attachments": []
}`



## Delete a specific attachment 
#### DELETE `/logs/:log_id/attachments/:id`

#### Params: 

`id:` Must provide the ID the individual attachment you would like to delete.

#### Response: 

`{"success":"Attachment delete successful!"}`





















