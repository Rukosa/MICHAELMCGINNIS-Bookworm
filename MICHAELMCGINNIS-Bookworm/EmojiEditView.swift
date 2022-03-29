//
//  EmojiEditView.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 3/28/22.
//

import SwiftUI

struct EmojiEditView: View {
    @Environment(\.dismiss) var dismiss

    //@StateObject var emojiList = Emojis()
    @ObservedObject var emojiList: Emojis
    
    @State private var emoji1 = ""
    @State private var emoji2 = ""
    @State private var emoji3 = ""
    @State private var emoji4 = ""
    @State private var emoji5 = ""
    
    //Cant use emojilist to set my @State wrappers so I do it here as a workaround
    func setEmojis(){
        emoji1 = emojiList.emojis[0]
        emoji2 = emojiList.emojis[1]
        emoji3 = emojiList.emojis[2]
        emoji4 = emojiList.emojis[3]
        emoji5 = emojiList.emojis[4]
    }
    var body: some View {
        NavigationView{
            VStack{
            Text("Tap an emoji to change")
                .font(.title)
            TextField("Rating 1", text: $emoji1)
                    .padding(.leading, 140)
            TextField("Rating 2", text: $emoji2)
                    .padding(.leading, 140)
            TextField("Rating 3", text: $emoji3)
                    .padding(.leading, 140)
            TextField("Rating 4", text: $emoji4)
                    .padding(.leading, 140)
            TextField("Rating 5", text: $emoji5)
                    .padding(.leading, 140)
            Button("Save"){
                //Rating 1
                if(!emojiList.isEmoji(str: emoji1)){
                    emojiList.emojis[0] = "🤮"
                }else{
                    emojiList.emojis[0] = emoji1
                }
                
                //Rating 2
                if(!emojiList.isEmoji(str: emoji2)){
                    emojiList.emojis[1] = "😕"
                }else{
                    emojiList.emojis[1] = emoji2
                }
                
                //Rating 3
                if(!emojiList.isEmoji(str: emoji3)){
                    emojiList.emojis[2] = "😐"
                }else{
                    emojiList.emojis[2] = emoji3
                }
                
                //Rating 4
                if(!emojiList.isEmoji(str: emoji4)){
                    emojiList.emojis[3] = "🙂"
                }else{
                    emojiList.emojis[3] = emoji4
                }
                
                //Rating 5
                if(!emojiList.isEmoji(str: emoji5)){
                    emojiList.emojis[4] = "❤️"
                }else{
                    emojiList.emojis[4] = emoji5
                }
                
                emojiList.encode()
                dismiss()
            }
        }
        .font(.largeTitle)
        .onAppear(perform: setEmojis)
        .navigationTitle("Emoji Editor")
        }
    }
}

struct EmojiEditView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiEditView(emojiList: Emojis())
    }
}
