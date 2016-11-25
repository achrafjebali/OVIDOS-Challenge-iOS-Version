//
//  APIManager.swift
//  showAlbums
//
//  Created by Achraf Jebali on 24/11/2016.
//  Copyright © 2016 Achraf Jebali. All rights reserved.
//

import Foundation
class APIManager
{
    func loadData (urlString:String, completion:(result:[Album])->())
    {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        let url = NSURL(string:urlString)!
        let task = session.dataTaskWithURL(url)
        {
            (data,response,error) -> Void  in
            // pass data to the principal thread CallBack function
            
            if error != nil
            {
                dispatch_async(dispatch_get_main_queue())
                {
                    print(error!.localizedDescription)
                }
            }
            else
            {
                do
                {
                    if let json =  try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONArray
                    {
                        var albums = [Album]()
                        for entry in json{
                            let entry = Album(data:entry as! JSONDictionnary)
                            albums.append(entry)
                        }
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority,0))
                        {
                            dispatch_async(dispatch_get_main_queue())
                            {
                                // if success return the albums
                                completion(result:albums)
                            }
                        }
                    }
                }
                catch
                {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        print("Erreur in JSON Serialisation ")
                    }
                }
                // end Json serialisation
            }
        }
        task.resume()
}
    // second  thread thar serialize photos albums 
    func loadPhotoData (urlString:String, completion:(result:[Photo])->())
    {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        let url = NSURL(string:urlString)!
        let task = session.dataTaskWithURL(url)
        {
            (data,response,error) -> Void  in
            // pass data to the principal thread CallBack function
            
            if error != nil
            {
                dispatch_async(dispatch_get_main_queue())
                {
                    print(error!.localizedDescription)
                }
            }
            else
            {
                do
                {
                    if let json =  try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONArray
                    {
                        var Photos = [Photo]()
                        for entry in json{
                            let entry = Photo(data:entry as! JSONDictionnary)
                            Photos.append(entry)
                        }
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority,0))
                        {
                            dispatch_async(dispatch_get_main_queue())
                            {
                                // if success return the albums
                                completion(result:Photos)
                            }
                        }
                    }
                }
                catch
                {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        print("Erreur in JSON Serialisation ")
                    }
                }
                // end Json serialisation
            }
        }
        task.resume()
    }

}
