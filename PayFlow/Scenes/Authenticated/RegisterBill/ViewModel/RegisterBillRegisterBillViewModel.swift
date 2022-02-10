
import Foundation
import Firebase

struct RegisterBillViewModel {
 
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    //MARK: - Methods
    
    func createRegisterBill(with datasRegister: Bill, completion: @escaping ((Bool) -> Void)){
        db.collection("users/\(user!.uid)/bill").document().setData(
            ["title": datasRegister.title,
             "dueDate": datasRegister.dueDate,
             "value": datasRegister.value,
             "barcode": datasRegister.barcode,
            ]) { error in
            
            guard error == nil else {
                print("Erro create Bill \(error!.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
    }
}
