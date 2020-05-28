//
//  ViewControllerCidade.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit

class ViewControllerCidade: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tView: UITableView!


    
    var x:Int = 1
    var resultApi:Response?
    var dadosDeal:[Deal]?
    var dadosBanner:[Banner]?
    var local:[Partner]=[]
    var lat:[Double] = []
    var lon:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CHAMAR API
        chamaApi()
    }
    
    
    
    
    func chamaApi(){
        ApiController.loadData(page: x) { (response_) in
            self.dadosDeal = response_?.response.deals
            self.dadosBanner = response_?.response.banners
            
            
            
            //OBTENDO A LOCALIZAÇÃO
            for i in 0..<self.dadosDeal!.count{
                let local = self.dadosDeal![i].locations[i].lat
//                self.lat[i] = local[i].lat
//                self.lon[i] = local[i].lon
                
//                print("LAT",self.lat[0])
//                print("LON",self.lon[0])
                print("total local",local)
            }
          
            //NECESSÁRIO POIS A TABLE VIEW É CARREGADA ANTES DOS DADOS SEREM BAIXADOS TOTALMENTE
            DispatchQueue.main.async {
                self.tView.reloadData()
            }
        }
    }
    
    
    
    //BOTÃO FAVORITOS
    @IBAction func btnFavoritos(_ sender: Any) {
    }
    
    
    //CELULA CLICADA - FAVORITAR OFERTA
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.allowsSelectionDuringEditing = false
        FavoritosController.salvarOferta(oferta: dadosDeal![indexPath.row])
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dadosDeal?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaCidade", for: indexPath) as! CustomViewCellCidade
        
        if let objDeal = dadosDeal?[indexPath.row]{
            celula.prepaparCelula(deal: objDeal)
            
        }else{
            print("sem dados")
        }
        
        return celula
    }
    
    
}
