# Scope Policy API 

IAM provides a RESTful API that can be used to manage the Scope Policy.

Scope policies are used to control resource access with granular permission, being possible to grant or deny different permissions to different users or groups for different resources. Meaning that the administrator can grant or deny access to one or many resources by scope, by group (of users) or as specific as a single user.

It is important to mention that the Scope Policies uses DENY OVERRIDE logic, having as default an ALL ALLOWED policy.

Also, higher grain level policies override lower grain level policies. Meaning, single user policies override group policies that override scope policies idependent of the permission value.

For the same level of granularity than deny policies override allow policies, as mentioned the default policy is ALL ALLOWED, any DENY policy will override it.

For example, an ALLOW policy for a single user override a DENY group policy. An ALLOW policy for a group overrides a DENY policy for a scope. Yet, for example, any group will have by default ALL ALLOWED policy, any DENY policy for that group will override the default policy (same for users and scopes)

This decision can be seen as pseudocode:

```
for Scope Policy in Scope Policies 

      if Policy is USER Policy
          if Policy denies
            Apply Deny Policy

          else if Policy allows
            Apply Allow Policy

      else if Policy is GROUP Policy
          if Policy denies
            Apply Deny Policy

          else if Policy allows
            Apply Allow Policy

      else if Policy is SCOPES Policy
          if Policy denies
            Apply Deny Policy

          else if Policy allows
            Apply Allow Policy

      else 
          Apply All Allowed Policy

```

The Scope Policies can also be visualized via web browser using the URL https://example.com/iam/scope_policies/ if the user is logged and have ADMIN Role.

