//
//  WorldFlagsDetailViewController.swift
//  WorldFlagsChallenge
//
//  Created by Iskandar Herputra Wahidiyat on 30/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class WorldFlagsDetailViewController: UIViewController {

    //MARK: - PROPERTIES
    var selectedImage: String?
    var flagImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Detail page"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            flagImageView.image = UIImage(named: imageToLoad)
        }
        
        setupFlagImageView()
    }
    
    //MARK: - SETUP UI
    func setupFlagImageView() {
        view.addSubview(flagImageView)
        
        setFlagImageViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setFlagImageViewConstraints() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func shareTapped() {
        guard let image = flagImageView.image?.jpegData(compressionQuality: 1.0) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
