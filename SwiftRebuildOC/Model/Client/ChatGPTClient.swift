//
//  ChatGPTClient.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2023/4/5.
//  Copyright © 2023 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Alamofire

class ChatGPTClient {
    
    let baseURL = "https://api.openai.com/v1"
    let headers: HTTPHeaders = ["Authorization": "Bearer <YOUR_API_KEY>"]
    
    func ChatGPT(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "prompt": prompt,
            "temperature": 0.5,
            "max_tokens": 50
        ]
        
        let headers: HTTPHeaders = ["Authorization": "Bearer $OPENAI_API_KEY"]
        
        AF.request(CHATGPT_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: ChatGPTResponse.self) { response in
                switch response.result {
                case .success(let chatGPTResponse):
                    completion(.success(chatGPTResponse.choices[0].text))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
