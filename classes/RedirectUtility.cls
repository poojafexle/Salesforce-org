//Code Modified by - Subhash Garhwal - 06/25/2015 - CR-20150618-9014
public without sharing class RedirectUtility {
    
    // Variables used in getLabel function to store object and it's fields metadata
    public static Map<String, Schema.SObjectType> mSchema = new Map<String,Schema.SObjectType>();
    public static Schema.SObjectType oSchema = null;
    public static Map<String, Schema.SObjectField> mFields = null;

    /*
     *  Method name:    createLabelParameters
     *  @description    Creates a set of parameters given an sobject. If the label is mentioned in the URL Get Parameter
     *                  and has a value, this label is translated to the ID and linked to the value
     *  @param          List<Medical_Event_vod__c> lEvents  List of medical events
     *  @return         void
     */
    public static Map<String, String> createLabelParameters(PageReference pReference, sObject oGeneric, Map<String, String> allParams){        
        
        //store the html from the page reference
        String html = '';

        //Dummy data for testing if we do tests                
        if (test.isRunningTest()){
            html = '<label for="CF00NK0000000Yt1b"><span class="requiredMark">*</span>Name</label>';
        }
        else{
            
            //get the HTML contents
            try {
                html = pReference.getContent().toString();  
            } catch(Exception ex) {
                System.debug('@@@@@@ html ' + ex.getMessage());
            }  
        }
        
        // Capture the accountId of the case
        String def_account_id= System.currentPageReference().getParameters().get('def_account_id');
        
        //Create the map that stores the label to label ID
        Map<String, String> mLabelToID = new Map<String, String>();
        
        //Modified by - Subhash Garhwal - 06/25/2015 - CR-20150618-9014
        //Change requiredMark to assistiveText
        //Create the regular expression to fetch all labels
        Matcher m = Pattern.compile('<label for="(.*?)">(<span class="assistiveText">\\*</span>)?(.*?)</label>').matcher(html);
        
        //While there are labels
        while (m.find()) {
            
            //Label is stored in the 4th column 
            String label = m.group(3);
            
            //Id is stored in the second column
            String id = m.group(1);
            
            //Add it to the map (split on _, on occasion we have a _top somewhere)
            mLabelToID.put(label, id.split('_')[0]);                  
        }
        
        // Create new parameter set
        Map<String, String> params = new Map<String, String>();
        
        //for each field in our object
        for (SObjectField field : oGeneric.getSObjectType().getDescribe().fields.getMap().values()) {
            
            //Get the field description object
            DescribeFieldResult f = field.getDescribe();
            
            String label = f.getLabel();        //Get label name
            String apiName = f.getName(); //.toUpperCase()
            
            //Get the parameter from GET
            Object value = allParams.get(apiName);
            
            //If we have a 150
            if (value != null && value != '') {
                string labelKey = label;
                if (!mLabelToID.containsKey(label) && mLabelToID.containsKey(apiName)) labelKey = apiName;
                
                //If there is a label              
                if (mLabelToID.containsKey(labelKey)) {
                    // Format the given value as required
                    String valueAsString;
                    if (f.getType() == DisplayType.Date) {
                    	valueAsString = Date.parse(String.valueof(value)).format();
                    } else if (f.getType() == DisplayType.Datetime) {
                        valueAsString = ((Datetime) value).format();
                    } else if (f.getType() == DisplayType.Boolean) {
                        valueAsString = ((Boolean) value) ? '1' : '0';
                    } else {
                        valueAsString = String.valueOf(value);
                    }
                     
                    // SDG 3/4/2015
                    // Simplified this by just checking the presence of "ID" in the APIName 
                    // provided in allParams
                    // If it is a lookup field, we expect to find the "ID" string
                    // added by the calling function
                    String strIDLookup = allParams.get('ID_' + apiName);
                    
                    // If found, add the parameter (use _lkid to reference the ID field)
                    if(strIDLookup!=null)
                        params.put(mLabelToID.get(label) + '_lkid', strIDLookup);
                    
                    //Set the ID to the value
                    params.put(mLabelToID.get(labelKey), valueAsString);
                  
                } else 
                {
                    if(apiName == 'RecordTypeId')
                    {
                      params.put('RecordType', String.valueOf(value));                        
                    }                
                }
            }
        }
        
        //Check if we also have to set the Record Type
        String strRecordType = ApexPages.currentPage().getParameters().get('RecordType');
        
        //If we have a record type
        if(strRecordType != null){
            
            //Lets find the ID
            List<RecordType> lTypes = [ Select  Id
                                        From    RecordType
                                        Where   Name =: strRecordType
                                        And     SObjectType =: oGeneric.getSObjectType().getDescribe().getName() ];
            
            //If we can find the record type, add it as a parameter
            if(lTypes.size() > 0)
                 params.put('RecordType', lTypes[0].Id);
                        
        }
        
        //Populate the accountId if its alreday present
        if(def_account_id!=null)
            params.put('def_account_id',def_account_id);
        
        //Return the set of label ID's to values
        return params;
            
    }

    /*
     *  Method name:    getLabel
     *  @description    Gets the label name given an API 
     *  @param          String  The API name of object from which the field lable is required
     *  @return         String  The Label name for the given API Name of a Field
     */
    public static String getLabel(String objectName,String strFieldName){
        
        //Get global schema
        if(mSchema.size() == 0){
            mSchema = Schema.getGlobalDescribe();
            
            //Get field schema for medical event
            oSchema = mSchema.get(objectName);
            
            //Get mapping of fields 
            mFields = oSchema.getDescribe().fields.getMap();    
                
        }
        
        //check if it exists, else return null
        if(mFields.containsKey(strFieldName.toLowerCase()))     
            return mFields.get(strFieldName).getDescribe().getLabel();  //return field label
        
        return strFieldName;
    }
}