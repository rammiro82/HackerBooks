//
//  LibraryModel.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 11/12/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

class Library {
    var books   : [Book]
    var tags    : [String]
    
    static let URL_JSON = "https://t.co/K9ziV0z3SJ"
    static let LOCAL_LIBRARY_DATA = "HackersBooks_local_data"
    
    var countBooks : Int {
        get{
            return self.books.count
        }
    }
    
    var countTags: Int{
        get{
            return self.tags.count
        }
    }
    
    init(books: [Book], tags: [String]){
        self.books = books
        self.tags  = tags
    }
    
    // Cantidad de libros que hay en una temática
    func bookCountForTag(tag: String?) -> Int{
        return 0
    }
    
    func booksForTag (tag: String) -> [Book]? {
        return nil
    }
    
    func bookAtIndex (index: Int) -> Book?{
        return nil
    }
    
    private static func procesarTags(books: [Book]) -> [String]{
        var todasTags: [String] = []
        
        todasTags.append("")
        for book in books{
            for tag in book.tags{
                //procesamos todos los tags de cada libro
                if(!todasTags.contains(tag)){
                    todasTags.append(tag)
                }
            }
        }
        
        return todasTags
    }
}


extension Library{
    convenience init(books: [Book]){
        let tags = Library.procesarTags(books)
        
        self.init(books: books, tags: tags)
    }
}