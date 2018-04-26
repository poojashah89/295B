//
//  ChatModel.swift
//  DermaCare
//
//  Created by Pooj on 4/23/18.
//  Copyright © 2018 Pooja. All rights reserved.
//

import Foundation
import UIKit

class ChatModel: NSObject {
    var message: String?
    var time: String?
    
    init(dictionary: NSDictionary) {
        message = dictionary["message"] as? String
        time = dictionary["time"] as? String
    }
    class func ChatModelData(chatMessage: NSDictionary) -> ChatModel {
        let chatm = ChatModel(dictionary: chatMessage)
        return chatm
    }
    
    class func getChatString(message: String, callback: @escaping (ChatModel) -> ()) {
        let path = "http://18.236.185.72:5000/chat?chat='\(message)'"
        
        let url = URL(string: path)
        let session = URLSession.shared
        let task = session.dataTask(with: url! as URL, completionHandler: {jsonData, response, error -> Void in
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                print(error as Any)
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData!, options:.allowFragments) as? [String:Any] {
                    
                    let chatMessage = json as NSDictionary
                    let chatm = ChatModel(dictionary: chatMessage)
                    //callback(ChatModel.ChatModelData(chatMessage: chatMessage))
                    callback(chatm)
                }
            } catch let err{
                print(err.localizedDescription)
            }
            
        })
        task.resume()
        
    }
    
}