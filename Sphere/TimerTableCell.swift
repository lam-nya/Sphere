//
//  TimerTableCell.swift
//  Sphere
//
//  Created by Igor Kuzmin on 05.09.2021.
//

import Foundation
import UIKit

class TimerTableCell: UITableViewCell {
    let timerNameInTable: UILabel = UILabel()
    let timerLengthInTable: UILabel = UILabel()
    let pauseButtonInCell: UIButton = UIButton()
    var cellIsOnPause = false

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        timerNameInTable.translatesAutoresizingMaskIntoConstraints = false
        timerLengthInTable.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(timerNameInTable)
        contentView.addSubview(timerLengthInTable)
        
        pauseButtonInCell.translatesAutoresizingMaskIntoConstraints = false
        pauseButtonInCell.setTitle("-", for: .normal)
        pauseButtonInCell.layer.cornerRadius = 5
        pauseButtonInCell.backgroundColor = .systemGray5
        pauseButtonInCell.addTarget(self, action: #selector(cellPauseTimer), for: .touchUpInside)
        contentView.addSubview(pauseButtonInCell)
        
        
        
        let viewsDict = [
            "name": timerNameInTable,
            "length": timerLengthInTable,
            "pause": pauseButtonInCell
        ]
        
        
        
        var allConstraints: [NSLayoutConstraint] = []
            allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-[pause]-[length]-|", options: [], metrics: nil, views: viewsDict)
        NSLayoutConstraint.activate(allConstraints)

    }
   
    @objc func cellPauseTimer (_ sender: UIButton) {
       // print("pause button tapped")

        if cellIsOnPause {
            cellIsOnPause = false
            pauseButtonInCell.setTitle("-", for: .normal)
        } else  {
            cellIsOnPause = true
            pauseButtonInCell.setTitle("+", for: .normal)
        }
    } //end cellPauseTimer
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

