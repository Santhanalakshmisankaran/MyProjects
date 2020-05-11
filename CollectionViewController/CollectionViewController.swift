//
//  ViewController.swift
//  CollectionViewController
//
//  Created by Santhanalakshmi S on 29/01/20.
//  Copyright © 2020 Santhanalakshmi S. All rights reserved.
//

import UIKit
var yes:Bool = false
var list:[String] = []
var selectCell : CustomCell?
var selectedIndexPath : IndexPath?
class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    var nameArray = ["apple" , "orange" , "mango" , "papaya" , "grapes" , "lemon"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CustomCell
        if indexPath == selectedIndexPath {
            cell.imageview.alpha = 0.5
        } else {
            cell.imageview.alpha = 1
        }
        cell.image(name1: nameArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:(view.frame.width/3)-16  , height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if yes
        {
            var indexPaths: [IndexPath] = [indexPath]
            if let previousSelectedIndexPath = selectedIndexPath {
                indexPaths.append(previousSelectedIndexPath)
                if let indexOfElement = list.firstIndex(of: nameArray[previousSelectedIndexPath.row]){
                    list.remove(at: indexOfElement)
                }
            }
            selectedIndexPath = indexPath
            list.append(nameArray[indexPath.row])
            collectionView.reloadItems(at: indexPaths)
//            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
//            if selectCell != nil{
//                selectCell?.imageview.alpha = 1
//                let name = nameArray[selectedIndexPath!.row]
//                let index = list.firstIndex(of: name)
//                list.remove(at: index!)
//
//            }
//            selectCell = cell
//            selectedIndexPath = indexPath
//            if cell.imageview.alpha < 0.5
//            {
//                cell.imageview.alpha = 1
//                let name = nameArray[indexPath.row]
//                let  index = list.firstIndex(of: name)
//                list.remove(at: index!)
//                print(list)
//
//            }
//            else{
//                cell.imageview.alpha = 0.4
//                list.append(nameArray[indexPath.row])
//                print(indexPath.row)
//                print(list)
//            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        navigationItem.title = "Collection View"
        navigationController?.navigationBar.barTintColor = .yellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemPink , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24)]
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "mycell")
        let selectButton = UIBarButtonItem(title: "select", style: .plain, target: self, action: #selector(select(sender:)))
        collectionView.allowsMultipleSelection = false
        navigationItem.rightBarButtonItem = selectButton
        let deleteButton = UIBarButtonItem(title: "delete", style: .plain, target: self, action: #selector(deleteelement(sender:)))
        navigationItem.leftBarButtonItem = deleteButton
    }
    
    @objc func select(sender:UIBarButtonItem)
    {
        yes = true
    }
    @objc func deleteelement(sender:UIBarButtonItem)
    {
        for item in list
        {
            let index = nameArray.firstIndex(of: item)
            nameArray.remove(at: index!)
            collectionView.deleteItems(at: [IndexPath(row: index!, section: 0)])
            selectedIndexPath = nil
            selectCell = nil
        }
        list.removeAll()
    }
    
}
class CustomCell : UICollectionViewCell
{
    var vc = CollectionViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageview.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 80)
        imageview.contentMode = .scaleAspectFill
        self.addSubview(imageview)
    }
    let imageview = UIImageView()
    let button = UIButton()
    func image(name1:String)
    {
        imageview.image = UIImage(named: name1)
        
        
        button.frame = CGRect(x: 0, y:0, width: contentView.frame.width, height:80)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(btnmethod(button:)), for: .touchUpInside)
        
        //self.addSubview(button)
        let name = UILabel()
        name.text = name1
        name.textAlignment = .center
        name.textColor = .black
        name.backgroundColor = .white
        name.frame = CGRect(x: 0, y: 80, width: contentView.frame.width, height: 15)
        self.addSubview(name)
    }
    
    @objc func btnmethod(button:UIButton)
    {
        if yes == true
        {
            button.isSelected.toggle()
            if button.isSelected {
                imageview.alpha = 0.4
            } else {
                imageview.alpha = 1
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
