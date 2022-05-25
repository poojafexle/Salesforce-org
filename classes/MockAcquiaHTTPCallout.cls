/**
 * Description		:	This class is helping mock response for AcquiaHttpCallout
 * 				Logic: https://quip.com/mVgUANJsjJCU/Acquia-Automate-creation-of-segments-CR-20210128-14855
 * 
 * Created Date		:	03/12/2021
 * 
 * Revision Log		:	V1.0 - Created - Saurabh Kumar - 03/12/2021 - CR-20210128-14855
 *                              V1.1 - Modified By - Saurabh Kumar -04/19/2021 - CR-20210128-14854 - added method syncContactAndRegistrationsWithAcquiaResponseJsonGenerator()
 *				V1.2 - Modified By - Chirag Soni
 * 
 * */
@isTest
public class MockAcquiaHTTPCallout implements HttpCalloutMock {
	
    public HttpResponse respond(HttpRequest request){
        
        HttpResponse response = new HttpResponse();
        
        String endPoint = request.getEndpoint();
        response.setHeader('Content-Type', 'application/json');
        
        //Generate new Acquia Segment Id
        if(endPoint.contains('/api/segments/new')){
            
            response.setBody(segmentResponseJsonGenerator());
            response.setStatusCode(201);
            
        }else if(endPoint.contains('/api/campaigns/clone/')){//Generate new Acquia Campaign Id
            
            Map<String, Object> mapOfObjects = (Map<String, Object>)JSON.deserializeUntyped(request.getBody());
            response.setBody(acquiaCampaignResponseJsonGenerator((String)mapOfObjects.get('name'), (Boolean)mapOfObjects.get('isPublished'), null));
            response.setStatusCode(200);
            
        }else if(endPoint.contains('/api/campaigns/') && endPoint.endsWith('/edit')){//Activate or Deactivate existing Campaign Id
            
            String campaignId = endPoint.substringBetween('/api/campaigns/','/edit');
            Map<String, Object> mapOfObjects = (Map<String, Object>) JSON.deserializeUntyped(request.getBody());
            response.setBody(acquiaCampaignResponseJsonGenerator((String)mapOfObjects.get('name'), (Boolean)mapOfObjects.get('isPublished'), campaignId));
            response.setStatusCode(200);
        
        }
        //Created by - Saurabh Kumar - 04/19/2021 - CR-20210128-14854
        else if(endPoint.contains('/api/contacts/batch/edit')){// sync contact and registrations for acquia 
            
            response.setBody(syncContactAndRegistrationsWithAcquiaResponseJsonGenerator());
            response.setStatusCode(201);
            
        }
        
        return response;
    }
    
    public static String segmentResponseJsonGenerator(){
        
        String response = '{'
    						+'"list": {'
        					+'"isPublished": true,'
        					+'"dateAdded": "2021-03-17T16:51:39+00:00",'
        					+'"dateModified": null,'
        					+'"createdBy": 6,'
        					+'"createdByUser": "Integration User",'
        					+'"modifiedBy": null,'
        					+'"modifiedByUser": null,'
        					+'"id": 1,'
        					+'"name": "Test",'
        					+'"alias": "Test",'
        					+'"description": null,'
        					+'"filters": ['
            				+'{'
                			+'"glue": "and",'
                			+'"field": "cmf_13",'
                			+'"object": "custom_object",'
                			+'"type": "int",'
                			+'"operator": "=",'
                			+'"properties": {'
                    		+'"filter": "MN-05607"'
            				+'}'
            				+'}'
        					+'],'
        					+'"isGlobal": true,'
        					+'"isPreferenceCenter": false'
    						+'}'
							+'}';
        return response;
    }
    
