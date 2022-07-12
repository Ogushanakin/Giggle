//
//  HomeViewController.swift
//  Giggle
//
//  Created by AKIN on 10.07.2022.
//

import UIKit

class HomeViewController: UIViewController {

    private let timelineTableView:UITableView = {
        let tableView = UITableView()
        tableView.register(GiggleTableViewCell.self,
                           forCellReuseIdentifier: GiggleTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GiggleTableViewCell.identifier, for: indexPath) as? GiggleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: GiggleTableViewCellDelegate {
    func giggleTableViewCellTapReply() {
        print("Reply")
    }
    
    func giggleTableViewCellTapRegiggle() {
        print("Regiggle")
    }
    
    func giggleTableViewCellTapLike() {
        print("Like")
    }
    
    func giggleTableViewCellTapShare() {
        print("Share")
    }
}