- [GET /iam/scope_policies](#get-iamscope_policies)
- [GET /iam/scope_policies/{id}](#get-iamscope_policies)
- [PUT /iam/scope_policies/{id}](#put-iamscope_policiesid)
- [POST /iam/scope_policies](#post-iamscope_policies)
- [DELETE /iam/scope_policies{id}](#delete-iamscope_policiesid)

## GET /iam/scope_policies

Returns a JSON representation of the Scope Policies for the
organization. 

**Authentication required**: yes

**Authorization required**: ROLE\_ADMIN

**Command example**

```shell
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X GET https://example.com/iam/scope_policies/
```
**OR**

```shell
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X GET https://example.com/iam/scope_policies/{id}
```
In case to return a single policy where {id} is the Scope Policy id number


#### Success response

**Condition**: Being Authenticated

**Code**: `200 OK`

**Content**: A JSON representation of the Scope Policy

```json
{
  "id": 1,
  "description": null,
  "creationTime": "2018-02-27T07:26:21.000+01:00",
  "lastUpdateTime": "2018-02-27T07:26:21.000+01:00",
  "rule":"PERMIT",
  "matchingPolicy":"EQ",
  "account":null,
  "group":null,
  "scopes":null
}
```
#### Error responses

**Condition**: User Unauthorized 

**Code**: `401 Unauthorized`

**Content**: 

```json
{
  "error":"unauthorized",
  "error_description":"Full authentication is required to access this resource"
}
```

**OR**

```json
{
  "error":"invalid_token",
  "error_description":"Invalid access token: <Access Token>"
}
```

If an invalid token is provided or no token is provided at all


**Condition**: The Scope Policy {id} is not defined for the organization

**Code**: `404 NOT FOUND`

**Content**: 

```json
{
  "error":"No scope policy found for id: {id}"
}
```

### PUT /iam/scope_policies/{id}

Changes an existing Scope Policy for the organization

**Authentication required**: yes

**Authorization required**: ROLE\_ADMIN

**Data constraints**

Provide a representation of the Scope Policy to be modified

```json
{
  "id": [integer, >=1],
  "description": [text, optional, at most 512 chars],
  "rule": [text,non blank, PERMIT, DENY],
  "matchingPolicy":[text,non blank, EQ, , REGEXP, PATH],
  "account":[text, optinal, account_id, many to one, comma separated],
  "group":[text, optinal, group_id, many to one, comma separated],
  "scopes":[text, optional, minimum 1 and maximum 255 chars]]
}
```

**Data example** 

```json
{
  "id":1,
  "description":"Default Permit ALL policy",
  "creationTime":"2021-03-22T16:36:57.000+01:00",
  "lastUpdateTime":"2021-03-22T16:36:57.000+01:00",
  "rule":"PERMIT",
  "matchingPolicy":"EQ",
  "account":null,
  "group":null,
  "scopes":null
}
```

**Command example**

```shell
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X PUT -d '{"id":1,"description":"Default Permit ALL policy","rule":"PERMIT","matchingPolicy":"EQ","account":null,"group":null,"scopes":null}' https://example.com/iam/scope_policies/{id}
```
One must remember that all fields must be filled with their previows data except the ones to be changed and obligatory fields continue to be obligatory to fill.


#### Success response

**Condition**: The Scope Policy is modified for the organization

**Code**: `204 No Content`

#### Error responses

**Condition**: Missing {id} in the Scope policy URL

**Code**: `405 Method Not Allowed`

```shell
Allow: GET,POST
```

**Or**

**Condition**: Missing {rule} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: rule cannot be empty"
}
```

**Or**

**Condition**: Invalid {rule} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: allowed values for 'rule' are: 'PERMIT', 'DENY'"
}
```

**Or**

**Condition**: Missing {matching policy} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: matching policy cannot be empty or null"
}
```

**Or**

**Condition**: Invalid {matching policy} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: allowed values for 'matchingPolicy' are: 'EQ', 'REGEXP', 'PATH'"
}
```

**Or**

**Condition**: Unauthenticated access 

**Code**: `401 UNAUTHORIZED`

**Content**:

```json
{
    "error":"unauthorized",
    "error_description":"Full authentication is required to access this resource"
}
```
**OR**

```json
{
  "error":"invalid_token",
  "error_description":"Invalid access token: <Access Token>"
}
```

If an invalid token is provided or no token is provided at all

**Or**

**Condition**: Authorization error 

**Code**: `403 FORBIDDEN`

**Content**:

```json
{
    "error":"access_denied",
    "error_description":"Access is denied"
}
```

### POST /iam/scope_policies

Creates a Scope Policy for the organization

**Authentication required**: yes

**Authorization required**: ROLE\_ADMIN

**Data constraints**

Provide a representation of the Scope Policy to be created

```json
{
  "id": [integer, >=1],
  "description": [text, optional, at most 512 chars],
  "rule": [text,non blank, PERMIT, DENY],
  "matchingPolicy":[text,non blank, EQ, , REGEXP, PATH],
  "account":[text, optinal, account_id, many to one, comma separated],
  "group":[text, optinal, group_id, many to one, comma separated],
  "scopes":[text, optional, minimum 1 and maximum 255 chars]]
}
```

**Data example** 

```json
{
  "id":1,
  "description":"Default Permit ALL policy",
  "creationTime":"2021-03-22T16:36:57.000+01:00",
  "lastUpdateTime":"2021-03-22T16:36:57.000+01:00",
  "rule":"PERMIT",
  "matchingPolicy":"EQ",
  "account":null,
  "group":null,
  "scopes":null
}
```

**Command example**

```shell
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X POST -d '{"id":1,"description":"Default Permit ALL policy","rule":"PERMIT","matchingPolicy":"EQ","account":null,"group":null,"scopes":null}' https://example.com/iam/scope_policies/
```

#### Success response

**Condition**: The Scope Policy is created for the organization

**Code**: `201 Created`

#### Error responses

**Condition**: Inserting {id} in the Scope policy URL

**Code**: `405 Method Not Allowed`

```shell
Allow: GET,PUT,DELETE
```

**Or**

**Condition**: The Scope Policy already exists

**Code**: `400 Bad Request`

**Content**: 
```json
{
    "error":"Duplicate policy error: found equivalent policies in repository with ids: {id}"
}
```

**Or**

**Condition**: Missing {rule} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: rule cannot be empty"
}
```

**Or**

**Condition**: Invalid {rule} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: allowed values for 'rule' are: 'PERMIT', 'DENY'"
}
```

**Or**

**Condition**: Missing {matching policy} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: matching policy cannot be empty or null"
}
```

**Or**

**Condition**: Invalid {matching policy} in the Scope policy representation

**Code**: `400 BAD REQUEST`

```json
{
    "error":"Invalid scope policy: allowed values for 'matchingPolicy' are: 'EQ', 'REGEXP', 'PATH'"
}
```

**Or**

**Condition**: Unauthenticated access 

**Code**: `401 UNAUTHORIZED`

**Content**:

```json
{
    "error":"unauthorized",
    "error_description":"Full authentication is required to access this resource"
}
```

**OR**

```json
{
  "error":"invalid_token",
  "error_description":"Invalid access token: <Access Token>"
}
```

If an invalid token is provided or no token is provided at all

**Or**

**Condition**: Authorization error 

**Code**: `403 FORBIDDEN`

**Content**:

```json
{
    "error":"access_denied",
    "error_description":"Access is denied"
}
```

### DELETE /iam/scope_policies/{id}

Deletes the Scope Policy for the organization.

**Authentication required**: yes

**Authorization required**: ROLE\_ADMIN

**Command example**

```shell
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X DELETE https://example.com/iam/scope_policies/{id}
```
Where {id} is the Scope Policy id number


#### Success response

**Condition**: The Scope Policy is defined for the organization

**Code**: `204 NO CONTENT`

#### Error responses

**Condition**: Missing {id} in the Scope policy URL

**Code**: `405 Method Not Allowed`

```shell
Allow: GET,POST
```

**Or**

**Condition**: The Scope Policy {id} is not defined or inexistent for the organization

**Code**: `404 NOT FOUND`

**Content**: 
```json
{
    "error":"No scope policy found for id: 1"
}
```

**Or**

**Condition**: Unauthenticated access 

**Code**: `401 UNAUTHORIZED`

**Content**:

```json
{
    "error": "unauthorized",
    "error_description": "Full authentication is required to access this resource"
}
```

**OR**

```json
{
  "error":"invalid_token",
  "error_description":"Invalid access token: <Access Token>"
}
```

If an invalid token is provided or no token is provided at all

**Or**

**Condition**: Authorization error 

**Code**: `403 FORBIDDEN`

**Content**:

```json
{
    "error": "Access is denied"
}
```