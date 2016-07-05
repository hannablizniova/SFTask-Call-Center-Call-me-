<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_email_duplicate_constraint_value</fullName>
        <description>Setting text field equal to email, as a part of uniqueness  regulation on Email field of Contact object</description>
        <field>Duplicating_is_disallowed_for_this_email__c</field>
        <formula>Email</formula>
        <name>Set email duplicate constraint value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_email_duplicate_value_null</fullName>
        <field>Duplicating_is_disallowed_for_this_email__c</field>
        <name>Set email duplicate value null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set unique email constraint off</fullName>
        <actions>
            <name>Set_email_duplicate_value_null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Allow_create_contacts_with_same_email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set unique email constraint on</fullName>
        <actions>
            <name>Set_email_duplicate_constraint_value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Allow_create_contacts_with_same_email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