    public static String acquiaCampaignResponseJsonGenerator(String name, Boolean isPublished, String campaignId){
        
        campaignId = campaignId == null ? '1' : campaignId;
        
        String response = '{'
    						+'"campaign": {'
        					+'"isPublished": '+isPublished+','
        					+'"dateAdded": "2021-03-17T17:11:02+00:00",'
        					+'"dateModified": null,'
        					+'"createdBy": 3,'
        					+'"createdByUser": "Mary Kate Hall",'
        					+'"modifiedBy": 3,'
        					+'"modifiedByUser": "Mary Kate Hall",'
        					+'"id": '+campaignId+','
        					+'"name": "'+name+'",'
        					+'"category": {'
            				+'"createdByUser": "Mary Kate Hall",'
            				+'"modifiedByUser": "Mary Kate Hall",'
            				+'"id": 1,'
            				+'"title": "Virtual Event",'
            				+'"alias": "virtual-event",'
            				+'"description": null,'
            				+'"color": "266ced",'
            				+'"bundle": "campaign"'
        					+'},'
        					+'"description": null,'
        					+'"allowRestart": 1,'
        					+'"publishUp": null,'
        					+'"publishDown": null,'
        					+'"events": [],'
        					+'"forms": [],'
        					+'"lists": [],'
        					+'"canvasSettings": {'
            				+'"nodes": ['
                			+'{'
                    		+'"id": "40",'
                    		+'"positionX": "858",'
                    		+'"positionY": "169"'
                			+'},'
                			+'{'
                    		+'"id": "lists",'
                    		+'"positionX": "860",'
                    		+'"positionY": "50"'
                			+'}'
            				+'],'
            				+'"connections": ['
                			+'{'
                    		+'"sourceId": "lists",'
                    		+'"targetId": "40",'
                    		+'"anchors": {'
                        	+'"source": "leadsource",'
                        	+'"target": "top"'
                    		+'}'
                			+'}'
            				+']'
        					+'}'
    						+'}'
							+'}';
            
        return response;
    }
    
