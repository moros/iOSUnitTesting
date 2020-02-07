//
//  DetailViewController.swift
//  iOSUnitTesting
//
//  Created by dmason on 2/7/20.
//

import UIKit

class DetailViewController: UIViewController
{
    let imageView = UIImageView()
    var selectedImage: String?
    
    override func loadView()
    {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage
        {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
}
