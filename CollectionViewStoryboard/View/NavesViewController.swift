//
//  NavesViewController.swift
//  CollectionViewStoryboard
//
//  Created by Yoshua Ubaldo Marquez on 04/12/23.
//

import UIKit

class NavesViewController: UIViewController {
  
  @IBOutlet weak var navesCollectionView: UICollectionView!
  
  @IBOutlet weak var lanchesLabel: UILabel!

  var dataSource = [ModelNaves]()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
    getData()
    initUI()
  }
    
  func getData(){
    let networkManager = NetworkManager()
    networkManager.delegate = self
    networkManager.getSpaceXList()
  }
  
  func initUI(){
    
    navesCollectionView.delegate = self
    navesCollectionView.dataSource = self
    
    navesCollectionView.register(UINib(nibName: "SpaceXCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCellIdentifier")
    
    lanchesLabel.text = "Launches Past"
//    navesCollectionView.addAnchorsWithMargin(0)
  }
}
extension NavesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let info = dataSource[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellIdentifier", for: indexPath) as! SpaceXCollectionViewCell
    cell.initUI(naves: info)
    
    cell.layer.cornerRadius = 10
    cell.clipsToBounds = true
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let navigation = DetailViewController()
    navigation.modalPresentationStyle = .formSheet
    self.present(navigation, animated: true)
  }
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//      return 5
//  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      
      return 3
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: (width / 1 - 70 ), height: height / 8 )
  }
}
    
    

  extension NavesViewController : NetworkManagerDelegate{
    func responseSuccess(response: [ModelNaves]) {
      dataSource.append(contentsOf: response)
      print("responseSucess\(response)")
      navesCollectionView.reloadData()
    }
    
    func responseError(error: Error) {
      print("responseError: \(error)")
    }
    
  }

