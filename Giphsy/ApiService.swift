//
//  ApiService.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import Foundation
import Moya

enum APIService {
  case searchGalleries(filter: String?, query: String)
}

extension APIService : TargetType {
  var baseURL: URL {
    return URL(string: "https://api.imgur.com/3")!
  }
  
  var path: String {
    switch self {
    case .searchGalleries(let filter,_):
      return "/gallery/search/\(filter ?? "time")"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .searchGalleries:
      return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .searchGalleries(_, let query):
      return ["q":query]
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .searchGalleries:
      return JSONEncoding.default
    }
  }
  
  var headers: [String: String]? {
    return ["Authorization": "Client-ID cfd2e300f6beb55"]
  }
  
  var sampleData: Data {
    switch self {
    case .searchGalleries:
      return "\"data\": [{\"id\": \"D5Ii2\",\"title\": \"The cats emotions: mistrust/calmness\",\"cover\": \"viRgjTy\",\"comment_count\": 0,\"images\": [ {\"id\": \"viRgjTy\",\"title\": null,\"link\": \"http://i.imgur.com/viRgjTy.jpg\",\"comment_count\": null,\"tags\": [{\"name\": \"cats\",\"accent\": \"BF63A7\"}]}]}]".data(using: .utf8)!
    }
  }
  
  var task: Task {
    switch self {
    case .searchGalleries:
      return .request
    }
  }
  
}
