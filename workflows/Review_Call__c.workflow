<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Folks_When_Renewal_Issue_Identified</fullName>
        <description>Alert Folks When Renewal Issue Identified</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfadmin@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Renewal_Issue_Identified</template>
    </alerts>
    <alerts>
        <fullName>Email_when_halfway_review_45_days_late</fullName>
        <description>Email when halfway review 45 days late</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfadmin@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Halfway_Review_Call_45_Days_Overdue</template>
    </alerts>
    <alerts>
        <fullName>Email_when_halfway_review_45_days_late_2</fullName>
        <description>Email when halfway review 45 days late</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfadmin@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Halfway_Review_Call_45_Days_Overdue</template>
    </alerts>
    <alerts>
        <fullName>Post_Review_Call_Customer_Satisfaction_Survey_Invitation_Primary</fullName>
        <description>Post-Review Call Customer Satisfaction Survey Invitation (Primary)</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Attended_By__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Post_Review_Call_Satisfaction_Primary_Contact</template>
    </alerts>
    <alerts>
        <fullName>Post_Review_Call_Customer_Satisfaction_Survey_Invitation_Secondary</fullName>
        <description>Post-Review Call Customer Satisfaction Survey Invitation (Secondary)</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Also_Attended_By__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Post_Review_Call_Satisfaction_Secondary_Contact</template>
    </alerts>
    <alerts>
        <fullName>Review_Call_Summary_HTML</fullName>
        <description>Review Call Summary (HTML)</description>
        <protected>false</protected>
        <recipients>
            <recipient>aamaskane@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>agoodling@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>aolson@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>astepien@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>awells@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bbowers@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cfait@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>chunter@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cnowak@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cwirtz@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dclark@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ekrasienko@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>eleland@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>escheurer@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>japril@collegegreenlight.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jbookout@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jcampbell@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jkirklin@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jpierce@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jscalf@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jst.martin@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jvollmer@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>khulbert@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kmoy@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ksmalzer@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lpreiato@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mgaston@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mlapezo@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mpugh@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sdewar@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sryan@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sstough@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tsingh@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vcienfuegos@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>wlado@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cappex_Email_Templates/Review_Call_Summary</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Review_Call_Completed_Date</fullName>
        <field>Review_Call_Completion_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Review Call Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Scheduled_On_Date</fullName>
        <field>Scheduled_On_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Scheduled On Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Alert When Renewal Issue Identified</fullName>
        <actions>
            <name>Alert_Folks_When_Renewal_Issue_Identified</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Review_Call__c.Renewal_Issue_Identified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Halfway Review 45 days overdue</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Review_Call__c.Name</field>
            <operation>contains</operation>
            <value>155</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Completed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Scheduled__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_when_halfway_review_45_days_late_2</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Review_Call__c.Review_Call_Due_Date__c</offsetFromField>
            <timeLength>45</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send Review Call Summary</fullName>
        <actions>
            <name>Review_Call_Summary_HTML</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Review_Call__c.Send_Review_Call_Summary_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Satisfaction Survey Invitation to Primary Contact</fullName>
        <actions>
            <name>Post_Review_Call_Customer_Satisfaction_Survey_Invitation_Primary</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Review_Call__c.Send_Review_Call_Summary_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Canceled__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Check-In Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Send_Customer_Satisfaction_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Satisfaction Survey Invitation to Secondary Contact</fullName>
        <actions>
            <name>Post_Review_Call_Customer_Satisfaction_Survey_Invitation_Secondary</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Review_Call__c.Send_Review_Call_Summary_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Canceled__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Check-In Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Send_Customer_Satisfaction_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Completed Date When Call Completed</fullName>
        <actions>
            <name>Update_Review_Call_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Review_Call__c.Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Updated Scheduled On Date</fullName>
        <actions>
            <name>Update_Scheduled_On_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Review_Call__c.Scheduled_On_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.Scheduled__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Review_Call__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Review Call</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
