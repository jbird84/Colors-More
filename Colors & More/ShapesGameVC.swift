//
//  ShapesGameVC.swift
//  Colors & More
//
//  Created by Kinney Kare on 12/21/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class ShapesGameVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleOfPage: UILabel!
    @IBOutlet weak var numberOfScore: UILabel!
    @IBOutlet weak var strikeOne: UIButton!
    @IBOutlet weak var strikeTwo: UIButton!
    @IBOutlet weak var strikeThree: UIButton!
    
    var shapes = [Shape]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initShapes()
        setDelegates()
        setupCollectionView()
        hideStrikes()
     
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ShapesGameVC {
    /// Hides all three strink images
    fileprivate func hideStrikes() {
        strikeOne.isHidden = true
        strikeTwo.isHidden = true
        strikeThree.isHidden = true
    }
    
    fileprivate func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    fileprivate func setupCollectionView() {
        let cellWidth : CGFloat = collectionView.frame.size.width / 3.0
        let cellSize = CGSize(width: cellWidth , height: cellWidth)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
    
    fileprivate func initShapes() {
        var colors: [UIColor] = [.black, .blue, .green, .gray, .orange, .brown, .purple, .red, .yellow].shuffled()
        let pentagon = Shape(image: #imageLiteral(resourceName: "black pentagon"), color: colors[0], type: .Pentagon)
        colors.removeFirst()
        let square = Shape(image: #imageLiteral(resourceName: "blue square"), color: colors[0], type: .Square)
        colors.removeFirst()
        let oval = Shape(image: #imageLiteral(resourceName: "green oval"), color: colors[0], type: .Oval)
        colors.removeFirst()
        let rectangle = Shape(image: #imageLiteral(resourceName: "grey rectangle"), color: colors[0], type: .Rectangle)
        colors.removeFirst()
        let octagon = Shape(image: #imageLiteral(resourceName: "orange octagon"), color: colors[0], type: .Octogon)
        colors.removeFirst()
        let star = Shape(image: #imageLiteral(resourceName: "pink star"), color: colors[0], type: .Star)
        colors.removeFirst()
        let plus = Shape(image: #imageLiteral(resourceName: "purple plus"), color: colors[0], type: .PlusSign)
        colors.removeFirst()
        let triangle = Shape(image: #imageLiteral(resourceName: "red triangle"), color: colors[0], type: .Triangle)
        colors.removeFirst()
        let cirle = Shape(image: #imageLiteral(resourceName: "yellow circle"), color: colors[0], type: .Circle)
        shapes = [pentagon, square, oval, rectangle, octagon, star, plus, triangle, cirle].shuffled()
        
    }
}

extension ShapesGameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shapes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shapeCell", for: indexPath) as? ShapeCollectionViewCell else { fatalError() }
        cell.shape = shapes[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Handle user tap
    }
}


extension ShapesGameVC: UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
