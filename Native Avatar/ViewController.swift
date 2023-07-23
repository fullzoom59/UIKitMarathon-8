//
//  ViewController.swift
//  Native Avatar
//
//  Created by fullzoom on 22.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        return scrollView
    }()
    
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        title = "Avatar"
        scrollView.delegate = self
        setupImage()
    }
    
    
    private func setupImage(){
        guard let navigationBar = navigationController?.navigationBar else { return }
        for subview in navigationBar.subviews {
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
                subview.addSubview(image)
                
                image.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    image.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -20),
                    image.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 20),
                    image.bottomAnchor.constraint(equalTo: image.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10),
                    image.heightAnchor.constraint(equalToConstant: 36),
                    image.widthAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
}
