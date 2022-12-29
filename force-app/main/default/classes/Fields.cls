public class Fields {
    private static final String REQUIRED_MESSAGE = 'The following fields are required: ';
    List<sObjectField> fieldList; 
    List<String> missingFields;
    SObject sObj;

    public Fields() {
        this.missingFields = new List<String>();
    }

    public Fields(Sobject sObj, List<sObjectField> fieldList) {
        this.sObj = sObj;
        this.fieldList = fieldList;
        this.missingFields = new List<String>();
    }

    public Fields setSObject(Sobject sObj){
        this.sObj = sObj;
        return this;
    }

    public Fields setFieldList(List<sObjectField> fieldList){
        this.fieldList = fieldList;
        return this;
    }

    public Fields pluckMissingLabels(){
        Object obj;

        for(SobjectField sObjField : fieldList){
            obj = sObj.get(sObjField);

            if(obj == null || obj instanceof String && String.isEmpty(((String) obj))){
                this.missingFields.add(
                    sObjField.getDescribe().getLabel()
                );
            }
        }
        return this;
    }

    public Fields pluckMissingFields(){
        Object obj;

        for(SobjectField sObjField : fieldList){
            obj = sObj.get(sObjField);

            if(obj == null || obj instanceof String && String.isEmpty(((String) obj))){
                this.missingFields.add(
                    sObjField.getDescribe().getName()
                );
            }
        }
        return this;
    }

    public void throwException(){
        throwException(REQUIRED_MESSAGE);
    }

    public void throwException(String message){
        if(!this.missingFields.isEmpty()){

            throw new AuraHandledException(
                message + 
                String.join(this.missingFields, ', '));
        }
    }

    public void addErrors(){
        addErrors(REQUIRED_MESSAGE);
    }

    public void addErrors(String message){
        if(!this.missingFields.isEmpty()){

            sobject.addError(
                message + 
                String.join(this.missingFields, ', '));
        }
    }
}
