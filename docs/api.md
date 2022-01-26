This is a brief explanation of Shiori's API. For more examples you can import this [collection](https://github.com/go-shiori/shiori/blob/master/docs/postman/shiori.postman_collection.json) in Postman.

#### Table of contents
* [Auth](#Auth)
  * [Log in](#Log-in)
  * [Log out](#Log-out)
* [Bookmarks](#Bookmarks)
  * [Get Bookmarks](#Get-Bookmarks)
  * [Add Bookmark](#Add-bookmark)
  * [Edit Bookmark](#Edit-bookmark)
  * [Delete Bookmark](#Delete-bookmark)
* [Tags](#Tags)
  * [Get Tags](#Get-tags)
  * [Rename Tag](#Rename-tag)
* [Accounts](#Accounts)
  * [List Accounts](#List-accounts)
  * [Create account](#Create-account)
  * [Edit Account](#Edit-account)
  * [Delete Accounts](#Delete-accounts)


# Auth
## Log in
Most actions require a session id. For that, you'll need to log in using your username and password.
|Request info|Value|
|-|-|
|Endpoint|`/api/login`|
|Method|`POST`|

Body:
```json
{
	"username": "shiori",
	"password": "gopher",
	"remember": 1,
	"owner": true
}
```

It will return your session ID in a JSON:
```json
{
    "session": "YOUR_SESSION_ID",
    "account": {
        "id": 1,
        "username": "shiori",
        "owner": true
    }
}
```

## Log out
Log out of a session ID.
|Request info|Value|
|-|-|
|Endpoint|`/api/logout`|
|Method|`POST`|
|`X-Session-Id` Header|`sessionId`|

# Bookmarks
## Get bookmarks
Gets the last 30 bookmarks (last page).
|Request info|Value|
|-|-|
|Endpoint|`/api/bookmarks`|
|Method|`GET`|
|`X-Session-Id` Header|`sessionId`|

Returns:
```json
{
    "bookmarks": [
        {
            "id": 825,
            "url": "https://interesting_cool_article.com",
            "title": "Cool Interesting Article",
            "excerpt": "An interesting and cool article indeed!",
            "author": "",
            "public": 0,
            "modified": "2020-12-06 00:00:00",
            "imageURL": "",
            "hasContent": true,
            "hasArchive": true,
            "tags": [
                {
                    "id": 7,
                    "name": "TAG"
                }
            ],
            "createArchive": false
        },
    ],
    "maxPage": 19,
    "page": 1
}
```

## Add bookmark
Add a bookmark. For some reason, Shiori ignores the provided title and excerpt, and instead fetches them automatically. Note the tag format, a regular JSON list will result in an error.

|Request info|Value|
|-|-|
|Endpoint|`/api/bookmarks`|
|Method|`POST`|
|`X-Session-Id` Header|`sessionId`|

Body:
```json
{
	"url": "https://interesting_cool_article.com",
	"createArchive": true,
	"public": 1,
	"tags": [{"name": "Interesting"}, {"name": "Cool"}],
	"title": "Cool Interesting Article",
	"excerpt": "An interesting and cool article indeed!"
}
```
Returns:
```json
{
    "id": 827,
    "url": "https://interesting_cool_article.com",
    "title": "TITLE",
    "excerpt": "EXCERPT",
    "author": "AUTHOR",
    "public": 1,
    "modified": "DATE",
    "html": "HTML",
    "imageURL": "/bookmark/827/thumb",
    "hasContent": false,
    "hasArchive": true,
    "tags": [
        {
             "name": "Interesting"
        },
        {
             "name": "Cool"
        }
    ],
    "createArchive": true
}
```

## Edit bookmark
Modifies a bookmark, by ID.
|Request info|Value|
|-|-|
|Endpoint|`/api/bookmarks`|
|Method|`PUT`|
|`X-Session-Id` Header|`sessionId`|

Body:
```json
{
    "id": 3,
    "url": "https://interesting_cool_article.com",
    "title": "Cool Interesting Article",
    "excerpt": "An interesting and cool article indeed!",
    "author": "AUTHOR",
    "public": 1,
    "modified": "2019-09-22 00:00:00",
    "imageURL": "/bookmark/3/thumb",
    "hasContent": false,
    "hasArchive": false,
    "tags": [],
    "createArchive": false
}
```
After providing the ID, provide the modified fields. The syntax is the same as [adding](#Add-a-bookmark).

## Delete bookmark
Deletes a list of bookmarks, by their IDs.
|Request info|Value|
|-|-|
|Endpoint|`/api/bookmarks`|
|Method|`DEL`|
|`X-Session-Id` Header|`sessionId`|

Body:
```json
[1, 2, 3]
```

# Tags
## Get tags
Gets the list of tags, their IDs and the number of entries that have those tags.
|Request info|Value|
|-|-|
|Endpoint|`/api/tags`|
|Method|`GET`|
|`X-Session-Id` Header|`sessionId`|

Returns:
```json
[
    {
        "id": 1,
        "name": "Cool",
        "nBookmarks": 1
    },
    {
        "id": 2,
        "name": "Interesting",
        "nBookmarks": 1
    }
```

## Rename tag
Renames a tag, provided its ID.
|Request info|Value|
|-|-|
|Endpoint|`/api/tag`|
|Method|`PUT`|
|`X-Session-Id` Header|`sessionId`|

Body:
```json
{
    "id": 1,
    "name": "TAG_NEW_NAME"
}
```

# Accounts
## List accounts
Gets the list of all user accounts, their IDs, and whether or not they are owners.
|Request info|Value|
|-|-|
|Endpoint|`/api/accounts`|
|Method|`GET`|
|`X-Session-Id` Header|`sessionId`|

Returns:
```json
[
    {
        "id": 1,
        "username": "shiori",
        "owner": true
    }
]
```

## Create account
Creates a new user.
|Request info|Value|
|-|-|
|Endpoint|`/api/accounts`|
|Method|`POST`|
|`X-Session-Id` Header|`sessionId`|
Body:
```json
{
	"username": "shiori2",
	"password": "gopher",
	"owner": false
}
```

## Edit account
Changes an account's password or owner status.
|Request info|Value|
|-|-|
|Endpoint|`/api/accounts`|
|Method|`PUT`|
|`X-Session-Id` Header|`sessionId`|
Body:
```json
{
	"username": "shiori",
	"oldPassword": "gopher",
	"newPassword": "gopher",
	"owner": true
}
```

## Delete accounts
Deletes a list of users.
|Request info|Value|
|-|-|
|Endpoint|`/api/accounts`|
|Method|`DEL`|
|`X-Session-Id` Header|`sessionId`|

Body:
```json
["shiori", "shiori2"]
```