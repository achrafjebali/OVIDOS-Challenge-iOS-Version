//
//  Photo.swift
//  showAlbums
//
//  Created by Achraf Jebali on 24/11/2016.
//  Copyright © 2016 Achraf Jebali. All rights reserved.
//

import Foundation
class Photo
{
    private var _albumId : String
    private var _Id:String
    private var _Title : String
    private var _url : String
    private var _thumbailUrl : String
    var vImageData:NSData?
    // getters
    var userID:String{
        return _albumId
    }
    var id:String{
        return _Id
    }
    var title:String{
        return _Title
    }
    var url:String {
        return _url
    }
    var thumbailurl:String{
        return _thumbailUrl
    }
    // Constructor
    init (data:JSONDictionnary)
    {
        // get Album ID
        if let  id = data["albumId"] as? String {
            self._albumId = id
        }
        else
        {
            _albumId=""
        }
        // get Album ID
        if let  id = data["id"] as? String {
            self._Id = id
        }
        else
        {
            _Id=""
        }
        // get Album Title
        if let  title = data["title"] as? String {
            self._Title = title
        }
        else
        {
            _Title=""
        }
        // get photo URL
        if let  url = data["url"] as? String {
            self._url = url
        }
        else
        {
            _url=""
        }
        // get Thumbail photo URL
        if let  thumbailurl = data["thumbnailUrl"] as? String {
            self._thumbailUrl = thumbailurl
        }
        else
        {
            _thumbailUrl=""
        }

    }
    
}
