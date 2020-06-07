CLASS z_generate_table_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_generate_table_data IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        DATA: activities TYPE TABLE OF zactivities,
              activity TYPE zactivities,
              company TYPE zcompanies,
              subsidary TYPE zsubsidaries,
              current_timestamp TYPE timestamp,
              oref       TYPE REF TO cx_uuid_error.


*   read current timestamp
     GET TIME STAMP FIELD current_timestamp.

     DELETE FROM zactivities.
     DELETE FROM zcompanies.

    activity-created_at = current_timestamp.
    activity-created_by = sy-uname.
    activity-last_changed_at = current_timestamp.
    activity-last_changed_by = sy-uname.

    company-created_at = current_timestamp.
    company-created_by = sy-uname.
    company-last_changed_at = current_timestamp.
    company-last_changed_by = sy-uname.

    subsidary-created_at = current_timestamp.
    subsidary-created_by = sy-uname.
    subsidary-last_changed_at = current_timestamp.
    subsidary-last_changed_by = sy-uname.

     TRY.
        DATA: oil_activity_uuid TYPE sysuuid_x16.
        oil_activity_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        activity-id = oil_activity_uuid.
        activity-name = 'Oil'.
        activity-description = 'Oil Production Company'.
        INSERT INTO zactivities VALUES @activity.

        company-id = cl_system_uuid=>create_uuid_x16_static( ).
        company-name = 'PAO Surgutneftegas'.
        company-info = 'address Surgut city'.
        company-activity_id = oil_activity_uuid.
        INSERT INTO zcompanies VALUES @company.

        company-id = cl_system_uuid=>create_uuid_x16_static( ).
        company-name = 'PAO Lukoil'.
        company-info = 'address Moskow city'.
        company-activity_id = oil_activity_uuid.
        INSERT INTO zcompanies VALUES @company.

        DATA: gas_activity_uuid TYPE sysuuid_x16.
        gas_activity_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        activity-id = gas_activity_uuid.
        activity-name = 'Gas'.
        activity-description = 'Gas Production Company'.
        INSERT INTO zactivities VALUES @activity.

        DATA: gas_subs_uuid TYPE sysuuid_x16.
        gas_subs_uuid = cl_system_uuid=>create_uuid_x16_static( ).

        subsidary-id = gas_subs_uuid.
        subsidary-name = 'Gasprom Neft'.
        subsidary-info = 'Child of Gasprom Company'.
        INSERT INTO zsubsidaries VALUES @subsidary.

        company-id = cl_system_uuid=>create_uuid_x16_static( ).
        company-name = 'PAO Gazprom'.
        company-info = 'address St Petersburg city'.
        company-activity_id = gas_activity_uuid.
        company-subsidary_id = gas_subs_uuid.
        INSERT INTO zcompanies VALUES @company.

      CATCH cx_uuid_error INTO oref.                          " catch error
        DATA: s1 TYPE string.
        s1 = oref->get_text( ).

    ENDTRY.



out->write( 'Data uploades succesfully').




















































     SELECT * FROM zactivities INTO TABLE @activities.
     out->write( sy-dbcnt ).
     out->write( 'Data inserted successfully!').

    ENDMETHOD.
ENDCLASS.
