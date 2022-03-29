//
//  Emojis.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 3/28/22.
//

import Foundation

class Emojis: ObservableObject{
    @Published var emojis = ["🤮", "😕", "😐", "🙂", "❤️"]
    func isEmoji(str: String) -> Bool{
        //🐙
        if(str.isEmpty || str.count > 1){
            return false
        }
        //https://developer.apple.com/documentation/swift/unicode/scalar/properties/3081577-isemoji disallowing nonemojis
        for scalar in str.unicodeScalars{
            let isEmoji = scalar.properties.isEmoji
            if(isEmoji == false){
                return false
            }
        }
        return true
    }
    
    //Don't need codable conformance!
    func encode(){
        let jsonEncoder = JSONEncoder()
        do{
            let encodedModel = try jsonEncoder.encode(emojis)
            let defaults = UserDefaults.standard
            defaults.set(encodedModel, forKey: "Activities")
        } catch{
            print("Encoding error")
        }
    }
    func decode(){
        let jsonDecoder = JSONDecoder()
        let defaults = UserDefaults.standard
        guard let retreivedData = defaults.data(forKey: "Activities") else{
            print("Couldn't retrieve data")
            return
        }
        do {
            let decodedModel = try jsonDecoder.decode([String].self, from: retreivedData)
            self.emojis = decodedModel
        } catch{
            print("Couldn't load")
        }
    }
}
