//
//  ApiController.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import Foundation

class ApiController{
    
    private static let session = URLSession.shared
    
    
    //GET
    class func loadData(page:Int,onComplete:@escaping (receivedJson?)->Void){
        var urlCompleta=""
        
        if page == 1{
            urlCompleta = "https://gist.githubusercontent.com/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
        }else if page == 2{
            urlCompleta = "https://gist.githubusercontent.com/insidegui/d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json"
        }else{
            urlCompleta = "https://gist.githubusercontent.com/insidegui/007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json"
        }
        
        guard let url = URL(string: urlCompleta)else{
            //Retorno para a closure o erro url contido no enum(carError)
            onComplete(nil)
            return}
        
        //Recebe os dados do servidor
        //OBS: a dataTask é executada em outra thread, liberando o usuário para uso simultaneo no app
        let dataTask = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error) in
            if error == nil{
                guard let response = response as? HTTPURLResponse else{
                    print("ERRO2")
                    onComplete(nil)
                    return}
                //se resposta for ok
                if response.statusCode == 200{
                    //Armazenar os dados do servidor na variavel data
                    guard let data = data else{return}
                    
                    //Tranformar json em array
                    do{
                        let dados = try JSONDecoder().decode(receivedJson?.self, from: data)
                        onComplete(dados)
                    }catch{
                        print("ERRO3",error)
                        onComplete(nil)
                    }
                }else{
                    print("Algum status inválido no servidor!!")
                    onComplete(nil)
                }
            }else{
                print("ERRO1")
                onComplete(nil)
            }
        }
        dataTask.resume()
    }
    
    
}
