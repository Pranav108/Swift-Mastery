import UIKit

struct Department{
    func departmentSyncOperation(){
        debugPrint("department-Sync-Operation Started")
        Thread.sleep(forTimeInterval: 3)
        debugPrint("department-Sync-Operation Finished")
    }
}
struct Employee{
    func employeeSyncOperation(){
        debugPrint("employee-Sync-Operation Started")
        Thread.sleep(forTimeInterval: 4)
        debugPrint("employee-Sync-Operation Finished")
    }
}

class DatabaseSyncOperation{
    
    func syncToDatabaseUsingOperationQueue() {
        let departmentSyncBlockOperation = BlockOperation()
        departmentSyncBlockOperation.addExecutionBlock {
            let department = Department()
            department.departmentSyncOperation()
        }
        
        let employeeSyncBlockOperation = BlockOperation()
        employeeSyncBlockOperation.addExecutionBlock {
            let employee = Employee()
            employee.employeeSyncOperation()
        }
        
        employeeSyncBlockOperation.addDependency(departmentSyncBlockOperation) // more redable
        // Department's record will be sync first then the Employee's record
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation(departmentSyncBlockOperation)
        operationQueue.addOperation(employeeSyncBlockOperation)
    }
    
    func syncToDatabaseUsingSerialDispatch() {
        let serialDispatchQueue = DispatchQueue(label: "serialDispatchLabel")
        /**** IMPORTANT!!! - DO NOT DISTURB THE ORDER OF DEPARTMENT AND EMPLOYEE */
        
        //Employee's record will be sync before Department's record, because of order and attribute is not set to .concurrent
        serialDispatchQueue.async {
            let employee = Employee()
            employee.employeeSyncOperation()
        }
        serialDispatchQueue.async {
            let department = Department()
            department.departmentSyncOperation()
        }
    }
}

let databaseSyncOperation = DatabaseSyncOperation()
databaseSyncOperation.syncToDatabaseUsingOperationQueue()
databaseSyncOperation.syncToDatabaseUsingSerialDispatch()



// HOW TO HANDLE THIS USING DISPATCH SERIAL QUEUE
