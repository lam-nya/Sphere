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
        
        
        
        var allConstraints: [NSLayoutConstraint] = []
            allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-[length]-|", options: [], metrics: nil, views: viewsDict)
        NSLayoutConstraint.activate(allConstraints)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

