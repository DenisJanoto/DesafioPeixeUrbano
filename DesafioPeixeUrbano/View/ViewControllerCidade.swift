//
//  ViewControllerCidade.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit

class ViewControllerCidade: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let celula = tableView.dequeueReusableCell(withIdentifier: "celulaCidade", for: indexPath)
        
        return celula
    }


}
