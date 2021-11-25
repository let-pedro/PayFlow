
import Foundation
import FirebaseFirestore
import FirebaseAuth

struct HomeVM {
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser

    //MARK: - Methods
    
    
    func getAllBill(completion: @escaping (([QueryDocumentSnapshot]) -> Void)){
        db.collection("users/\(user!.uid)/bill").getDocuments() { (querySnapshot, error ) in
            guard error == nil else {
                print("Error servidor get Bills: \(error!.localizedDescription)")
                return
            }
            completion(querySnapshot!.documents)
        }
    }
    
    
    func paymentsMade(with bill: DocumentSnapshot, completion: @escaping ((Bool) -> Void )){
        db.collection("users/\(user!.uid)/paymentsMade").document(bill.documentID).setData(["title":bill["title"]!,
                                                                                            "dueDate":bill["dueDate"]!,
                                                                                            "value": bill["value"]!,
                                                                                            "barcode":bill["barcode"]!]) { [self] error in
            guard error == nil else {
                print("Error send bill payment Made \(error!.localizedDescription)")
                completion(false)
                return
            }
            deleteBillPayableList(with: bill)
            completion(true)
        }
    }
    
    
    private func deleteBillPayableList(with bill: DocumentSnapshot){
        db.collection("users/\(user!.uid)/bill").document(bill.documentID).delete() {error in
            guard error == nil else {
                print("Error delete bill \(error!.localizedDescription)")
                return
            }
        }
    }
}
