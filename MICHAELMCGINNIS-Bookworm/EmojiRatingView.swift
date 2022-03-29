//
//  EmojiRatingView.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 3/28/22.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    @ObservedObject var emojiList: Emojis
    
    var body: some View {
        switch rating {
        case 1:
            Text(emojiList.emojis[0])
        case 2:
            Text(emojiList.emojis[1])
        case 3:
            //Text(emojiList.emojis[2])
            Text(emojiList.emojis[2])
        case 4:
            Text(emojiList.emojis[3])
        default:
            Text(emojiList.emojis[4])
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3, emojiList: Emojis())
    }
}
