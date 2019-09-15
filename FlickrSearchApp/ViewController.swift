//
//  ViewController.swift
//  FlickrSearchApp
//
//  Created by Aman Taneja on 14/09/19.
//  Copyright © 2019 Aman Taneja. All rights reserved.
//

import UIKit

enum gridSize: Int {
    
    case one = 1
    case two
    case three
    case four
}

class ViewController: UIViewController {

    private var gridColumns: gridSize = .three
    private var edgeInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    convenience init(withViewModel: Int) {
        self.init(nibName:nil, bundle:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func toggleSearchBar() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // The gridcolumns give the number of images to be shown. However the number of spaces wll be 1 more than the number of columns.
        let screenWidth = view.frame.width - CGFloat(10 * (gridColumns.rawValue + 1) )
        let widthPerItem = screenWidth / CGFloat(gridColumns.rawValue + 1)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return edgeInset
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInset.left
    }
    
    
    
}


extension ViewController : UISearchBarDelegate {
    
    func addDoneButtonForKeyboard() {
       
        self.searchBar.inputAccessoryView = keyBoardToolbar
        self.searchBar.inputAccessoryView!.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
    }
    
    
}
