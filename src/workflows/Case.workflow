<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_to_Boss_about_Case_Status</fullName>
        <description>Email to Boss about Case Status</description>
        <protected>false</protected>
        <recipients>
            <recipient>Boss</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Weekly_Notification_To_Boss</template>
    </alerts>
    <alerts>
        <fullName>Email_to_CC_Manager_about_Case_Status</fullName>
        <description>Email to CC Manager about Case Status</description>
        <protected>false</protected>
        <recipients>
            <recipient>CC_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Weekly_Notification_To_CC_Manager</template>
    </alerts>
    <alerts>
        <fullName>Everyday_notification_to_user_about_Case_Status</fullName>
        <description>Everyday notification to user about Case Status</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/User_Notification_About_Case_Status</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Email_Status_of_Case</fullName>
        <description>Update the status of the field &apos;Email Send&apos; from false to true,because the email has sent.</description>
        <field>Email_Send__c</field>
        <literalValue>1</literalValue>
        <name>Update Email Status of Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Weekly_Email_Status</fullName>
        <field>Email_Send_Weekly__c</field>
        <literalValue>1</literalValue>
        <name>Update Weekly Email Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Daily Change Email Status of Case</fullName>
        <actions>
            <name>Everyday_notification_to_user_about_Case_Status</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Email_Status_of_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Email_Send__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Weekly Change Email Status of Case</fullName>
        <actions>
            <name>Email_to_Boss_about_Case_Status</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Email_to_CC_Manager_about_Case_Status</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Weekly_Email_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Case.Email_Send_Weekly__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
