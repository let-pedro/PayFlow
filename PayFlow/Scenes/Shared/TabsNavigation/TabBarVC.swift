
import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        settings()
    }
    
    private func settings(){
        
        let sceneHome = HomeVC()
        let sceneExtractor = ExtractorVC()
        
        sceneHome.navigationItem.largeTitleDisplayMode = .always
        sceneExtractor.navigationItem.largeTitleDisplayMode = .always
        
        
        let windowHome = UINavigationController(rootViewController: sceneHome)
        let windowExtractor = UINavigationController(rootViewController: sceneExtractor)
        
        windowHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        windowExtractor.tabBarItem = UITabBarItem(title: "Extrator", image: UIImage(systemName: "doc.plaintext"), tag: 1)
        
        windowHome.navigationBar.prefersLargeTitles = true
        windowExtractor.navigationBar.prefersLargeTitles = true
        
        setViewControllers([windowHome,windowExtractor], animated: false)
    }
}
