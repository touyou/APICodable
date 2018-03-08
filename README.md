# *WIP* APICodable

The library makes easiest way to access JSON API by Codable Power.

## Usage

First, you have to make api structure applied APICodable and response structure applied Codable.

```swift
struct GitHubAPI: APICodable {

    var baseURL: URL {

        return URL(string: "https://api.github.com/")
    }
}

struct User: Codable {

    var id: Int
    var name: String
}
```

Then you can fetch the data like below:

```swift
var user = GitHubAPI.get(User.self)
```
