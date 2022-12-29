# Fields and validations

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
        .throwException(); //message: 'The following fields are required: billing address, custom field'
    
```

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
        .throwException(); //message: 'The following fields are required: BillingAddress, customField__c'
    
```