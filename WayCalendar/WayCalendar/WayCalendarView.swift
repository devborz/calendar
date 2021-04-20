//
//  WayCalendarView.swift
//  WayCalendar
//
//  Created by Усман Туркаев on 21.04.2021.
//

import UIKit

public class WayCalendarView: UIView {
    
    var currentYear: Int = 0
    var currentMonth: Int = 0
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private let currentMonthLabel = UILabel()
    
    public init() {
        super.init(frame: .zero)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MonthCell.self, forCellWithReuseIdentifier: "month")
        
        currentMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(currentMonthLabel)
        currentMonthLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        currentMonthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        currentMonthLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        currentMonthLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        currentMonthLabel.text = "April, 2021"
        currentMonthLabel.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WayCalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "month", for: indexPath) as! MonthCell
        cell.backgroundColor = .clear
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
