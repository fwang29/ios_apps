//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
		
		let task = NSURLSession.sharedSession().dataTaskWithURL(imageURL{ (data, 
			response, error) in 	

			if error == nil {
				let downloadedImage = UIImage(data: data!)

				performUIUpdatesOnMain {	// make update to the UI
					self.imageView.image = downloadedImage
				}
			} 

		}
		
		task.resume()
    }
}
