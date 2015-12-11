//
//  BookModel.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 11/12/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit


class BookModel: Equatable, Comparable{
    
    //MARK: - Properties
    let title : String
    let authors : [String]
    let tags    : [String]
    let image   : UIImage
    let urlImage: NSURL
    let urlPDF  : NSURL
    
    var favorite : Bool {
        get{
            guard tags.count == 0 else{
                return false
            }
            return true
        }
    }
    
    //MARK: - Init
    init(title : String,
        authors : [String],
        tags    : [String],
        image   : UIImage,
        urlImage: NSURL,
        urlPDF  : NSURL){
        
            self.title      = title
            self.authors    = authors
            self.tags       = tags
            self.image      = image
            self.urlImage   = urlImage
            self.urlPDF     = urlPDF
    }
    
    
    //MARK: - Proxies

    
}


//MARK: - Operators
func == (lhs: BookModel, rhs: BookModel) -> Bool{
    //son el mismo objeto
    guard !(lhs === rhs) else{
        return true
    }
    
    // Caso genérico
    return (lhs.title == rhs.title)
}

func < (lhs: BookModel, rhs: BookModel) -> Bool{
    return (lhs.title < rhs.title)
}