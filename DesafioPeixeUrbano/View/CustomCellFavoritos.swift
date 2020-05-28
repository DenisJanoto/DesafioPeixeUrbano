//
//  CustomCellFavoritos.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 17/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit

class CustomCellFavoritos: UITableViewCell {

    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func prepaparCelula(oferta:FavoritosController){
        lblDescricao.text = oferta.descricaoOferta
        var valor = String(format: "%.2f",oferta.valorOferta)
        lblValor.text = "\(valor)"
        
    }

}
