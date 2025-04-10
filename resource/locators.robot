*** Variables ***

# Login Page 

${EMAIL_textbox}    id=supportInputEmail
${PWD_textbox}    id=ngPasswordInput
${LOGIN_button}    id=ngLogInbtn
${Worklist_page}    //*[@id="block-icon-main-menu"]/ul/li[1]
${Switching_page}    //*[@id="block-icon-main-menu"]/ul/li[2]
${Admin_Switching_page}    //*[@id="block-icon-main-menu"]/ul/li[3]
${Login_Alert_XPATH}    //div[@role='alert']

# SAAS
${CP_Management_Page}    id=worklist-page
${CPM_retrive_button}    //button[@id='subBtn']
${Primary_EndpointURL_XPATH}    id=cpEndpointUrl
${Secondary_EndpointURL_XPATH}    id=secondarycpendpoint_url
${TokenURL_XPATH}    //input[@id='cp_token_url']
${CPM_SaveChanges_button}    //button[normalize-space()='Save Changes']
${SAAS_Logoff_Confirmation}    //b[normalize-space()='Ok']

# Switching Page and Worklist Page
${Get_SCID_XPATH}    (//input[@id='sourceCorrelationID'])[2]
${SourceCorrelation_textbox}    id=sourceCorrelationID 
${Get_DCID_XPATH}    (//input[@id='destinationCorrelationID'])[1] 
${Get_SOR1_XPATH}    (//select[@id='switchOrderReference'])[1]
${Get_SOR_XPATH}    (//input[@id='switchOrderReference'])[2] 
${SwitchOrderReference_textbox}    id=switchOrderReference
${Additional_SOR_XPATH}    id=requestTrxId
${Retrive_button}    id=retrieveButton
${Expand_button}    //td[@class='details-control']
${Flag_ID}    //*[@id="actionDataW"]/button  
${BackToWorklist_Button}    id=backToWorkList
${Flag_XPATH}    //button[@class='removedot nav-link curser-pointer p-0 remove-flag-btn-view ng-star-inserted']
${RedFlag_XPATH}    //button[@class='removedot nav-link curser-pointer p-0 remove-flag-btn-view ng-star-inserted']

# Timers
${Timer_SOR_textbox}    //input[@id='switchOrderReferenceId']
${Timer_SCID_textbox}    //input[@id='sourceCorrelationID']
${Timer_retrive_button}    //button[@id='retrieveMsg']
${Timer_Type}    id=timerTypeData
${Timer_Type2_XPATH}    (//td[@id='timerTypeData'])[2]
${Timer_Type3_XPATH}    (//td[@id='timerTypeData'])[3]
${Timer_Type4_XPATH}    (//td[@id='timerTypeData'])[4]
${Timer_Message_Type}    id=messageTypeData
${Timer_Message2_Type}    (//td[@id='messageTypeData'])[2] 
${Timer_Message3_Type}    (//td[@id='messageTypeData'])[3]
${Timer_flag_XPATH}    //img[@id='img-action']
${Timer_Type_deopdown_XPATH}    //select[@id='timerTypeId']
${Timer_Date_From_XPATH}    //input[@id='violationDateFrom']
${Timer_Date_To_XPATH}    //input[@id='violationDateTo']
${Timers_calender_startdate}    id=violationDateFrom
${Timers_calender_enddate}    id=violationDateTo

${Routing_ID}    id=routingID
${Source_Type_XPATH}    id=sourceType
${Destination_Type_XPATH}    id=destinationType
${Desination_ID_XPATH}    id=destinationIdentity
${GRCP_BRAND_NAME_XPATH}    id=grcpBrandName
${Name_XPATH}    id=name
${Account_XPATH}    id=requestTrxId
${UPRN_XPATH}    id=uprn
${Address1_XPATH}    //*[@id="addressLines"]
${SubBuilding_Name_XPATH}    (//input[@id='addressLines'])[1]
${Building_Name_XPATH}    (//input[@id='addressLines'])[2]
${Building_Number_XPATH}    (//input[@id='addressLines'])[3]
${Dependent_Thoroughgfare_XPATH}    (//input[@id='addressLines'])[4]
${Thoroughgfare_XPATH}    (//input[@id='addressLines'])[5]
${Double_Dependent_Locality_XPATH}    (//input[@id='addressLines'])[6]
${Dependent_Locality_XPATH}    (//input[@id='addressLines'])[7]
${Post_Town_XPATH}    id=postTown
${Post_Code_XPATH}    id=postCode

${Service_Type_XPATH0}    id=serviceType 
${Service_Type_XPATH1}    xpath=(//select[@id='serviceType'])[2]
${Action_XPATH0}    id=action
${Action_XPATH1}    xpath=(//select[@id='action'])[2]
${Service_Identifier_XPATH0}    id=serviceIdentifier
${Service_Identifier_XPATH1}    xpath=(//input[@id='serviceIdentifier'])[2]
${AddService_XPATH}    //button[@class='btn btn-achromatic curser-pointer']
${Send_button}    //*[@id="sendTop"]
${Sucess_msg_XPATH}    //div[@id='successMsg']

${Sent_Method_XPATH}    id=sentMethod
${Sentby_XPATH}    id=sentBy              
${MC_Date_XPATH}    //*[@id="icon"]
${MC_Implications_XPTH}    //textarea[@type='search']
${Switch_Action_XPATH0}    id=switchAction
${Switch_Action_XPATH1}    xpath=(//select[@id='switchAction'])[2]
${Add_SOR_XPATH}    //*[@id="alternativeAccordion"]/div/button
${Add_service_identifier_XPATH}    //div[@class='modal serviceIdentifiers modal-outterbox alterSerIder0']//button[@type='button'][normalize-space()='Add']
${MC_Identifier_Type_XPATH}    id=matchidentifierType
${MC_Identifier_Value_XPATH}    id=matchidentifier
${MC_Save$Close_XPATH}    //div[@class='modal-body']//div[@class='modal-footer d-flex align-items-center justify-content-center']//button[@type='button']
${Add_SOR_Service_Type_XPATH}    xpath=//div[@class='d-flex align-items-center']//select[@id='serviceType']
${Add_SOR_Service_Action_XPATH_2}    xpath=(//select[@id='switchAction'])[2]
${Add_SOR_Service_Action_XPATH}    xpath=(//select[@id='switchAction'])[3]

${Planned_Switch_Date_XPATH}    //*[@id="icon"]
${Activation_Date_XPATH}    //*[@id="icon"]
${Status_field}    id=status
${Auditdata_name_XPATH}    id=auditDataName
${Auditdata_value_XPATH}    id=auditDataValue
${Faultcode_field}    id=faultCode
${Auditdata_add_button_XPATH}    //div[@id='collapseEnvelop']//div//button[@type='button'][normalize-space()='Add']
${Auditdata_name1_XPATH}    (//input[@id='auditDataName'])[2]
${Auditdata_value1_XPATH}    (//input[@id='auditDataValue'])[2]
${Error_textbox_XPATH}    id=errorText
${Error_Code_XPATH}    id=errorCode

${Match_Confirmation_XPATH}    id=routingId0
${Match_Failure_XPATH}    id=routingId0
${Match_Failure_Message}    //li[@class='removedot isLink worlist-alignmiddle curser-pointer ng-star-inserted']
${Trigger_Request_Message}    (//div[@class='noTextWrap isLink pt-2 pb-2 ng-star-inserted'])[1]
${Trigger_Confirmation_Message}    //tbody//div[1]//div[1]//li[1]//u[1]
${Order_Failure_XPATH}    id=routingId0
${Order_Failure_Message}    //li[@class='removedot curser-pointer']
${Cancellation_Failure_Message}    //tbody//div[1]//div[1]//li[1]//u[1] 
${switch_error_msg_XPATH}    (//li[@class='removedot curser-pointer'])[1]
${Cancellation_Failure_Message1}    //tbody/tr[8]/td[4]/li[1]/u[1] 
${Update_Failure_Message}    //tbody/tr[6]/td[4]/li[1]/u[1]
${Switch_Error_XPATH}    (//div[contains(text(),'Residential Switch Error')])[1]
${Trigger_Failure_Message}    id=routingId0
${Update_Failure_XPATH}    id=routingId0
${Cancellation_Failure_XPATH}    id=routingId0
${Message_Delivery_Failure_XPATH}    (//div[@class='noTextWrap p-3'][normalize-space()='messageDeliveryFailure'])[1]
${Message_Delivery_Failure}    //table[1]/tbody/tr[1]/td[7]//li/u
${MatchRequest_RoutingID_XPATH}    //tbody/tr[1]/td[5]/div[1]/div[1]
${TableSourceIdentity_XPATH}    (//div[@class='noTextWrap p-3'][normalize-space()='mpct'])[1]
${TableDestinationIdentity_XPATH}    (//div[@class='noTextWrap p-3'][normalize-space()='mpct'])[1]
${GetSCorrelationID}    (//div[@class='noTextWrap p-3'])[6]
${CheckScorrelationID}    (//div[@class='noTextWrap p-3'])[6]

# User Management
${UM_SuccessCount_XPATH}    //div[@class='alert alert-success removedot sucess-margin']
${UM_SearchParameter_label}    //label[@id='searchParam']
${UM_Select_Group_label}    //b[normalize-space()='Group']
${UM_Select_Email_label}    //b[normalize-space()='Email']
${UM_Retrieve_button_XPATH}    //button[@id='subBtn']
${UM_Clear_button_XPATH}    //button[@id='clear']
${UM_clearpage_button_XPATH}    //div[@id='clearUserPage']//div[@class='modal-footer d-flex align-items-center justify-content-center']//button[1]
${UM_Edit_Button}    (//button[@id='addBtnn'])[2]
${UM_Row_label}    //th[normalize-space()='Row #']
${UM_FirstName_label}    //th[@id='firstName']
${UM_LastName_label}    //th[@id='lastName']
${UM_Email_label}    //th[@id='email']
${UM_UserStatus_label}    //th[@id='status']
${UM_UserGroup_label}    //th[@id='userGroup']
${UM_UserPasswordlabel}    //th[@id='userPassword']
${UM_Delete_button_XPATH}    //button[@id='deleteBtnn']
${UM_CloseConfirmation_button_XPATH}    //button[@id='closemdl']
${UM_CB0_XPATH}    //input[@id='checkRow0']
${UM_CB1_XPATH}    //input[@id='checkRow1']
${UM_SuccessMSG_XPATH}    //b[@id='success']
${UM_ErrorMsg_XPATH}    //li[normalize-space()='Email is Required.']
${UM_ErrorMsg2_XPATH}    //li[normalize-space()='Group Name is Required.']
${UM_ErrorMsg1_XPATH}    //li[@class='ng-star-inserted']
${UM_Group1_XPATH}    //select[@id='group']
${UM_AddButton_XPATH}    (//button[@id='addBtnn'])[1]
${UM_FirstName_XPATH}    //input[@id='firstNameInpt0']
${UM_LastName_XPATH}    //input[@id='lastNameInpt0']
${UM_UserEmal_XPATH}    //input[@id='userIdd0']
${UM_Group_XPATH}    //select[@id='GroupInpt0'] 
${UM_SaveButton_XPATH}    //button[@id='saveBtn']
${UM_Success_Alert_XPATH}    //div[@id='successMsg']
${UM_Success_PopupMsg_XPATH}    //span[contains(text(),'You have confirmed your registration for a TruOps ')]

# Groups
${Groups_Header_XPATH}    (//h1[normalize-space()='GROUPS'])[1]
${Groups_Search_Parameters_label}    (//h4[normalize-space()='Search Parameters/Group Data Input'])[1]
${Groups_Group_label}    //label[normalize-space()='Group']
${Groups_Description_label}    //label[@id='participantDescription']
${Groups_retrieve_XPATH}    id=isretriveGroips
${Groups_retrieve1_XPATH}    (//select[@id='isretriveGroips'])[1]
${Groups_retrieve_button_XPATH}    //button[@id='btnRetrieve']
${Groups_clear_button_XPATH}    //button[@id='btnClearr']
${Groups_close_button_XPATH}    //button[@id='closeLogoff']
${Groups_add_button_XPATH}    //button[@id='addBtn']
${Groups_Footer_XPATH}    //div[@class='col text-center']
${Groups_add_Groups_XPATH}    //input[@id='addGroups']
${Groups_text_XPATH}    //input[@type='text']
${Groups_table_XPATH}    //tbody/tr[1]/td[1]/div[1]/label[1]/div[1]
${Groups_Save_button_XPATH}    //button[@id='BtnnSave']
${Groups_unknown_XPATH}    //input[@class='form-control input-field ng-pristine ng-valid ng-touched']
${Groups_Delete_button_XPATH}    //button[@id='btnDelete']
${Groups_close_XPATH}    (//button[@type='button'][normalize-space()='Close'])[3]
${Groups_permission_table_label}    //div[@id='accordion1']//span[1]
${Groups_row_table_label}    //th[@id='rows']
${Groups_permission_type_table_label}    (//th[@id='permissionType'])[1]
${Groups_permission_name_table_label}    //th[@id='permissionName']

# CP To MAG 
${CTM_ClientID_XPATH}    id=primaryCpEndpointUrl
${CTM_SecretKey_XPATH}    id=secondaryCpEndpointUrl
${CTM_EndPointURL_XPATH}    id=hub_client_id
${CTM_TokenURL_XPATH}    id=hubsecretkey

#Logoff
${LOG_OFF_button}    id=logout 
${LOG_OFF_confirmation_ok}    //button[normalize-space()='Ok']
${LOG_OFF_confirmation_cancel}    //button[normalize-space()='Close']   

#Customer Data Upload

${Customer_Data_Upload_Page}    //nav[@id='block-icon-main-menu']//a[@id='cp-page']
${Template_file_XPATH}    //i[@class='fa fa-download text-secondary cursor-pointer link']
${CDU_Instructions_XPATH}    //a[normalize-space()='Customer Data File Instructions']
${Alert_msg_XPATH}    //div[@class='alert alert-success alert-dismissible ng-star-inserted']
${Alert_errmsg_XPATH}    //div[@class='alert alert-warning ng-star-inserted']
${Select_file_XPATH}    //input[@type='file']
${Submit_button}    //button[normalize-space()='Submit']
${Clear_button}    //button[@id='clearPage']
${Refresh_button}    //button[normalize-space()='Refresh']
${History_XPATH}    //b[normalize-space()='History']
${Input_file_XPATH}    (//td[@id='input-file-name'])[1]
${File_status_XPATH}    (//td[@id='Status'])[1]
${Record_Count_XPATH}    (//td[@id='record'])[1] 
${Timestamp_XPATH}    (//td[@id='time-stamp'])[1]
${Download_Response_file_XPATH}    (//i[@aria-hidden='true'])[2]
${Responce_file_XPATH}    (//td[@id='res-file-name'])[1]

# Worklist page
${Worlist_header_XPATH}    //div[@class='section-title title d-flex align-items-center d-flex align-items-center justify-content-center']    
${SearchparametersLabel_XPATH}    //label[normalize-space()='SEARCH PARAMETERS']
${TypeOfMessageLabel_XPATH}    //label[@id='messageSetHeading']
${SORLabel_XPATH}    //label[normalize-space()='Switch Order Reference:']
${SourceIdentityLabel_XPATH}    //label[normalize-space()='Source Identity:']
${MatchRequestCorrelationIDLabel_XPATH}    //label[normalize-space()='Match Request Correlation ID:']
${DestinationIdentityLabel_XPATH}    //label[normalize-space()='Destination Identity:']
${MessageDateFromLabel_XPATH}    //label[normalize-space()='Message Date From:']
${MessageDateToLabel_XPATH}    //label[normalize-space()='Message Date To:']
${TypeOfMessage_XPATH}    //select[@id='ActionRequested']
${SourceIdentity_XPATH}    //select[@id='sourceIdentity']
${DestinationIdentity_XPATH}    //select[@id='destinationIdentity']
${MessageDateFrom_XPATH}    //input[@id='timeStampFromDate']
${MessageDateFromCalenderIcon_XPATH}    //button[@class='p-element p-ripple p-datepicker-trigger ng-tns-c3405549033-0 p-button p-component p-button-icon-only ng-star-inserted']//span[@class='p-button-icon fas fa-calendar-alt']
${MessageDateTo_XPATH}    //input[@id='timeStampToDate']
${MessageDateToCalenderIcon_XPATH}    //button[@class='p-element p-ripple p-datepicker-trigger ng-tns-c3405549033-1 p-button p-component p-button-icon-only ng-star-inserted']//span[@class='p-button-icon fas fa-calendar-alt']
${Worklist_Clear_Button}    //button[@id='clearButton']
${Worklist_TabelHeader_XPATH}    //label[normalize-space()='Worklist']
${SearchLabel_XPATH}    //label[normalize-space()='Search:']
${WorklistFooter_XPATH}    //span[@class='navbar-text mr-auto copy-right-label']
${TableGOTOLabel_XPATH}    //th[@id='actionHeaderW']
${TableRowLabel_XPATH}    //th[@id='rowHeaderW']
${TableMessageTimestampLabel_XPATH}    (//th[@id='messageHeaderW'])[1]
${TableSORLabel_XPATH}    (//th[@id='messageHeaderW'])[2]
${TableRoutingIDLabel_XPATH}    (//th[@id='messageHeaderW'])[3]
${TableSourceIdentityLabel_XPATH}    (//th[@id='messageHeaderW'])[4]
${TableSCIDLabel_XPATH}    (//th[@id='messageHeaderW'])[5]
${TableDestinationIdentityLabel_XPATH}    (//th[@id='messageHeaderW'])[6]
${TableDCIDLabel_XPATH}    (//th[@id='messageHeaderW'])[7]
${SearchTextbox_XPATH}    //input[@aria-controls='worklist']
${Expand_button_XPATH}    (//i[@class='fas fa-plus-circle fa-sm accordian-plus ng-star-inserted'])[1]
${Timestamp_validation_error_XPATH}    //div[@role='alert']

# Switching Page
${Client_ID_XPATH}    //select[@id='clientId']
${Switching_retrieve_Button_XPATH}    //button[@id='retrive']
${Switching_clear_Button_XPATH}    //div[@class='search-btm-margin']//button[@id='clearTop']
${Switching_Error_XPATH}    //div[@id='errorMsg']


# Change Password Page
${ChangePassword_Page}    //ul[@class='menu curser-pointer']//a[@class='profile']
${ChangePassword_button}    //button[@id='ngChangePassbtn']
${ChangePassword_Cancel_Button}    //button[@id='cancelChng']
${loginPage_Alert}    //div[@role='alert']
${ChangePasswor_Email_textbox}    //input[@id='emailInput'] 
${ChangePasswor_OldPassword_textbox}    //input[@id='oldPasswordInput']
${ChangePasswor_NewPassword_textbox}    //input[@id='newPasswordInput']
${ChangePasswor_ConfirmPassword_textbox}    //input[@id='retypePasswordInput']
${ChangePassword_OK_Button}    //button[@id='okChng']
${ChangePassword_OK_Confirmation_Button}    //button[@id='chngpassOk']
${ChangePassword_OK_Confirmation_Button1}    id=chngOk
${ChangePasswordPage_Footer_XPATH}    //div[@class='validfooteralign']
${ChangePassword_Validation_erroe_XPATH}    //div[@class='margin-chng ng-star-inserted']
${ChangePassword_Page_Header_XPATH}    //div[@class='section-title title d-flex align-items-center d-flex align-items-center justify-content-center']
${ChangePasswor_Email_label_XPATH}    //label[@id='email']
${ChangePasswor_OldPassword_label_XPATH}    //label[@id='oldPassword']
${ChangePasswor_NewPassword_label_XPATH}    //label[@id='newPassword']
${ChangePasswor_ConfirmPassword_label_XPATH}    //label[@id='retypePassword']
${Self_radio_button}    //div[@id='northWestFormIndicator']
${Others_radio_button}    //div[@id='southEastFormIndicator']
${Others_Rest_Button}    //b[normalize-space()='Reset']
${Profile_Page_Email_XPATH}    //input[@id='emailId']
${Profile_Page_FirstName_XPATH}    //input[@id='first_name']
${Profile_Page_LastName_XPATH}    //input[@id='last_name']
${Profile_Page_Group_XPATH}    //select[@id='group']
${Profile_Page_ValidationError_XPATH}    //div[@class='margin-chng alert alert-warning ng-star-inserted']
${Profile_Page_HeaderLabel_XPATH}    //b[normalize-space()='Profile']
${Profile_Page_RCPLabel_XPATH}    //b[normalize-space()='RCPID']
${Profile_Page_RCPLabel_XPATH}    //b[normalize-space()='Account ID']
${Profile_Page_FirstNameLabel_XPATH}    //b[normalize-space()='First Name']
${Profile_Page_LastNameLabel_XPATH}    //b[normalize-space()='Last Name']
${Profile_Page_EmailLabel_XPATH}    //b[normalize-space()='Email']
${Profile_Page_FirstNameLabel_XPATH}

# SelfRegistration
${SR_Header_XPATH}    //div[@class='section-title title d-flex align-items-center logo']
${SR_FirstName_XPATH}    //input[@formcontrolname='first_name']
${SR_LastName_XPATH}    //input[@formcontrolname='last_name']
${SR_Position_XPATH}    //input[@formcontrolname='position']
${SR_EmailInput_XPATH}    //input[@formcontrolname='email']
${SR_PhoneNumber_XPATH}    //input[@formcontrolname='phone_number']
${SR_FullTradingName_XPATH}    //input[@formcontrolname='full_trading_name']
${SR_TyoeOfEntity_XPATH}    //select[@name='type_of_entity']
${SR_TypeOfEntityOther_XPATH}    //input[@id='type_of_other_entity']
${SR_CompanyRegistrationNo_XPATH}    //input[@formcontrolname='company_registration_number']
${SR_VatRegistrationNumber_XPATH}    //input[@formcontrolname='vat_registration_number']
${SR_ACPName_XPATH}    id=acpName
${SR_RCPID_XPATH}    //input[@formcontrolname='rcp_id']
${SR_ADD1_XPATH}    //input[@formcontrolname='address_line1']
${SR_ADD2_XPATH}    //input[@formcontrolname='address_line2']
${SR_PostTown_XPATH}    //input[@formcontrolname='post_town']
${SR_County_XPATH}    //input[@formcontrolname='county']
${SR_PostCode_XPATH}    //input[@formcontrolname='post_code']
${SR_MAPType1_XPATH}    //label[@id='label_mapType-tech']
${SR_MAPType2_XPATH}    //label[@id='label_mapType-full']
${SR_AutoConfirmation1_XPATH}    //label[@id='label_rcpOnboardedIntoHub-yes']
${SR_NoResiCust_XPATH}    //input[@formcontrolname='number_of_residential_cust']
${SR_SubmitButton_XPATH}    //button[normalize-space()='Submit']
${SR_SuccssMsg_XPATH}    //div[@id='successMsg']

# Agreement Page
${Agreement_Checkbox1_XPATH}    //label[normalize-space()='Agree']
${Agreement_Checkbox2_XPATH}    //label[normalize-space()='Is Pricing Information Reviewed']
${Agreement_OKButton_XPATH}    //button[@id='ngYesBtn']

# BillingPage
${BP_Checkbox1_XPATH}    //input[@formcontrolname='same_as_contact_info']
${BP_Checkbox2_XPATH}    (//input[@formcontrolname='same_as_company_addr'])[1]
${BP_Checkbox3_XPATH}    (//input[@formcontrolname='dd_contact_info_is_checked'])[1]
${BP_OKButton_XPATH}    //button[normalize-space()='Submit']
${BP_Success1_XPATH}    id=success
${BP_Logout_XPATH}    id=logout
${BP_LououtConfirmation_XPATH}    //button[@class='btn-font btn-primary']

# SD Admin
${SD_SP_Email_XPATH}    id=emailId
${SD_SP_SubmitButton_XPATH}    id=subBtn
${SD_DeleteButton_XPATH}    id=deleteBtnn
${SD_DeleteConfirmationButton_XPATH}    id=okmdl
${SD_CheckRow0_XPATH}    id=checkRow0
${SD_MAP_Link_XPATH}    id=diveLink
${SD_RCPOnboarded_No_XPATH}    (//div[@class='form-indicator'])[6]
${SD_clickRejected_XPATH}    //a[normalize-space()='Rejected']
${SD_clickPending_XPATH}    //a[normalize-space()='Pending']
${SD_clickPaid_XPATH}    //a[normalize-space()='Paid']
${SD_ClcikPaidFM_XPATH}    //a[normalize-space()='Paid Full MAP']
${SD_ClcikTesting_XPATH}    //a[normalize-space()='Testing']
${SD_AccountStatus_Popup_XPATH}    id=account_status_popup
${SD_AccountStatus_Comments_XPATH}    id=text_area_reason_to_change_account_status_popup
${SD_AccountStatus_PopupOKButton_XPATH}    //button[@id='ngforgotBtn']
${SD_DDCustID_XPATH}    id=dd_cust_id
${SD_DDMandID_XPATH}    id=dd_mandate_id
${SD_GRCPCutOff_XPATH}    id=grcpcutoffdays
${SD_GRCPCutOffTimer_XPATH}    (//input[@id='subscribeDate'])[1]
${SD_GRCPOffSet_XPATH}    id=grcpoffsetdays
${SD_GRCPOffSetTimer_XPATH}    (//input[@id='subscribeDate'])[2]
${SD_PEURL_XPATH}    //input[@formcontrolname='primary_cp_endpoint_url']
${SD_SEURL_XPATH}    //input[@formcontrolname='secondary_cp_endpoint_url']
${SD_TokenURL_XPATH}    //input[@formcontrolname='cp_token_url']
${SD_HubClientID_XPATH}    //input[@formcontrolname='hub_client_id']
${SD_HubSecretKey_XPATH}    //input[@formcontrolname='hub_secret_Key']
${SD_CPClientID_XPATH}    //input[@formcontrolname='cp_client_id']
${SD_CPSecretKey_XPATH}    //input[@formcontrolname='cp_secret_key']
${SD_SaveChanges_Button_XPATH}    //button[normalize-space()='Save Changes']

# SelfRegistration
${SR_Header_XPATH}    //div[@class='section-title title d-flex align-items-center logo']
${SR_FirstName_XPATH}    //input[@formcontrolname='first_name']
${SR_LastName_XPATH}    //input[@formcontrolname='last_name']
${SR_Position_XPATH}    //input[@formcontrolname='position']
${SR_EmailInput_XPATH}    //input[@formcontrolname='email']
${SR_PhoneNumber_XPATH}    //input[@formcontrolname='phone_number']
${SR_FullTradingName_XPATH}    //input[@formcontrolname='full_trading_name']
${SR_TyoeOfEntity_XPATH}    //select[@name='type_of_entity']
${SR_TypeOfEntityOther_XPATH}    //input[@id='type_of_other_entity']
${SR_CompanyRegistrationNo_XPATH}    //input[@formcontrolname='company_registration_number']
${SR_VatRegistrationNumber_XPATH}    //input[@formcontrolname='vat_registration_number']
${SR_ACPName_XPATH}    id=acpName
${SR_RCPID_XPATH}    //input[@formcontrolname='rcp_id']
${SR_ADD1_XPATH}    //input[@formcontrolname='address_line1']
${SR_ADD2_XPATH}    //input[@formcontrolname='address_line2']
${SR_PostTown_XPATH}    //input[@formcontrolname='post_town']
${SR_County_XPATH}    //input[@formcontrolname='county']
${SR_PostCode_XPATH}    //input[@formcontrolname='post_code']
${SR_NoResiCust_XPATH}    //input[@formcontrolname='number_of_residential_cust']
${SR_SubmitButton_XPATH}    //button[normalize-space()='Submit']
${SR_SuccssMsg_XPATH}    //div[@id='successMsg']
${SR_Error_Warning_xpath}    //*[@id="erroMsg"]
${SR_label_RTSA}    //label[normalize-space()='Register for a TruOps Switching Account']
${SR_label_CI}    //label[normalize-space()='Contact Information']
${SR_Label_FN}    //label[normalize-space()='First Name']
${SR_Label_LN}    //label[normalize-space()='Last Name']
${SR_Label_PT}    //label[normalize-space()='Position / Title']
${SR_Label_EM}    //label[normalize-space()='Email']
${SR_Label_PN}    //label[normalize-space()='Phone Number']
${SR_Label_CPI}    //h4[normalize-space()='Company Information']
${SR_Label_CA}    //h4[normalize-space()='Company Address']

${SR_Label_FTN}    //label[normalize-space()='Full Trading Name']      
${SR_Label_TOE}    //label[normalize-space()='Type of Entity']     
${SR_Label_TOEIO}   //label[normalize-space()='Type of Entity if Other']      
${SR_Label_CRN}   //label[normalize-space()='Company Registration Number']    
${SR_Label_VRN}    //label[normalize-space()='VAT Registration Number']      
${SR_Label_CVR}    //label[normalize-space()='Country of VAT Registration']    
${SR_Label_ACPN}    //label[normalize-space()='ACP Name']     
${SR_Label_ACPNO}   //label[normalize-space()='ACP Name if Other']     
${SR_Label_RCPID}   //label[normalize-space()='RCPID']    
${SR_Label_AL1}    //label[normalize-space()='Address Line 1']
${SR_Label_AL2}    //label[normalize-space()='Address Line 2']
${SR_Label_PTC}    //label[normalize-space()='Post Town / City']
${SR_Label_CO}    //label[normalize-space()='County']
${SR_Label_PCZC}    //label[normalize-space()='Postcode / ZIP Code']
${SR_MOP_TY2}    //input[@id='map_type2']

# CPList_SAASAdmin
${CPList_Header_xpath}    //div[@class='section-title title d-flex align-items-center d-flex align-items-center justify-content-center']
${CPList_SearchparametersLabel_XPATH}    //label[@id='searchParam']
${CPList_Accountid_label_xpath}    //b[normalize-space()='Account ID']
${CPList_RCPID_label_xpath}    //b[normalize-space()='RCPID']
${CPList_Email_label_xpath}    //b[normalize-space()='Email']
${CPList_AccountStatus_label_xpath}    //b[normalize-space()='Account Status']
${RCPID_Xpath}    //select[@id='profileId']
${AccountStatus_xpath}    //select[@id='accStatus']
${Email_Xpath}    //input[@id='emailId']
${AccountID_xpath}    //input[@id='accountID']
${Retrieve_xpath}    //button[@id='subBtn']
${clear_xpath}    //button[@id='clear']
${clear_xpath_okbtn}    //button[@id='okLogoff']
${cpaccount_label_xpath}    //label[normalize-space()='CP Accounts']
${footer_xpath}    //span[@class='mr-auto copy-right-label mrgn-left-25']
${table_accountid}    //th[@id='accountID']
${table_rcpid}    //th[@id='rcpid']
${table_firstname}    //th[@id='firstName']
${table_lastname}    //th[@id='lastName']
${table_email}    //th[@id='email']
${table_accountstatus}    //th[@id='accountStatus']
${table_createtime}    //th[@id='createTime']
${delete_checkrow_single}    //input[@id='checkRow0']
${delete_btn_xpath}    //button[@id='deleteBtnn']
${delete_close_btn_xpath}    //button[@id='closemdl']
${delete_checkrow_two}    (//input[@id='checkRow1'])[1]
${account_id_sp_xpath}    (//input[@id='accountID'])[1]
${alert_success_xpath}    //div[@class='alert alert-success removedot']
${alert_warning_xpath}    //div[@class='alert alert-warning success-msg']

# Account Management
${EDIT_URL_AM}    https://mag-qa.iconectiv.com/mag-gui/admin/#/edit-cp-account?submimitAction=Edit&id=MAP-333649
${AM_Header_CP}    //div[@class='mt-60 section-title title d-flex align-items-center d-flex align-items-center justify-content-center']
${AM_Header_name}     ACCOUNT MANAGEMENT
${AM_Header_Label}    //div[@id='headingOne']    
${AM_Header_Text}     Contact Information
${AM_Firstname_Label}    //b[normalize-space()='First Name']    
${AM_Firstname_Text}    First Name
${AM_Lastname_Label}    //b[normalize-space()='Last Name']
${AM_Lastname_Text}     Last Name
${AM_Position_Label}    //b[normalize-space()='Position/Title']
${AM_Position_Text}     Position/Title
${AM_Email_Label}    //b[normalize-space()='Email']
${AM_Email_Text}    Email
${AM_Phoneno_Label}    //b[normalize-space()='Phone Number']
${AM_Phoneno_Text}    Phone Number
${AM_Header_Label_CI}    //label[normalize-space()='Company Information']
${AM_Company_Addr_Input}    //input[@id='company_addr_post_town']
${AM_Billing_Position_Input}    //input[@id='billing_position']
${AM_Billing_LastName_Input}    //input[@id='billing_last_name']  
${AM_Billing_ContatEMail_Input}    //input[@id='billing_contact_mail'] 
${AM_Billing_PhoneNumber_Input}    //input[@id='billing_phone_number']
${AM_BillingAddr1_Input}    id=billing_address1
${AM_BillingAddr_Posttown_Input}    //input[@id='billing_addr_post_town']
${AM_BillingAddr_Postcode_Input}    //input[@id='billing_addr_post_code'] 
${AM_BillingSchdule_Input}    //select[@id='billing_schedule']
${AM_Discount_Amount_Input}    //input[@id='discount_amount']
${AM_DDCustID_Input}    //input[@id='dd_cust_id']
${AM_AdditionalFees_Input}    //input[@id='additional_fees']
${AM_CPIIncrease_Input}    //input[@id='cpi_increase']
${AM_DDFirstName_Input}    //input[@id='dd_first_name']
${AM_DDLastName_Input}    //input[@id='dd_last_name']
${AM_DDEmail_Input}    //input[@id='dd_email']
${AM_PEU_Input}    //input[@id='primary_cp_endpoint_url']
${AM_HCI_Input}    //input[@id='hub_client_id']
${AM_HSK_Input}    //input[@id='hub_secret_Key']
${AM_CPCI_Input}    //input[@id='cp_client_id']
${AM_CPSK_Input}    //input[@id='cp_secret_key']
${AM_CPTU_Input}    //input[@id='cp_token_url']
${AM_Header_Text_CI}     Company Information
${AM_FTN_Label}    //label[normalize-space()='Full Trading Name']
${AM_FTN_Text}     Full Trading Name
${AM_TOE_Label}    //label[normalize-space()='Type Of Entity']
${AM_TOE_Text}     Type Of Entity
${AM_TOEO_Label}    //label[normalize-space()='Type Of Entity if Other']
${AM_TOEO_Text}     Type Of Entity if Other
${AM_CRN_Label}    //label[normalize-space()='Company Registration Number']
${AM_CRN_Text}     Company Registration Number
${AM_VRN_Label}    //label[normalize-space()='VAT Registration Number']
${AM_VRN_Text}     VAT Registration Number
${AM_CVR_Label}    //label[normalize-space()='Country of VAT Registration(if not UK)']    
${AM_CVR_Text}     Country of VAT Registration(if not UK)
${AM_ACPN_Label}    //label[normalize-space()='ACP Name']
${AM_ACPN_Text}    ACP Name
${AM_ACPNO_Label}    //label[normalize-space()='ACP Name if Other']
${AM_ACPNO_Text}     ACP Name if Other
${AM_RCPID_Label}    //label[normalize-space()='RCPID']
${AM_RCPID_Text}     RCPID
${AM_AS_Label}    //label[@class='noBold'][normalize-space()='Account Status']
${AM_AS_Text}    Account Status
${AM_REASON_Label}    //div[@aria-labelledby='headingOne']//div//div//div//label[contains(text(),'Reasons / Comments')]
${AM_REASON_Text}     Reasons / Comments
${AM_Header_CA}    //label[normalize-space()='Company Address (Registered Office Address)']
${AM_Header_CA_Text}     Company Address (Registered Office Address)
${AM_AL1_Label}    //label[normalize-space()='Address Line 1']
${AM_AL1_Text}     Address Line 1
${AM_AL2_Label}    //label[normalize-space()='Address Line 2']
${AM_AL2_Text}     Address Line 2
${AM_PTC_Label}    //label[normalize-space()='Post Town / City']
${AM_PTC_Text}     Post Town / City
${AM_COU_Label}    //label[normalize-space()='County']
${AM_COU_Text}     County
${AM_POST_ZIP_Label}    //label[normalize-space()='Postcode / ZIP Code']
${AM_POST_ZIP_Text}     Postcode / ZIP Code
${AM_COUN_Label}    //label[normalize-space()='Country']
${AM_COUN_Text}     Country
${AM_BCI_Header}    //body/div/app-root/div/app-edit-cp-account[@class='ng-star-inserted']/form[@class='ng-untouched ng-pristine ng-invalid ng-star-inserted']/div[5]/div[1]/label[1]
${AM_BCI_Text}     Billing Contact Information
${AM_BFN_Label}    //label[normalize-space()='Billing First Name']   
${AM_BFN_Input}    //input[@id='billing_first_name'] 
${AM_BFN_Text}     Billing First Name
${AM_BLN_Label}    //label[normalize-space()='Billing Last Name']
${AM_BLN_Text}     Billing Last Name
${AM_BPT_Label}    //label[normalize-space()='Billing Position / Title']
${AM_BPT_Text}     Billing Position / Title
${AM_BLE_Label}    //label[normalize-space()='Billing Email']
${AM_BLE_Text}     Billing Email
${AM_BPN_Label}    //label[normalize-space()='Billing Phone Number']
${AM_BPN_Text}     Billing Phone Number
${AM_BA_Header}    (//label[normalize-space()='Billing Address'])[1]
${AM_BA_Text}     Billing Address
${AM_BAL1_Label}    //label[normalize-space()='Billing Address Line 1']    
${AM_BAL1_Text}     Billing Address Line 1
${AM_BAL2_Label}    //label[normalize-space()='Billing Address Line 2']
${AM_BAL2_Text}     Billing Address Line 2
${AM_BPTC_Label}    //label[normalize-space()='Billing Post Town / City']
${AM_BPTC_Text}     Billing Post Town / City
${AM_BC_Label}    //label[normalize-space()='Billing County']
${AM_BC_Text}     Billing County
${AM_BPZ_Label}    //label[normalize-space()='Billing Postcode / ZIP Code']
${AM_BPZ_Text}     Billing Postcode / ZIP Code
${AM_BC_Label}    //label[normalize-space()='Billing Country']
${AM_BC_Text}     Billing Country
${AM_BD_Header}    (//label[normalize-space()='Billing Details'])[1]
${AM_BD_Text}     Billing Details
${AM_BS_Label}    //label[normalize-space()='Billing Schedule']    
${AM_BS_Text}     Billing Schedule
${AM_BDSUR_Label}    //label[normalize-space()='Billing Schedule Update Reason']
${AM_BDSUR_Text}     Billing Schedule Update Reason
${AM_BDNPD_Label}    (//label[normalize-space()='Next Payment Date'])[1]
${AM_BDNPD_Text}     Next Payment Date
${AM_BDA_Label}    //label[normalize-space()='Discount Amount']  
${AM_BDA_Text}     Discount Amount
${AM_BDAR_Label}    (//label[normalize-space()='Discount Amount Reason'])[1]    
${AM_BDAR_Text}     Discount Amount Reason
${AM_BDDCI_Label}    (//label[normalize-space()='Direct Debit Customer ID'])[1]  
${AM_BDDCI_Text}     Direct Debit Customer ID
${AM_BDAF_Label}    (//label[normalize-space()='Additional Fees'])[1]  
${AM_BDAF_Text}     Additional Fees
${AM_BDAFR_Label}    (//label[normalize-space()='Additional Fees Reason'])[1]  
${AM_BDAFR_Text}     Additional Fees Reason
${AM_BDAV_Label}    (//label[normalize-space()='Apply VAT'])[1]  
${AM_BDAV_Text}    Apply VAT
${AM_BDCPI_Label}    //label[normalize-space()='CPI Increase']  
${AM_BDCPI_Text}     CPI Increase    
${AM_BDCPIR_Label}    //label[normalize-space()='CPI Increase Reason']  
${AM_BDCPIR_Text}     CPI Increase Reason
${AM_DD_Header}    (//label[normalize-space()='Direct Debit (DD) Contact Information'])[1]    
${AM_DD_Text}     Direct Debit (DD) Contact Information
${AM_DDCFN_Label}    //label[normalize-space()='DD Contact First Name']
${AM_DDCFN_Text}     DD Contact First Name
${AM_DDCLN_Label}    //label[normalize-space()='DD Contact Last Name']    
${AM_DDCLN_Text}     DD Contact Last Name
${AM_DDCE_Label}    //label[normalize-space()='DD Contact Email']
${AM_DDCE_Text}     DD Contact Email
${AM_MAP_Options_Header}    //label[normalize-space()='MAP Options']
${AM_MAP_Options_Text}     MAP Options
${AM_cp_parameter_Header}    (//label[normalize-space()='CP Parameters'])[1]
${AM_cp_parameter_Text}     CP Parameters
${AM_Position_input_XPATH}    //input[@id='position']
${AM_Contact_Number_XPATH}    //input[@id='contactNumber']
${AM_FUllTrading_Name_XPATH}    //input[@id='company_full_trading_name']
${AM_TypeOfEntity_XPATH}    //select[@id='company_type_of_entity']
${AM_AcpName_XPATH}    //input[@id='acpName']
${AM_AddressLine1_XPATH}    //input[@id='company_address_line1']
${error_field}    (//div[@class='alert alert-warning removedot ng-star-inserted'])[1]
${Edit_cp_save_button}    //button[normalize-space()='Save Changes']
${Edit_cp_delete}    //button[@id='clearbtn']
${Edit_cp_reset_password}    //button[normalize-space()='Reset Password']