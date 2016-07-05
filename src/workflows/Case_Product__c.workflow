<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_unique_Case_Product_Key</fullName>
        <description>Rule setting unique case product key</description>
        <field>Only_unique_case_product_pairs_allowed__c</field>
        <formula>Case__c +  Product__c</formula>
        <name>Set unique Case Product Key</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Case-Product unique identifier setter</fullName>
        <actions>
            <name>Set_unique_Case_Product_Key</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
