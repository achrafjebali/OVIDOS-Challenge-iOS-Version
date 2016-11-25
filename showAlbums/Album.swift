//
//  Album.swift
//  showAlbums
//
//  Created by Achraf Jebali on 24/11/2016.
//  Copyright © 2016 Achraf Jebali. All rights reserved.
//

import Foundation
class Album
{
    private var _userId : String
    private var _Id:String
    private var _Title : String
    // getters 
    var userID:String{
        return _userId
    }
    var id:String{
        return _Id
    }
    var title:String{
        return _Title
    }
    // Constructor 
    init (data:JSONDictionnary)
    {
        // get User ID
        if let  id = data["userId"] as? String {
            self._userId = id
        }
        else
        {
            _userId=""
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

        
    }
    
}
