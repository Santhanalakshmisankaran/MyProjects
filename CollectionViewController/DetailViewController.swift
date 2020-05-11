//
//  DetailViewController.swift
//  CollectionViewController
//
//  Created by Santhanalakshmi S on 10/05/20.
//  Copyright © 2020 Santhanalakshmi S. All rights reserved.
//
import UIKit
class DetailViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let Imageview = UIImageView()
        Imageview.frame = CGRect(x: 0, y: view.frame.height / 2 - 150, width: view.frame.width, height: 300)
        Imageview.image = UIImage(named: "")
        view.addSubview(Imageview)
        
    }
}
