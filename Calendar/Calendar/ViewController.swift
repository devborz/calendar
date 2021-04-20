//
//  ViewController.swift
//  Calendar
//
//  Created by Усман Туркаев on 21.04.2021.
//

import UIKit
import WayCalendar


class ViewController: UIViewController {
    
    let calendar = WayCalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        calendar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        calendar.heightAnchor.constraint(equalTo: calendar.widthAnchor).isActive = true
    }


}

