//
//  WorldFlagsViewController.swift
//  WorldFlagsChallenge
//
//  Created by Iskandar Herputra Wahidiyat on 30/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class WorldFlagsViewController: UIViewController {

    //MARK: - PROPERTIES
    var flags = [UIImage(named: "estonia"), UIImage(named: "france"), UIImage(named: "germany"), UIImage(named: "ireland"), UIImage(named: "monaco"), UIImage(named: "nigeria"), UIImage(named: "poland"), UIImage(named: "russia"), UIImage(named: "spain"), UIImage(named: "uk"), UIImage(named: "us")]
    var flagList = [String]()
    let tableView = UITableView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Flag List"
        view.backgroundColor = .white
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix("png") {
                flagList.append(item)
            }
        }
        print(flagList)
        
        setupTableView()
        setupStackView()
    }

    //MARK: - SETUP UI
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(tableView)
        
        setStackViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS

}

extension WorldFlagsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return flags.count
        return flagList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "FlagCell")
    
        //cell.imageView?.image = flags[indexPath.row]
        cell.imageView?.image = UIImage(named: flagList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worldFlagsDetailViewController = WorldFlagsDetailViewController()
        navigationController?.pushViewController(worldFlagsDetailViewController, animated: true)
        //worldFlagsDetailViewController.flagImageView.image = flags[indexPath.row]
        //worldFlagsDetailViewController.flagImageView.image = UIImage(named: flagList[indexPath.row])
        worldFlagsDetailViewController.selectedImage = flagList[indexPath.row]
    }
    

}
