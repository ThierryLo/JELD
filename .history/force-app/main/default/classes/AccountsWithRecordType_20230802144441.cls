/*** 
@author Thierry Lo
@date 02/08/2023
@descriptopn method should accept a list of accounts and return any that have the “Customer” record type. 
*/


public with sharing class AccountsWithRecordType {

        public static List<Account> sortAccounts(List<Id> accountIds) {
        List<Account>newAccounts = new List<Account>();
        
        List<Account> accounts = [SELECT Name FROM Account WHERE Processed = false AND RecordTypeId = '00N580000097LSc' AND Id IN :accountIds WITH SECURITY_ENFORCED];
        
        newAccounts.addAll(accounts);
        
        return newAccounts;
    }
}
   

   
