/*** 
@author Thierry Lo
@date 02/08/2023
@descriptopn Apex REST API that accepts this JSON data and creates Book__c records in Salesforce. 
The Book__c object has the following fields: Id__c (External Id), Title__c, Author__c, and Published_Year__c
*/
@RestResource(urlMapping='/createBooks')
global with sharing class BookCreationController {
    
    @HttpPost
    global static void createBooks(List<BookData> bookDataList) {
        List<Book__c> booksToCreate = new List<Book__c>();
        
        // Iterate over each book object in the received array
        for (BookData bookData : bookDataList) {
            Book__c bookRecord = new Book__c(
                Id__c = bookData.id,
                title__c = bookData.title,
                author__c = bookData.author,
                published_Year__c = bookData.publishedYear
            );
            
            booksToCreate.add(bookRecord);
        }

        if (Schema.sObjectType.Book__c.isCreateable()){     
            insert booksToCreate;
        }
    }
    
    // Inner class to map the incoming JSON structure
    global class BookData {
        public String id;
        public String title;
        public String author;
        public Integer publishedYear;
    }
}
