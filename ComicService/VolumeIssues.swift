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




extension Issue{
    public init?(title:String, coverURL: URL){
        self.title = title
        self.coverURL = coverURL
    }
}







// Pendiente de borrar

public struct VolumeIssues{
    
    public let issues:[Issue]
    
}

extension VolumeIssues: JSONDecodable {
    
    public init?(dictionary: JSONDictionary) {
        
        var dataURL = (dictionary["image"] as! JSONDictionary)
        var dataTitle = (dictionary["volume"] as! JSONDictionary)

        Issue(title:dataTitle["name"] as! String, coverURL: URL(string:dataURL["medium_url"] as! String))
               issues = [Issue(title: "Caballo blanco caballo negroorl", coverURL: URL(string: "http://static.comicvine.com/uploads/scale_small/3/38919/1503818-thanos_imperative_6.jpg")),
        
        Issue(title: "Quietooor diodeno", coverURL: URL(string: "http://static.comicvine.com/uploads/scale_small/3/39027/4609736-4608485-cgxpqgqw0aao_8t+-+copy.jpg"))
        ]
        
        
        

    }
    
    
}
