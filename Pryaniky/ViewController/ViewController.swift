//
//  ViewController.swift
//  Pryaniky
//
//  Created by Anton Larchenko on 20.07.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pryanikData = [Data]()
    var pryanikView = [String]()

    private let webManager = WebManager()
    @IBOutlet weak var pryanikTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pryanikTableView.register(UINib(nibName: PryanikCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: PryanikCell.identifier)

        response()
    }
    
    func response() {
        webManager.loadPryanik { [unowned self] (pryanik) in
            self.pryanikData = pryanik.data
            self.pryanikView = pryanik.view
            DispatchQueue.main.async {
                self.pryanikTableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pryanikData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PryanikCell") as! PryanikCell
        let model = pryanikData[indexPath.row]
        cell.nameLabel.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = sender as? IndexPath {
                if let vc = segue.destination as? DetailViewController {
                    let model = pryanikData[indexPath.row]
                    
                    DispatchQueue.main.async {
                        vc.textLabel.text = model.data.text
                        vc.idLabel.text = String(model.data.variants?[indexPath.row].id ?? Int())
                        vc.selectedIdLabel.text = String(model.data.selectedId ?? Int())
                        vc.variantTextLabel.text = model.data.variants?[indexPath.row].text
                        
                        let oopsUrl = "https://png.pngitem.com/pimgs/s/252-2529729_picture-freeuse-explosion-like-text-bubbles-transprent-hd.png"
                        let url = URL(string: model.data.url ?? oopsUrl)
                        
                        URLSession.shared.dataTask(with: url!) { (data, response, error) in
                            guard let data = data else { return }
                            DispatchQueue.main.async {
                                vc.pryanikImageView.image = UIImage(data: data)
                            }
                        }.resume()
                    }
                    
                }
            }
        }
    }
    
}
