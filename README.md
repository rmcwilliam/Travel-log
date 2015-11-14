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
### `POST /login`

#### Params:

`username:` String `password:` String

#### Response:

`{
    "user": {
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

