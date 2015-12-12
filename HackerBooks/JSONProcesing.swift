//
//  JSONProcesing.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 12/12/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

/*
{
    "authors": "Jeff Heard, Anand Rajaraman, Stefane Laborde",
    "image_url": "http://hackershelf.com/media/cache/06/df/06df282659657e529d8111e08aa79274.jpg",
    "pdf_url": "http://infolab.stanford.edu/~ullman/mmds/book.pdf",
    "tags": "data mining, text processing",
    "title": "Mining of Massive Datasets"
}
*/


//MARK: - Claves
enum JSONKeys: String{
    case authors = "authors"
    case imageUrl  = "image_url"
    case pdfUrl = "pdf_url"
    case tags = "tags"
    case title = "title"
}

//MARK: - Aliases
typealias JSONObject        = AnyObject
typealias JSONDictionary    = [String:JSONObject]
typealias JSONArray         = [JSONDictionary]

//MARK: - Errors
enum JSONProcessingError : ErrorType{
    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat
}

