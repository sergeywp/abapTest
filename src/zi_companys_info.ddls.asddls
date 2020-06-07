@AbapCatalog.sqlViewName: 'ZVI_COMPANY_INFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for Companys Info'
define root view ZI_COMPANYS_INFO as select from zcompanies

association [0..1] to zactivities   as _activity   on $projection.activity_id = _activity.id
association [0..1] to zsubsidaries   as _subsidaries   on $projection.subsidary_id = _subsidaries.id

{
    
    key id,
    activity_id,
    subsidary_id,
    name,
    info,
    
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,

    
    _activity,
    _subsidaries
    
}
