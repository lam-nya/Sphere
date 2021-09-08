//
//  TimerTableCell.swift
//  Sphere
//
//  Created by Igor Kuzmin on 05.09.2021.
//

import Foundation
import UIKit

class TimerTableCell: UITableViewCell {
    let timerNameInTable: UILabel = UILabel();
    let timerLengthInTable: UILabel = UILabel();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        timerNameInTable.translatesAutoresizingMaskIntoConstraints = false
        timerLengthInTable.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(timerNameInTable)
        contentView.addSubview(timerLengthInTable)
        
        let viewsDict = [
            "name": timerNameInTable,
            "length": timerLengthInTable,
        ]
        
        
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[length]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[length]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[username]-[message]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-[image(10)]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[message]-[labTime]-|", options: [], metrics: nil, views: viewsDict))
        
        
        
        
        
        
        
        
        
//        NSLayoutConstraint.activate([
//            timerNameInTable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
//            timerLengthInTable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 32)
//
//
//        ])
        
        
        
        
        var allConstraints: [NSLayoutConstraint] = []
                allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-[length]-|", options: [], metrics: nil, views: viewsDict)
                
//                allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[length]|", options: [], metrics: nil, views: viewsDict)
//                allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[years]-|", options: [], metrics: nil, views: views)
//                allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(50)]-[name]-|", options: [], metrics: nil, views: views)
//                allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image]-[years]-[salary]-|", options: [], metrics: nil, views: views)
//
                 NSLayoutConstraint.activate(allConstraints)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

