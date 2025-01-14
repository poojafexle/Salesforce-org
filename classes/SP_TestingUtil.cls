public with sharing class SP_TestingUtil {
  public String opId;
  public String scsId;
  public String scsecId;
  public String scsecItemId;
  public String actId;

  public SP_TestingUtil(){
  	opId = makeTestableOp();
  	scsId = makeSalesCoachStage();
  	scsecId = makeSalesCoachSections();
  	scsecItemId = makeSecItem();
  	actId = makeActivities();
  	ApexPages.currentPage().getParameters().put('id', this.opId);
  }

    private String makeTestableOp(){
        
        String recordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Royall').getRecordTypeId();
        
        // Modified By Rajeev Jain - 30July2020 -(Add Account & its fields on contact to Fix the issue)
        Account acc = new Account();
        acc.name = 'Test';
        insert acc;
        
        // Test Class Fix Start Here 13Feb By: Dipesh Gupta
        //Creating Contact record 
        Contact con = TestUtilities.CreateNewContact(false);
        con.AccountId = acc.Id;
        insert con;
        // Test Class Fix End Here 13Feb By: Dipesh Gupta
        
        //Modified By - Neha Sharma - 05/03/2021 - CR-20201110-14683 - Test Class fixes
        Opportunity op = new Opportunity();
        op.Name='testOpName';
        op.AccountId = acc.Id;
        op.CloseDate = System.today().addMonths(1);
        op.StageName='testStage';
        op.Main_Contact__c =  con.Id;
        op.RecordTypeId = recordTypeId;
        op.Sales_Pursuit_Products__c = 'APS';
        insert op;
        return opId;
    }
  
  private String makeSalesCoachStage(){
  	Sales_Coach_Stage__c scs = new Sales_Coach_Stage__c();
  	scs.Name='testStage';
    scs.Buyer_Stage__c='testBuyStage';
    scs.Active__c=true;
  	insert scs;
  	return scs.Id;
  }
  
  private String makeSalesCoachSections(){
  	Sales_Coach_Section__c scsec =  new Sales_Coach_Section__c();
  	scsec.Section_Ordering__c =1.0;
  	scsec.Section_Name__c='testSection';
  	scsec.Sales_Coach_Stage__c=scsId;
  	scsec.Section_Width__c=33.0;
  	insert scsec;
  	return scsec.Id;
  }
  
 private String makeSecItem(){
 	Sales_Coach_Section_Item__c secItem = new Sales_Coach_Section_Item__c();
 	secItem.Section_Ordering__c=1.0;
 	secItem.Sales_Coach_Section__c=scsecId;
 	secItem.Link_to_Content__c='http://www.google.com';
 	secItem.Item_Name__c='testItem';
 	secItem.Display__c=true;
 	secItem.Products__c='';
 	insert secItem;
 	return secItem.Id;
 }
 
 private String makeActivities(){
  Sales_Coach_Activity__c sca = new Sales_Coach_Activity__c();
  sca.Sales_Coach_Stage__c=scsId;
  sca.Ordering_Number__c=1.0;
  sca.Activity_Details__c='testActivity';
  insert sca;
  return sca.Id;
 }

}