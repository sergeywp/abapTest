@EndUserText.label: 'Projection view for Companies'
@AccessControl.authorizationCheck: #CHECK


@UI: {
 headerInfo: { typeName: 'Company', typeNamePlural: 'Companies', title: { type: #STANDARD, value: 'CompanyID' } } }

@Search.searchable: true


define root view entity ZC_COMPANYS_INFO
  as projection on ZI_COMPANYS_INFO 
  {
    @UI.hidden: true
    @ObjectModel.text.element: ['name']
    @Search.defaultSearchElement: true
    key id as CompanyID,
    @UI.hidden: true
    activity_id,
    @UI.hidden: true
    subsidary_id,
    name,
    info,
    
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    
    @UI.hidden: true
    last_changed_at,
    _activity.name as activityName,
    _activity.description as activityDescription,
    _activity,
    
    _subsidaries.name as subsidaryName,
    _subsidaries.info as subsidaryInfo,
    _subsidaries
  }
