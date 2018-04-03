//
//  ViewController.swift
//  CollectionViewRestAPI
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,PortalServiceDelegate,UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let portalService = PortalService()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        portalService.delegate = self
        portalService.getBlogData()
    }
    
    
    func sendBlogData(data: [Article]) {
        self.articles = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func errorBlogData(str: String) {
        print("viewDidLoad Error:\(str)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.firstLbl.text = self.articles[indexPath.row].title
        cell.firstLbl.preferredMaxLayoutWidth = 50
    
        cell.secondLbl.text = self.articles[indexPath.row].description
        cell.secondLbl.preferredMaxLayoutWidth = 50
        return cell
    }
    
 

    

    
}

