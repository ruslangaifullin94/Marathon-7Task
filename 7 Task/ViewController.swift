//
//  ViewController.swift
//  7 Task
//
//  Created by Руслан Гайфуллин on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {
     
        private lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cat")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        
        private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            scrollView.contentInsetAdjustmentBehavior = .never
            scrollView.delegate = self
            scrollView.frame = view.bounds
            return scrollView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            scrollView.addSubview(imageView)
            view.addSubview(scrollView)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            scrollView.contentInset = UIEdgeInsets(top: 270, left: 0, bottom: scrollView.safeAreaInsets.bottom, right: 0)
            scrollView.contentOffset = CGPoint(x: 0, y: -scrollView.contentInset.top)
            scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
            imageView.frame = CGRect(x: 0, y: -270, width: scrollView.bounds.width, height: 270)
        }

    }

    extension ViewController: UIScrollViewDelegate {
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offsetY = scrollView.contentOffset.y
            
            if offsetY < -270 {
                var frame = imageView.frame
                frame.origin.y = offsetY
                frame.size.height = -offsetY
                imageView.frame = frame
                scrollView.verticalScrollIndicatorInsets.top = -offsetY - scrollView.safeAreaInsets.top
            }
        }
    }
