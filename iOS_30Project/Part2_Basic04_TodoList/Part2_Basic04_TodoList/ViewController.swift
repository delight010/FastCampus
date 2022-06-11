//
//  ViewController.swift
//  Part2_Basic04_TodoList
//
//  Created by Seong A Oh on 2022/06/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem! // stong
    // weak으로 하게되면. 해당 버튼이 done으로 바뀌었을 시
    // edit 버튼이 메모리에서 해제되어 더 이상 재사용이 불가능하기 때문
    var doneButton: UIBarButtonItem?
    var tasks = [Task]() {
        didSet {
            self.saveTasks() // 할일이 추가될 때마다, UserDefaults에 저장
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true) // tableView 편집모드 종료
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        // tasks 배열이 비어있다면 return
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton // doneButton으로 변경
        self.tableView.setEditing(true, animated: true) // tableView가 편집모드로 전환
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { [weak self] _ in
            // 클로저와 클래스 인스턴스 사이의 강한 순환 참조(메모리 누수)를 없애기 위해
            // 클로저의 선언부에 [weak self]를 사용
//            debugPrint("\(alert.textFields?[0].text)") // 콘솔 창에 출력
            guard let title = alert.textFields?[0].text else { return }
            // 등록버튼을 눌렀을 시, 텍스트 필드의 내용을 가지고 올 수 있음
            // 텍스트필드를 1개만 넣었으므로, [0]으로 가져온다
            let task = Task(title: title, done: false)
            self?.tasks.append(task) // task가 추가될때마다 reload
            self?.tableView.reloadData()
            
            // 모든 행을 삭제 후, 할일 추가 시. 테이블뷰 편집모드로 들어가는 경우가 있어
            // 아래 코드를 추가
            if self?.navigationItem.leftBarButtonItem == self?.editButton {
                self?.tableView.setEditing(false, animated: true)
            }
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요"
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks") // UserDefaults에 저장
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return } // 저장된 tasks 로드 + 타입변환
        self.tasks = data.compactMap { // tasks 배열에 저장
            // key에 해당하는 값 타입변환
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done) // Task 타입으로 정의
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done { // bool 값에 따라 선택
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(editingStyle)
        
        self.tasks.remove(at: indexPath.row)
        // 삭제버튼을 누르게되면 해당 행 삭제(스와이프로+delete 버튼 탭으로도 삭제 가능)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty || self.tasks.count == 0 { // tasks 배열 값이 없을 때(모든 행이 삭제)
            self.doneButtonTap()
        }
    }
    
    // 행 순서 변경
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath: 이전(원래) 위치
        // proposedDestinationIndexPath: 이동한 위치
        // 행이 이동함에 따라, tasks 배열의 순서도 변경
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row] // 이전 위치
        tasks.remove(at: sourceIndexPath.row) // 이전위치의 값 삭제
        tasks.insert(task, at: destinationIndexPath.row) // 이동한 위치에 값 추가
        self.tasks = tasks
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done // 선택된 행의 task.done을 반대로 변경
        self.tasks[indexPath.row] = task //변경된 done 값을 저장
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        // at: [배열]. 지금은 현재 선택한 행만 업데이트
        // with: 애니메이션. 행이 업데이트될 때 애니메이션 적용
        // .automatic: 시스템이 적절한 애니메이션 선택
    }
}
