//
//  NetworkLogger.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//
import Alamofire
import Foundation

class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "com.yourapp.networklogger")

    func requestDidResume(_ request: Request) {
        print("Request Started: \(request.description)")
    }

    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("Request Finished: \(request.description)")
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Response Data: \(utf8Text)")
        } else {
            print("Failed to parse response data")
        }
    }

    func request(_ request: Request, didFailTask task: URLSessionTask, earlyWithError error: Error) {
        print("Request Failed: \(request.description)")
        print("Error: \(error.localizedDescription)")
    }
}
