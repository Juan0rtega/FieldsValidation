# Fields and validations
usage:
```
    Account acc =  new Account(name = 'accountCompany');

    List<sObjectField> fieldList = new List<sObjectField>{
        Account.name, 
        Account.BillingAddress, 
        Account.customField__c;
    }

    new Fields()
        .setSObject(acc)
        .setFieldList(fieldList)
        .pluckMissingLabels()
        .throwException();
```
If there are any missing fields throws the following AuraHandledException:
> 'The following fields are required: billing address, custom field'
### OR

```
    Account acc =  new Account(name = 'accountCompany');

    List<sObjectField> fieldList = new List<sObjectField>{
        Account.name, 
        Account.BillingAddress, 
        Account.customField__c;
    }

    new Fields(acc, fieldLIst)
        .pluckMissingFields()
        .throwException();
    
```
If there are any missing fields throws the following AuraHandledException:
> 'The following fields are required: BillingAddress, customField__c'


## Methods

### pluckMissingLabels()
stores the missing fields label
### pluckMissingFields()
stores the missing fields developer name
### throwException()
if there are any missing fields throws and exception with the list of missing fields
### throwException(String message)
if there are any missing fields throws and exception with a custom message.
### addErrors()
Add all the errors to the sObject.

### addErrors(String message)
Add all the errors to the sObject with a custom message.
