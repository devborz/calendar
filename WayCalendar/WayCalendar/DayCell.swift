//
//  DayCell.swift
//  WayCalendar
//
//  Created by Усман Туркаев on 21.04.2021.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                UIView.animate(withDuration: 0.2) {
                    self.backView.backgroundColor = .systemBlue
                    self.numberLabel.textColor = .systemBackground
                    self.numberLabel.font = .systemFont(ofSize: 17, weight: .bold)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.backView.backgroundColor = .systemBackground
                    self.numberLabel.textColor = .secondaryLabel
                    self.numberLabel.font = .systemFont(ofSize: 17, weight: .medium)
                }
            }
        }
    }
    
    let backView = UIView()
    
    let numberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView.layer.cornerRadius = frame.size.width / 2
        backView.clipsToBounds = true
        backView.backgroundColor = .systemBackground
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: backView.widthAnchor).isActive = true
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(numberLabel)
        numberLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        numberLabel.textColor = .secondaryLabel
        numberLabel.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
