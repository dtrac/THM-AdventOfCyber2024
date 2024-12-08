# Notes for Day7

## Theme: **AWS CloudTrail / JQ**

## Links:

- [Logging](https://tryhackme.com/r/room/loguniverse)

## General

# 5 Basic and Useful `jq` Queries for CloudTrail JSON Data

CloudTrail logs contain valuable information about AWS activities. Here are five `jq` queries that can help you analyze typical CloudTrail JSON data.

| Query                                                                                                                   | Explanation                                                                                          |
|-------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| `jq -r '.Records[] | [.eventTime, .eventName, .userIdentity.userName // "N/A"]'`                                        | Lists event times, event names, and usernames for all records. The `// "N/A"` handles missing fields.|
| `jq -r '.Records[] | select(.eventSource == "s3.amazonaws.com") | [.eventTime, .eventName, .requestParameters.bucketName]'` | Filters logs to show only S3-related events, including event times, names, and bucket names.         |
| `jq -r '.Records[] | select(.eventName == "CreateUser") | [.eventTime, .userIdentity.userName, .sourceIPAddress]'`       | Shows details of `CreateUser` events, including event times, usernames, and source IP addresses.     |
| `jq -r '.Records[] | group_by(.userIdentity.userName) | map({user: .[0].userIdentity.userName, events: length})'`      | Groups events by user and counts the number of events per user.                                      |
| `jq -r '.Records[] | .errorCode? // empty | select(. != null)'`                                                     | Extracts error codes from logs, showing only those with non-null error codes.                        |

### Example CloudTrail JSON Structure
To better understand these queries, here’s an example of a typical CloudTrail JSON structure:

```json
{
  "Records": [
    {
      "eventTime": "2023-12-01T12:34:56Z",
      "eventName": "CreateUser",
      "eventSource": "iam.amazonaws.com",
      "userIdentity": {
        "userName": "admin-user"
      },
      "sourceIPAddress": "192.0.2.0",
      "requestParameters": {
        "bucketName": "example-bucket"
      }
    }
  ]
}