    // Created by - Saurabh Kumar - 04/19/2021 - CR-20210128-14854
    public static String syncContactAndRegistrationsWithAcquiaResponseJsonGenerator(){
        
        String response = +'{'
    	+'"contacts":['
        +'{'
            +'"isPublished":true,'
            +'"dateAdded":"2022-01-18T06:31:03+00:00",'
            +'"dateModified":"2022-01-18T06:31:03+00:00",'
            +'"createdBy":6,'
            +'"createdByUser":"Integration User",'
            +'"modifiedBy":6,'
            +'"modifiedByUser":"Integration User",'
            +'"id":709,'
            +'"points":0,'
            +'"color":null,'
            +'"fields":{'
                +'"core":{'
                    +'"zoompassword":{'
                     +'"id":80,'
                        +'"group":"core",'
                        +'"label":"Zoom Password",'
                        +'"alias":"zoompassword",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                       +'"normalizedValue":""'
                    +'},'
                    +'"eventwebsite":{'
                        +'"id":79,'
                        +'"group":"core",'
                        +'"label":"Event Website",'
                        +'"alias":"eventwebsite",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"longevent_date":{'
                        +'"id":78,'
                        +'"group":"core",'
                        +'"label":"Long Event Date",'
                        +'"alias":"longevent_date",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Wednesday, January 19 - Thursday, January 20",'
                        +'"normalizedValue":"Wednesday, January 19 - Thursday, January 20"'
                    +'},'
                    +'"eventendtime":{'
                        +'"id":77,'
                        +'"group":"core",'
                        +'"label":"Event End Time",'
                        +'"alias":"eventendtime",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"12:00 PM",'
                        +'"normalizedValue":"12:00 PM"'
                    +'},'
                    +'"localeventendtime":{'
                        +'"id":55,'
                        +'"group":"core",'
                        +'"label":"Local Event End Time",'
                        +'"alias":"localeventendtime",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"5:00 PM",'
                        +'"normalizedValue":"5:00 PM"'
                    +'},'
                    +'"localtimezone":{'
                        +'"id":56,'
                        +'"group":"core",'
                        +'"label":"Local Time Zone",'
                        +'"alias":"localtimezone",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Indian Standard time (IST)",'
                        +'"normalizedValue":"Indian Standard time (IST)"'
                    +'},'
                    +'"localeventstarttime":{'
                        +'"id":57,'
                        +'"group":"core",'
                        +'"label":"Local Event Start Time",'
                        +'"alias":"localeventstarttime",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"5:00 PM",'
                        +'"normalizedValue":"5:00 PM"'
                    +'},'
                    +'"localeventenddate":{'
                        +'"id":58,'
                        +'"group":"core",'
                        +'"label":"Local Event End Date",'
                        +'"alias":"localeventenddate",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Thursday, January 20",'
                        +'"normalizedValue":"Thursday, January 20"'
                    +'},'
                    +'"localeventstartdate":{'
                        +'"id":59,'
                        +'"group":"core",'
                        +'"label":"Local Event Start Date",'
                        +'"alias":"localeventstartdate",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Wednesday, January 19",'
                        +'"normalizedValue":"Wednesday, January 19"'
                    +'},'
                    +'"evaluationlink":{'
                        +'"id":60,'
                        +'"group":"core",'
                        +'"label":"Evaluation Link",'
                        +'"alias":"evaluationlink",'
                        +'"type":"url",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"eventid":{'
                        +'"id":61,'
                        +'"group":"core",'
                        +'"label":"Event ID",'
                        +'"alias":"eventid",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"MN-06992",'
                        +'"normalizedValue":"MN-06992"'
                    +'},'
                    +'"eventname":{'
                        +'"id":62,'
                        +'"group":"core",'
                        +'"label":"Event Name",'
                        +'"alias":"eventname",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Test Event FOR Acquia",'
                        +'"normalizedValue":"Test Event FOR Acquia"'
                    +'},'
                    +'"eventtime":{'
                        +'"id":64,'
                        +'"group":"core",'
                        +'"label":"Event Start Time",'
                        +'"alias":"eventtime",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"12:00 PM",'
                        +'"normalizedValue":"12:00 PM"'
                    +'},'
                    +'"status":{'
                        +'"id":63,'
                        +'"group":"core",'
                        +'"label":"Status",'
                        +'"alias":"status",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Registered",'
                        +'"normalizedValue":"Registered"'
                    +'},'
                    +'"location":{'
                        +'"id":66,'
                        +'"group":"core",'
                        +'"label":"Location",'
                        +'"alias":"location",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Virtual",'
                        +'"normalizedValue":"Virtual"'
                    +'},'
                    +'"eventenddate":{'
                        +'"id":76,'
                        +'"group":"core",'
                        +'"label":"Event End Date",'
                        +'"alias":"eventenddate",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Thursday, January 20",'
                        +'"normalizedValue":"Thursday, January 20"'
                    +'},'
                    +'"eventstartdate":{'
                        +'"id":75,'
                        +'"group":"core",'
                        +'"label":"Event Start Date",'
                        +'"alias":"eventstartdate",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Wednesday, January 19",'
                        +'"normalizedValue":"Wednesday, January 19"'
                    +'},'
                    +'"onetouchmobiledialin":{'
                        +'"id":74,'
                        +'"group":"core",'
                        +'"label":"One-Touch Mobile Dial-In",'
                        +'"alias":"onetouchmobiledialin",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":",,#",'
                        +'"normalizedValue":",,#"'
                    +'},'
                    +'"zoomdialinnumber":{'
                        +'"id":73,'
                        +'"group":"core",'
                        +'"label":"Zoom Dial-In Number",'
                        +'"alias":"zoomdialinnumber",'
                        +'"type":"tel",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"zoommeetingid":{'
                        +'"id":72,'
                        +'"group":"core",'
                        +'"label":"Zoom Meeting ID",'
                        +'"alias":"zoommeetingid",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"zoomparticipanturl":{'
                        +'"id":71,'
                        +'"group":"core",'
                        +'"label":"Zoom Participant URL",'
                        +'"alias":"zoomparticipanturl",'
                        +'"type":"url",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"dinnerrsvp":{'
                        +'"id":70,'
                        +'"group":"core",'
                        +'"label":"Dinner RSVP",'
                        +'"alias":"dinnerrsvp",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"partnerstatus":{'
                        +'"id":69,'
                        +'"group":"core",'
                        +'"label":"Partner Status",'
                        +'"alias":"partnerstatus",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Prospect",'
                        +'"normalizedValue":"Prospect"'
                    +'},'
                    +'"eventdate":{'
                        +'"id":65,'
                        +'"group":"core",'
                        +'"label":"Event Date",'
                        +'"alias":"eventdate",'
                        +'"type":"date",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"2022-01-19",'
                        +'"normalizedValue":"2022-01-19"'
                    +'},'
                    +'"state_abbreviation":{'
                        +'"id":49,'
                        +'"group":"core",'
                        +'"label":"State Abbreviation",'
                        +'"alias":"state_abbreviation",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"OH",'
                        +'"normalizedValue":"OH"'
                    +'},'
                    +'"country1":{'
                        +'"id":50,'
                        +'"group":"core",'
                        +'"label":"Country",'
                        +'"alias":"country1",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"United States",'
                        +'"normalizedValue":"United States"'
                    +'},'
                    +'"contact_status":{'
                        +'"id":48,'
                        +'"group":"core",'
                        +'"label":"Contact Status",'
                        +'"alias":"contact_status",'
                        +'"type":"select",'
                        +'"properties":{'
                            +'"list":['
                               +'{'
                                    +'"label":"Active",'
                                    +'"value":"1"'
                                +'},'
                                +'{'
                                    +'"label":"Inactive - Moved Institutions",'
                                    +'"value":"2"'
                                +'},'
                                +'{'
                                    +'"label":"Inactive - No Activity",'
                                    +'"value":"3"'
                                +'},'
                                +'{'
                                    +'"label":"Inactive - Contact Not At Institution",'
                                    +'"value":"4"'
                                +'},'
                                +'{'
                                    +'"label":"Inactive - Other",'
                                    +'"value":"5"'
                                +'},'
                                +'{'
                                    +'"label":"Inactive - No Contact",'
                                    +'"value":"6"'
                                +'}'
                            +']'
                        +'},'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"registration_name":{'
                        +'"id":54,'
                        +'"group":"core",'
                        +'"label":"Registration Name",'
                        +'"alias":"registration_name",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"R-238942",'
                        +'"normalizedValue":"R-238942"'
                    +'},'
                    +'"firstname":{'
                        +'"id":2,'
                        +'"group":"core",'
                        +'"label":"First Name",'
                        +'"alias":"firstname",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Test",'
                        +'"normalizedValue":"Test"'
                    +'},'
                    +'"lastname":{'
                        +'"id":3,'
                        +'"group":"core",'
                        +'"label":"Last Name",'
                        +'"alias":"lastname",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"ChiragSoni",'
                        +'"normalizedValue":"ChiragSoni"'
                    +'},'
                    +'"assistant_name":{'
                        +'"id":46,'
                        +'"group":"core",'
                        +'"label":"Assistant Name",'
                        +'"alias":"assistant_name",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"assistant_email":{'
                        +'"id":47,'
                        +'"group":"core",'
                        +'"label":"Assistant Email",'
                        +'"alias":"assistant_email",'
                        +'"type":"email",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"email":{'
                        +'"id":6,'
                        +'"group":"core",'
                        +'"label":"Primary Email",'
                        +'"alias":"email",'
                        +'"type":"email",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"chirag.soni@fexle.com",'
                        +'"normalizedValue":"chirag.soni@fexle.com"'
                    +'},'
                    +'"company":{'
                        +'"id":4,'
                        +'"group":"core",'
                        +'"label":"Institution",'
                        +'"alias":"company",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Test Apolo",'
                        +'"normalizedValue":"Test Apolo"'
                    +'},'
                    +'"phone":{'
                        +'"id":8,'
                        +'"group":"core",'
                        +'"label":"Phone",'
                        +'"alias":"phone",'
                        +'"type":"tel",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"points":{'
                        +'"id":9,'
                        +'"group":"core",'
                        +'"label":"Points",'
                        +'"alias":"points",'
                        +'"type":"number",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":0,'
                        +'"normalizedValue":0'
                    +'},'
                    +'"address1":{'
                        +'"id":11,'
                        +'"group":"core",'
                        +'"label":"Address Line 1",'
                        +'"alias":"address1",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"500 Venice Boulevard",'
                        +'"normalizedValue":"500 Venice Boulevard"'
                    +'},'
                    +'"address2":{'
                        +'"id":12,'
                        +'"group":"core",'
                        +'"label":"Address Line 2",'
                        +'"alias":"address2",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"city":{'
                        +'"id":13,'
                        +'"group":"core",'
                        +'"label":"City",'
                        +'"alias":"city",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"Los Angeles",'
                        +'"normalizedValue":"Los Angeles"'
                    +'},'
                    +'"zipcode":{'
                        +'"id":15,'
                        +'"group":"core",'
                        +'"label":"Zip Code",'
                        +'"alias":"zipcode",'
                        +'"type":"text",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"90091",'
                        +'"normalizedValue":"90091"'
                    +'},'
                    +'"timezone":{'
                        +'"id":18,'
                        +'"group":"core",'
                        +'"label":"Preferred Timezone",'
                        +'"alias":"timezone",'
                        +'"type":"timezone",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'},'
                    +'"last_active":{'
                        +'"id":19,'
                        +'"group":"core",'
                        +'"label":"Date Last Active",'
                        +'"alias":"last_active",'
                        +'"type":"datetime",'
                        +'"properties":['
                            
                        +'],'
                        +'"value":"",'
                        +'"normalizedValue":""'
                    +'}'
                +'},'
                +'"social":['
                    
                +'],'
                +'"personal":['
                    
                +'],'
                +'"professional":['
                    
                +'],'
                +'"all":{'
                    +'"id":"709",'
                    +'"zoompassword":"",'
                    +'"eventwebsite":"",'
                    +'"longevent_date":"Wednesday, January 19 - Thursday, January 20",'
                    +'"eventendtime":"12:00 PM",'
                    +'"localeventendtime":"5:00 PM",'
                    +'"localtimezone":"Indian Standard time (IST)",'
                    +'"localeventstarttime":"5:00 PM",'
                    +'"localeventenddate":"Thursday, January 20",'
                    +'"localeventstartdate":"Wednesday, January 19",'
                    +'"evaluationlink":"",'
                    +'"eventid":"MN-06992",'
                    +'"eventname":"Test Event FOR Acquia",'
                    +'"eventtime":"12:00 PM",'
                    +'"status":"Registered",'
                    +'"location":"Virtual",'
                    +'"eventenddate":"Thursday, January 20",'
                    +'"eventstartdate":"Wednesday, January 19",'
                    +'"onetouchmobiledialin":",,#",'
                    +'"zoomdialinnumber":"",'
                    +'"zoommeetingid":"",'
                    +'"zoomparticipanturl":"",'
                    +'"dinnerrsvp":"",'
                    +'"partnerstatus":"Prospect",'
                    +'"eventdate":"2022-01-19",'
                    +'"state_abbreviation":"OH",'
                    +'"country1":"United States",'
                    +'"contact_status":"1",'
                    +'"registration_name":"R-238942",'
                    +'"firstname":"Test",'
                    +'"lastname":"ChiragSoni",'
                    +'"assistant_name":"",'
                    +'"assistant_email":"",'
                    +'"email":"chirag.soni@fexle.com",'
                    +'"company":"Test Apolo",'
                    +'"phone":"",'
                    +'"points":0,'
                    +'"address1":"500 Venice Boulevard",'
                    +'"address2":"",'
                    +'"city":"Los Angeles",'
                    +'"zipcode":"90091",'
                    +'"timezone":"",'
                    +'"last_active":""'
                +'}'
            +'},'
            +'"lastActive":null,'
            +'"owner":null,'
            +'"ipAddresses":['
                
            +'],'
            +'"tags":['
                
            +'],'
            +'"utmtags":null,'
            +'"stage":null,'
            +'"dateIdentified":"2022-01-18T06:31:03+00:00",'
            +'"preferredProfileImage":null,'
            +'"doNotContact":['
                
            +'],'
            +'"frequencyRules":['
                
            +']'
        +'}'
    +'],'
    +'"statusCodes":['
        +'201'
    +']'
+'}';
      return response;
    }
}