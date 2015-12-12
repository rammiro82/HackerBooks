//
//  LibraryModel.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 11/12/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

class Libray {
    var books   : [Book]
    var tags    : [String]
    
    static let URL_JSON = "https"
    
    var countBooks : Int {
        get{
            return self.books.count
        }
    }
    
    init(){
        self.books = [Book]()
        self.tags  = [String]()
    }
    
    func bookCountForTag(tag: String?) -> Int{
        return 0
    }
    
    func booksForTag (tag: String) -> [Book]? {
        return nil
    }
    
    func bookAtIndex (index: Int) -> Book?{
        return nil
    }
}