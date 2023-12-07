//
//  SpaceXCollectionViewCell.swift
//  CollectionViewStoryboard
//
//  Created by Yoshua Ubaldo Marquez on 04/12/23.
//

import UIKit

class SpaceXCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageNaves: UIImageView!

  override func awakeFromNib() {
        super.awakeFromNib()
    }
  func initUI(naves : ModelNaves){
    imageNaves.backgroundColor = .blue
    
//    labelMission.text = naves.mission_name
//    labelMission.numberOfLines = 3
//
//    labelMarca.text = "Hola Mundo"
//    labelFechaa.text = "Fecha"
  }

}
