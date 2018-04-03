//
//  CollectionViewCell.swift
//  CollectionViewRestAPI
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var firstLbl: UILabel!
    
    @IBOutlet weak var secondLbl: UILabel!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
    }
}
