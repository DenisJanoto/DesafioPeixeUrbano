//
//  CustomViewCellCidade.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit

class CustomViewCellCidade: UITableViewCell {
    @IBOutlet weak var ImCidade: UIImageView!
    @IBOutlet weak var lbNomeLocal: UILabel!
    @IBOutlet weak var lbDescricao: UILabel!
    @IBOutlet weak var lbValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
