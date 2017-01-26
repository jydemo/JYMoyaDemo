//
//  Network.swift
//  JYMoyaDemo
//
//  Created by jay on 2017/1/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation

import Moya

public enum DS {
    
    case GetVideosByType(Int, Int, Int, Int)
    
}



let DSProvider = MoyaProvider<DS>()

extension DS: TargetType {
    
    /// The target's base `URL`.
    public var baseURL: URL {
        
        return URL(string: "https://api.doushi.me/v1/rest/video/")!
    
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        
        switch self {
        case .GetVideosByType(let vid, let count, let type,let userId):
            return ("getVideosByType/\(vid)/\(count)/\(type)/\(userId)")
        }
    
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        return .get
    }
    
    /// The parameters to be incoded in the request.
    public var parameters: [String: Any]? {
        
        switch self {
        default:
            return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        
        return URLEncoding.default
    }
    
    public var task: Task {
        
        return .request
    }
    
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        
        switch self {
        case .GetVideosByType:
            return "Half measures are as bad as nothing at all.".data(using: .utf8)!
        }
    }

}
