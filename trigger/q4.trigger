Trigger SurveyTrigger on Survey__c (after insert, after update) {
    // Get the list of Surveys
    List<Survey__c> lstSurvey = new List<Survey__c>();
    lstSurvey = [SELECT Id, Domain__c, Title__c, Description__c, Delay_Time_in_Seconds__c, 
                 Status__c, State__c, Page_Name_or_Location__c, Start_Date__c, End_Date__c, 
                 Target_Users__c, Criteria_for_Target_Users__c, Specialty__c, Preferences__c, 
                 Country_Name__c, Region_and_City_Combination__c, Manual_Selection_of_Users__c 
                 FROM Survey__c WHERE Id IN: Trigger.new];
    
    // Create a list of criteria fields
    List<Criteria_Fields__c> lstCriteriaFields = new List<Criteria_Fields__c>();
    
    // Create a list of questions
    List<Questions__c> lstQuestions = new List<Questions__c>();
    
    // Create a list of user responses
    List<User_Responses__c> lstUserResponses = new List<User_Responses__c>();
    
    // Loop over the list of Surveys
    for (Survey__c survey : lstSurvey) {
        // Check the Domain
        if (survey.Domain__c == 'India' || survey.Domain__c == 'USA' || survey.Domain__c == 'Both') {
            // Create a criteria field
            Criteria_Fields__c criteriaFields = new Criteria_Fields__c();
            criteriaFields.Name = survey.Title__c;
            criteriaFields.Description__c = survey.Description__c;
            criteriaFields.Delay_Time_in_Seconds__c = survey.Delay_Time_in_Seconds__c;
            criteriaFields.Status__c = survey.Status__c;
            criteriaFields.State__c = survey.State__c;
            criteriaFields.Page_Name_or_Location__c = survey.Page_Name_or_Location__c;
            criteriaFields.Start_Date__c = survey.Start_Date__c;
            criteriaFields.End_Date__c = survey.End_Date__c;
            criteriaFields.Target_Users__c = survey.Target_Users__c;
            criteriaFields.Criteria_for_Target_Users__c = survey.Criteria_for_Target_Users__c;
            criteriaFields.Specialty__c = survey.Specialty__c;
            criteriaFields.Preferences__c = survey.Preferences__c;
            criteriaFields.Country_Name__c = survey.Country_Name__c;
            criteriaFields.Region_and_City_Combination__c = survey.Region_and_City_Combination__c;
            criteriaFields.Manual_Selection_of_Users__c = survey.Manual_Selection_of_Users__c;
            lstCriteriaFields.add(criteriaFields);
            
            // Create a list of questions
            Questions__c q1 = new Questions__c();
            q1.Name = survey.Title__c;
            q1.Answer_Type__c = 'Single Choice';
            q1.Rating_Range__c = 0;
            q1.Rating_Range_Max__c = 5;
            lstQuestions.add(q1);
            Questions__c q2 = new Questions__c();
            q2.Name = survey.Title__c;
            q2.Answer_Type__c = 'Multi Choice';
            q2.Rating_Range__c = 0;
            q2.Rating_Range_Max__c = 5;
            lstQuestions.add(q2);
            Questions__c q3 = new Questions__c();
            q3.Name = survey.Title__c;
            q3.Answer_Type__c = 'Text';
            q3.Rating_Range__c = 0;
            q3.Rating_Range_Max__c = 5;
            lstQuestions.add(q3);
            Questions__c q4 = new Questions__c();
            q4.Name = survey.Title__c;
