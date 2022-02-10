
import Foundation
import Firebase
import FirebaseAuth


struct ExtractorViewModel {
    
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    
    //MARK: - Methods
    
    func getPaymentsMade(completion: @escaping (([QueryDocumentSnapshot]) -> Void)){
        db.collection("users/\(user!.uid)/paymentsMade").getDocuments() { (querySnapshot, error ) in
            guard error == nil else {
                print("Error servidor get: \(error!.localizedDescription)")
                return
            }
            completion(querySnapshot!.documents)
        }
    }
    
    
    func deleteBill(with bill: DocumentSnapshot, completion: @escaping ((Bool) -> Void)) {
        db.collection("users/\(user!.uid)/paymentsMade").document(bill.documentID).delete() { error in
            guard error == nil else {
                print("Error delete bill \(error!.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
    }
}
