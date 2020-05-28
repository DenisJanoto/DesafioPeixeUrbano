//
//  CustomViewCellProdutos.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit
import Kingfisher

class CustomViewCellProdutos: UITableViewCell {
    
    @IBOutlet weak var ImProduto: UIImageView!
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
    
    
    func prepaparCelula(deal:Deal){
        
        //KINGFIDHER
        let urlImagem = deal.dealImage
        if let url = URL.init(string:urlImagem){
            let resource = ImageResource(downloadURL: url, cacheKey: urlImagem)
            ImProduto.kf.indicatorType = .activity //Placeholder nas imagens antes de carregar
            ImProduto.kf.setImage(with: resource)
            
        }else{
            ImProduto.image = nil
        }
        
        lbNomeLocal.text = deal.ultraBriefDescription
        lbDescricao.text = deal.shortTitle
        
        let value = deal.salePrice
        lbValor.text = String(format:"%.2f",value)
        
    }
    
    
    
}
