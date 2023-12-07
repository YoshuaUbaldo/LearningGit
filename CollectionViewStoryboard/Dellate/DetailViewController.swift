//
//  DetailViewController.swift
//  CollectionViewStoryboard
//
//  Created by Yoshua Ubaldo Marquez on 04/12/23.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var imageNave: UIImageView!
  override func viewDidLoad() {
        super.viewDidLoad()

      initUI()
    }
  func initUI() {
    imageNave.backgroundColor = .red
  }

}
