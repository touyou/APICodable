# *WIP* APICodable

The library makes easiest way to access JSON API by Codable Power.

## Usage

First, you have to make api structure applied APICodable and response structure applied Codable.

```swift
struct GitHubAPI: APICodable {

    static let shared = GitHubAPI()

    // You must set baseURLString
    var baseURLString: String {

        return "https://api.github.com"
    }

    // You may implement query. This will apply for all request.
    var query: Query {

        let query = Query()
        query.add("access_token", "xxx-xxx-xxx")
        return query
    }
}

struct User: Codable {

    let id: Int
    let name: String
    let login: String
}

struct Event: Codable {

    let id: String
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
    }
}
```

Then you can fetch the data like below:

```swift
var user = GitHubAPI.shared.get(User.self, to: "/user")

// You can add customized query like this:
let eventQuery = Query()
eventQuery.add("page", 1)
eventQuery.add("per_page", 20)
var events = GitHubAPI.shared.get(Event.self, to: "/users/\(user.login)/received_events", with: eventQuery)
```
