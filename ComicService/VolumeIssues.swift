//
//  Issues.swift
//  ComicList
//
//  Created by Antonio Benavente del Moral on 11/10/16.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import Foundation


/// A comic issue
public struct Issue {
    
    /// Issue title
    public let title: String
    
    /// Cover image URL
    public let coverURL: URL?
}


extension Issue: JSONDecodable {
    
    public init?(dictionary: JSONDictionary) {
        
        var dataURL = (dictionary["image"] as! JSONDictionary)
        var dataTitle = (dictionary["volume"] as! JSONDictionary)
        
        self.title = dataTitle["name"] as! String
        self.coverURL = URL(string:dataURL["medium_url"] as! String)
        
        
    }

    
    
}







