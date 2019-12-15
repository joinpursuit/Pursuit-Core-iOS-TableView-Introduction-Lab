//
//  SubtitleTableViewCell.swift
//  TVIntroLab
//
//  Created by Ahad Islam on 12/14/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
