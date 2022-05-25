<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Job_Ticket_Letter_Versions_Changed</fullName>
        <description>JT_LETTER_VERSIONS_CHANGED_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Notify_Letter_Versions_Changed</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_Mail_Date_Changed</fullName>
        <description>JT_MAIL_DATE_CHANGED_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Notify_Mail_Date_Changed</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_Mail_Quantity_Changed</fullName>
        <description>JT_MAIL_QUANTITY_CHANGED_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_NotifyMailCount</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_Status_Changed_To_Approved_By_Client</fullName>
        <ccEmails>xmpiesupport@eab.com</ccEmails>
        <description>JT_STATUS_CHANGED_TO_APPROVED_BY_CLIENT_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Project_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Approved_by_Client</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_Status_Changed_To_Cancelled</fullName>
        <description>JT_STATUS_CHANGED_TO_CANCELLED_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>kbrey@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Project_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Notify_Status_Changed_To_Cancelled</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_Status_Changed_To_On_Hold</fullName>
        <description>JT_STATUS_CHANGED_TO_ON_HOLD_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>kbrey@eab.com.eab</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Project_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Notify_Status_Changed_To_On_Hold</template>
    </alerts>
    <alerts>
        <fullName>Job_Ticket_of_Drops_Changed</fullName>
        <description>JT_#_OF_DROPS_CHANGED_EMAIL_ALERT</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mailshop_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <field>Production_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Print_Mgt_Email_Templates/JT_Notify_Of_Drop_Changed</template>
    </alerts>
    <fieldUpdates>
        <fullName>JT_Lock_Record_FU</fullName>
        <field>Locked__c</field>
        <literalValue>1</literalValue>
        <name>JT: Lock Record FU</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>JT_Unlock_Record_FU</fullName>
        <field>Locked__c</field>
        <literalValue>0</literalValue>
        <name>JT: Unlock Record FU</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>JT%3A Unlock Record</fullName>
        <actions>
            <name>JT_Unlock_Record_FU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Job_Ticket__c.Status__c</field>
            <operation>equals</operation>
            <value>Draft,Cancelled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Ticket__c.Locked__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lock Job Ticket record</fullName>
        <actions>
            <name>JT_Lock_Record_FU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Job_Ticket__c.Status__c</field>
            <operation>equals</operation>
            <value>Approved by Partner,Ready for Production,Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Job_Ticket__c.Locked__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>