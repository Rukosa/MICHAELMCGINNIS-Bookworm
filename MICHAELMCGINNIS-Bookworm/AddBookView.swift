//
//  AddBookView.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 3/28/22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["No genre", "Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        if(title.isEmpty){
                            newBook.title = "No title"
                        }
                        else{
                            newBook.title = title
                        }
                        if(author.isEmpty){
                            newBook.author = "No author"
                        }
                        else{
                            newBook.author = author
                        }
                        newBook.rating = Int16(rating)
                        if(genre.isEmpty){
                            genre = genres[0]
                        }
                        else{
                        newBook.genre = genre
                        }
                        newBook.review = review
                        
                        let today = Date()
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        newBook.date = formatter.string(from: today)
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
