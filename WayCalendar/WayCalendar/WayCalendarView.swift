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
        collectionView.alwaysBounceVertical = false
        return collectionView
    }()
    
    private let currentMonthLabel = UILabel()
    
    public init() {
        super.init(frame: .zero)
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: "day")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "placeholder")
        
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
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 7),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            
            var groups: [NSCollectionLayoutGroup] = []
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1 / 5)
            )
            
            for _ in 1...5 {
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                groups.append(group)
            }
            
            let mainGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
            
            let mainGroup = NSCollectionLayoutGroup.vertical(layoutSize: mainGroupSize, subitems: groups)
            
            let section = NSCollectionLayoutSection(group: mainGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
                self?.didScroll(visibleItems, offset: point.x)
            }
            return section
        }
        return layout
    }
}

extension WayCalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 35 * 12
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day = (indexPath.item + 1) % 35
        if day > 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! DayCell
            cell.numberLabel.text = "\((indexPath.item + 1) % 35 - 4)"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "placeholder", for: indexPath)
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    private func didScroll(_ visibleItems: [NSCollectionLayoutVisibleItem], offset: CGFloat) {
//        if offset.truncatingRemainder(dividingBy: frame.width) == 0 {
        let remainder = offset.truncatingRemainder(dividingBy: frame.width)
        let index = Int(offset / frame.width) + (remainder > frame.width / 2 ? 1 : 0)
            var text = ""
            
            let month = Months(rawValue: index + 1)
            
            switch month {
            case .april:
                text = "April, 2021"
            case .none:
                text = ""
            case .some(.january):
                text = "January, 2021"
            case .some(.febrary):
                text = "Febrary, 2021"
            case .some(.march):
                text = "March, 2021"
            case .some(.may):
                text = "May, 2021"
            case .some(.june):
                text = "June, 2021"
            case .some(.july):
                text = "July, 2021"
            case .some(.august):
                text = "August, 2021"
            case .some(.september):
                text = "September, 2021"
            case .some(.october):
                text = "October, 2021"
            case .some(.november):
                text = "November, 2021"
            case .some(.december):
                text = "December, 2021"
            }
            
            currentMonthLabel.text = text
//        }
    }
}
