//
//  FlightViewModel.swift
//  AzApi
//
//  Created by Lala on 28.02.24.
//

import UIKit

class FlightViewModel: ViewController {
    var flightResponse : FlightResponse? = nil

    func getList(completion: @escaping (Result<Void, NetworkError>)->Void) {
        let url = "https://65a7624794c2c5762da692dd.mockapi.io/api/v1/flights"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<FlightResponse, NetworkError>)  in
            switch result {
            case .success(let flightResponse):
                // table reload
                self.flightResponse = flightResponse
                completion(.success( () ))
                break
            case .failure(let error):
                //show error
                completion(.failure(error))
                break
            }
        }
    }
}
