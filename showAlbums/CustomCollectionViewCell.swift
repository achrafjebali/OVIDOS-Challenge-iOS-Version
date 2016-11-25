//
//  CustomCollectionViewCell.swift
//  showAlbums
//
//  Created by Achraf Jebali on 24/11/2016.
//  Copyright © 2016 Achraf Jebali. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbail: UIImageView!
    @IBOutlet weak var name: UILabel!
    var photo : Photo?
        {
        didSet{
            updatecell()
        }
    }
    func updatecell(){
        name.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        name.text = photo?.title
        if photo!.vImageData != nil {
            print("Get Data from Array")
            thumbail.image = UIImage(data:photo!.vImageData!)
        }
        else{
            GetAlbumImage(photo!, imageview: thumbail)
        }
    }
    func GetAlbumImage (photo:Photo, imageview:UIImageView)
    // Background Thread
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            let data = NSData (contentsOfURL: NSURL(string : photo.thumbailurl)!)
            var image: UIImage?
            if data != nil {
                photo.vImageData = data
                image = UIImage(data:data!)
            }
            // move back to main thread 
            dispatch_async(dispatch_get_main_queue())
            {
              self.thumbail.image = image
            }
        }
        
    }
}
