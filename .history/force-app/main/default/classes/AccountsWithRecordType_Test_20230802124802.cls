
@IsTest
public with sharing class AccountsWithRecordType_Test {

    @IsTest
    static void testAccounts(){
                // Test data setup
                List<Account> testAccounts = new List<Account>();
                Id recordId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('DeveloperNameOfRecordType').getRecordTypeId();
                for (Integer i = 1; i <= 5; i++) {
                    Account acc = new Account(Name = 'Account ' + i, Processed = false, RecordTypeId = recordId);
                    testAccounts.add(acc);
                }
                insert testAccounts;
        
                // Prepare account IDs for testing
                List<Id> accountIds = new List<Id>();
                for (Account acc : testAccounts) {
                    accountIds.add(acc.Id);
                }
        
                // Test the sortAccounts method
                Test.startTest();
                List<Account> sortedAccounts = AccountSorter.sortAccounts(accountIds);
                Test.stopTest();
        
                // Assertion
                System.assertEquals(testAccounts.size(), sortedAccounts.size(), 'The sorted accounts list size should match the test accounts list size');
                for (Integer i = 0; i < testAccounts.size(); i++) {
                    System.assertEquals(testAccounts[i].Id, sortedAccounts[i].Id, 'The account IDs should match');
                }
            }
        
    }

