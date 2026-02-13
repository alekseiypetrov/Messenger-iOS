import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - UI-elements
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarPages()
        setupSeparator()
        view.backgroundColor = .mBackground
    }
    
    // MARK: - Private methods
    
    private func setupTabBarPages() {
        let friendsVC = FriendsListViewController()
        friendsVC.tabBarItem = UITabBarItem(
            title: "Друзья",
            image: .friendsNoActiveIcon,
            selectedImage: .friendsActiveIcon)
        
        let chatsVC = ChatsListViewController()
        chatsVC.tabBarItem = UITabBarItem(
            title: "Чаты",
            image: .chatsNoActiveIcon,
            selectedImage: .chatsActiveIcon)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: .profileNoActiveIcon,
            selectedImage: .profileActiveIcon)
        
        self.viewControllers = [
            friendsVC,
            chatsVC,
            profileVC
        ]
        self.selectedViewController = chatsVC
    }
    
    private func setupSeparator() {
        view.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.75),
            separator.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
        ])
    }
}
