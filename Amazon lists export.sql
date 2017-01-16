 
--------------------------------------------------------------------
prompt  APPLICATION 101 - Amazon Lists
--
-- Application Export:
--   Application:     101
--   Name:            Amazon Lists
--   Date and Time:   13:35 Tuesday November 20, 2007
--   Exported By:     TEST
--   Flashback:       0
--   Version: 2.1.0.00.39
 
-- Import:
--   Using application application builder
--   or
--   Using sqlplus as the Oracle user: FLOWS_020100
 
-- Application Statistics:
--   Pages:                 9
--     Items:              29
--     Computations:        0
--     Validations:         1
--     Processes:          17
--     Regions:            16
--     Buttons:            17
--   Shared Components
--     Breadcrumbs:         1
--        Entries           4
--     Items:               1
--     Computations:        0
--     Processes:           0
--     Parent Tabs:         1
--     Tab Sets:            1
--        Tabs:             4
--     NavBars:             1
--     Lists:               1
--     Shortcuts:           1
--     Themes:              2
--     Templates:
--        Page:            18
--        List:            29
--        Report:          14
--        Label:           10
--        Region:          42
--     Messages:            0
--     Build Options:       0
 
 
set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the owner (parsing schema) of the application or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>6933716712322026);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en-gb'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2005.05.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := 101;
   wwv_flow_api.g_id_offset := 0;
null;
 
end;
/

 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(101);
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(101);
null;
 
end;
/

 
begin
 
wwv_flow_api.create_flow(
  p_id    => 101,
  p_display_id=> 101,
  p_owner => 'TEST',
  p_name  => 'Amazon Lists',
  p_alias => 'F101',
  p_page_view_logging => 'NO',
  p_default_page_template=> 6961414942663846 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 6960822198663821 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 6963431850663873 + wwv_flow_api.g_id_offset,
  p_error_template    => 6961414942663846 + wwv_flow_api.g_id_offset,
  p_checksum_salt_last_reset => '20071119172119',
  p_home_link         => 'f?p=&APP_ID.:1:&SESSION.',
  p_box_width         => '98%',
  p_flow_language     => 'en-gb',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_flow_image_prefix => '/i/',
  p_documentation_banner=> '',
  p_authentication    => 'CUSTOM2',
  p_login_url         => '',
  p_logout_url        => '',
  p_public_url_prefix => '',
  p_public_user       => '',
  p_dbauth_url_prefix => '',
  p_proxy_server      => '',
  p_cust_authentication_process=> '.'||to_char(7133612662481342 + wwv_flow_api.g_id_offset)||'.',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version      => 'release 1.0',
  p_flow_status       => 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status      => 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_vpd               => '',
  p_theme_id => 2,
  p_default_label_template => 6966430146663925 + wwv_flow_api.g_id_offset,
  p_default_report_template => 6965617917663904 + wwv_flow_api.g_id_offset,
  p_default_list_template => 6964810339663893 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 6966812784663928 + wwv_flow_api.g_id_offset,
  p_default_button_template => 6961928397663859 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 6962605338663871 + wwv_flow_api.g_id_offset,
  p_default_form_template => 6962730004663871 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 6962526553663871 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 6962424813663871 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 6963431850663873 + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20071119172119',
  p_required_roles             => wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

---------------------------------------
prompt  ...AUTHORIZATION SCHEMES
--
 
begin
 
null;
 
end;
/

--
prompt  ...Navigation Bar Entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id             => 6968129337663992 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_icon_sequence  => 200,
  p_icon_image     => '',
  p_icon_subtext   => 'Logout',
  p_icon_target    => '&LOGOUT_URL.',
  p_icon_image_alt => 'Logout',
  p_icon_height    => 32,
  p_icon_width     => 32,
  p_icon_height2   => 24,
  p_icon_width2    => 24,
  p_icon_bar_disp_cond      => '',
  p_icon_bar_disp_cond_type => 'CURRENT_LOOK_IS_1',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

---------------------------------------
prompt  ...Application Level Processes
--
---------------------------------------
prompt  ...Application Level Items
--
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 6980101861715020 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FSP_AFTER_LOGIN_URL',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_item_comment=> 'Used by Custom2 authentication for deep linking support');
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Level Computations
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Tabs
--
 
begin
 
wwv_flow_api.create_tab (
  p_id=> 6970604875664118 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_AMAZON_LIST',
  p_tab_text => 'Amazon Lists',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '2',
  p_tab_parent_tabset=>'TS1',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
wwv_flow_api.create_tab (
  p_id=> 7422330185561201 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 15,
  p_tab_name=> 'T_DASHBOARD',
  p_tab_text => 'Dashboard',
  p_tab_step => 8,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'TS1',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
wwv_flow_api.create_tab (
  p_id=> 6975103432664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_LIST_ITEM',
  p_tab_text => 'Items',
  p_tab_step => 3,
  p_tab_also_current_for_pages => '4',
  p_tab_parent_tabset=>'TS1',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
wwv_flow_api.create_tab (
  p_id=> 6986104273902692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 30,
  p_tab_name=> 'Prices',
  p_tab_text => 'Prices',
  p_tab_step => 5,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'TS1',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
 
end;
/

---------------------------------------
prompt  ...Application Parent Tabs
--
 
begin
 
wwv_flow_api.create_toplevel_tab (
  p_id=> 7320016372391726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 10,
  p_tab_name  => 'T_AMAZONLIST',
  p_tab_text  => 'Amazon List',
  p_tab_target=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'TS1',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment=> '');
 
 
end;
/

---------------------------------------
prompt  ...Application Level Lists of Values
--
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 6969320037664085 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'Report Row Per Page',
  p_lov_query=> '.'||to_char(6969320037664085 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Trees
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Level Lists of Values Entries
--
 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969404246664092 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'10',
  p_lov_return_value=>'10',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969519117664106 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'15',
  p_lov_return_value=>'15',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969632081664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'20',
  p_lov_return_value=>'20',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969724765664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>40,
  p_lov_disp_value=>'30',
  p_lov_return_value=>'30',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969806007664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>50,
  p_lov_disp_value=>'50',
  p_lov_return_value=>'50',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6969910165664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>60,
  p_lov_disp_value=>'100',
  p_lov_return_value=>'100',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6970020256664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>70,
  p_lov_disp_value=>'200',
  p_lov_return_value=>'200',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6970131854664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>80,
  p_lov_disp_value=>'500',
  p_lov_return_value=>'500',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6970229996664107 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>90,
  p_lov_disp_value=>'1000',
  p_lov_return_value=>'1000',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>6970311083664109 + wwv_flow_api.g_id_offset,
  p_lov_id=>6969320037664085 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>100,
  p_lov_disp_value=>'5000',
  p_lov_return_value=>'5000',
  p_lov_data_comment=> '');
 
null;
 
end;
/

---------------------------------------
prompt  ...Page Groups
--
 
begin
 
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 1: AMAZON_LIST
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 1,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'AMAZON_LIST',
  p_step_title=> 'AMAZON_LIST',
  p_step_sub_title => 'AMAZON_LIST',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070522225036',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>1,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'"LISTID",'||chr(10)||
'''<a href="''||list_url||''">''||LIST_NAME||''<a>'' as list_name,'||chr(10)||
'"LAST_REFRESH",'||chr(10)||
'"LIST_COMMENT",'||chr(10)||
'"REFRESH_YN"'||chr(10)||
' from   "AMAZON_LIST" '||chr(10)||
'where '||chr(10)||
'(   '||chr(10)||
' instr(upper("LISTID"),upper(nvl(:P1_REPORT_SEARCH,"LISTID"))) > 0  or'||chr(10)||
' instr(upper("LIST_NAME"),upper(nvl(:P1_REPORT_SEARCH,"LIST_NAME"))) > 0  or'||chr(10)||
' instr(upper("REFRESH_YN"),upper(nvl(:P1_REPORT_SEARCH,"REFRESH_YN"))) > 0  or'||chr(10)||
' in';

s:=s||'str(upper("LIST_URL"),upper(nvl(:P1_REPORT_SEARCH,"LIST_URL"))) > 0  or'||chr(10)||
' instr(upper("LIST_COMMENT"),upper(nvl(:P1_REPORT_SEARCH,"LIST_COMMENT"))) > 0 '||chr(10)||
')'||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Amazon Lists',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> 'Unable to show report.',
  p_customized                   => '0',
  p_translate_title              => 'N',
  p_query_row_template           => 6965617917663904+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'COLON_DELMITED_LIST',
  p_query_num_rows               => '15',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'No data found.',
  p_query_num_rows_item          => 'P1_ROWS',
  p_query_num_rows_type          => 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max          => '500',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'Y',
  p_csv_output_link_text         => 'Spread Sheet',
  p_query_asc_image              => 'themes/theme_2/sort_arrow_down.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'themes/theme_2/sort_arrow_up.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6981430951723353 + wwv_flow_api.g_id_offset,
  p_region_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LISTID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Listid',
  p_column_link=> 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::P_LISTID:#LISTID#',
  p_column_linktext=> '#LISTID#',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6970911420664156 + wwv_flow_api.g_id_offset,
  p_region_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'LIST_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> 'List Name',
  p_column_hit_highlight=> '&P1_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 1,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'AMAZON_LIST',
  p_ref_column_name=> 'LIST_NAME',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6971003358664156 + wwv_flow_api.g_id_offset,
  p_region_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'LAST_REFRESH',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Last Refresh',
  p_column_format=> 'DD-MON-YYYY HH24:MI',
  p_column_hit_highlight=> '&P1_REPORT_SEARCH.',
  p_column_alignment=> 'RIGHT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'AMAZON_LIST',
  p_ref_column_name=> 'LAST_REFRESH',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6971226304664157 + wwv_flow_api.g_id_offset,
  p_region_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'LIST_COMMENT',
  p_column_display_sequence=> 3,
  p_column_heading=> 'List Comment',
  p_column_hit_highlight=> '&P1_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'AMAZON_LIST',
  p_ref_column_name=> 'LIST_COMMENT',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6971316408664159 + wwv_flow_api.g_id_offset,
  p_region_id=> 6970700656664140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'REFRESH_YN',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Refresh Yn',
  p_column_hit_highlight=> '&P1_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'AMAZON_LIST',
  p_ref_column_name=> 'REFRESH_YN',
  p_column_comment               => '');
end;
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6971600137664162 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 6970700656664140+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Reset',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6974608785664295 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 6970700656664140+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=101:2:&SESSION.::NO:2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6972023236664184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6971407485664159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_REPORT_SEARCH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 6970700656664140+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_prompt=>'Search',
  p_display_as=> 'TEXT_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6971509358664162 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ROWS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 6970700656664140+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '15',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Display',
  p_source=>'15',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'Report Row Per Page',
  p_lov => '.'||to_char(6969320037664085 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6971703942664176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_GO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 6970700656664140+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'Go',
  p_source=>'Go',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(6961928397663859 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 6971825453664176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to reset pagination.',
  p_process_when=>'Go,P1_REPORT_SEARCH',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P1_REPORT_SEARCH,P1_ROWS';

wwv_flow_api.create_page_process(
  p_id     => 6971931240664181 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Reset report search',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to clear cache.',
  p_process_when_button_id=>6971600137664162 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 2: AMAZON_LIST
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>';

wwv_flow_api.create_page(
  p_id     => 2,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'AMAZON_LIST',
  p_step_title=> 'AMAZON_LIST',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070531011830',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>2,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>2,p_text=>ph);
end;
 
end;
/

declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6972513771664259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'AMAZON_LIST',
  p_plug_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'AFTER_SHOW_ITEMS',
  p_plug_source  => s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6974804489664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Breadcrumbs',
  p_plug_template=> 6962424813663871+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'REGION_POSITION_01',
  p_plug_source  => s,
  p_plug_source_type=> 'M'|| to_char(6969230818664065 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 6966812784663928+ wwv_flow_api.g_id_offset,
  p_plug_display_error_message=> 'Unable to show breadcrumb.',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6972628620664262 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 10,
  p_button_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6972800050664262 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 30,
  p_button_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P2_LIST_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6972920981664262 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 40,
  p_button_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P2_LIST_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6972722600664262 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 20,
  p_button_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6973131094664270 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6973222823664270 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_LIST_ID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'List Id',
  p_source=>'LIST_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6973310924664271 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_LIST_NAME',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'List Name',
  p_source=>'LIST_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6973523931664279 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_REFRESH_YN',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Refresh Yn',
  p_source=>'REFRESH_YN',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6973725769664279 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_LIST_URL',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'List Url',
  p_source=>'LIST_URL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6973900685664279 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_LIST_COMMENT',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'List Comment',
  p_source=>'LIST_COMMENT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6974107247664281 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_LAST_REFRESH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 6972513771664259+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Last Refresh',
  p_source=>'LAST_REFRESH',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 6974322876664281 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_validation_name => 'P2_LAST_REFRESH must be date',
  p_validation_sequence=> 5,
  p_validation => 'P2_LAST_REFRESH',
  p_validation_type => 'ITEM_IS_DATE',
  p_error_message => 'Last Refresh must be a valid date.',
  p_when_button_pressed=> 6972800050664262 + wwv_flow_api.g_id_offset,
  p_associated_item=> 6974107247664281 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:AMAZON_LIST:P2_LIST_ID:LIST_ID';

wwv_flow_api.create_page_process(
  p_id     => 6974415462664292 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 1,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from AMAZON_LIST',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:AMAZON_LIST:P2_LIST_ID:LIST_ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 6974502526664293 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 1,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of AMAZON_LIST',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table AMAZON_LIST.',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 3: LIST_ITEM
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 3,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'LIST_ITEM',
  p_step_title=> 'LIST_ITEM',
  p_step_sub_title => 'LIST_ITEM',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070627221342',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>3,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'"LIST_NAME" as "List name",'||chr(10)||
'''<img border="0" src="''||nvl(img_url,''http://ec1.images-amazon.com/images/G/02/uk-shared/logos/amazon-logo-151x32._V45462390_.gif'')||''" />'' as img,'||chr(10)||
'"ASIN",'||chr(10)||
'"TITLE",'||chr(10)||
'"ITEM_URL",'||chr(10)||
'"ARTIST",'||chr(10)||
'case when get_latest_prices (asin) <= 300 '||chr(10)||
'     then ''<b>'' || to_char(get_latest_prices (asin)) || ''</b>'''||chr(10)||
'     when get_latest_prices (asin) between 300 and 500'||chr(10)||
'     t';

s:=s||'hen ''<font color="blue">'' || to_char(get_latest_prices (asin)) || ''</font>'''||chr(10)||
'else to_char(get_latest_prices (asin))'||chr(10)||
'end as min_price,'||chr(10)||
'case when get_price_diff(asin) < 0'||chr(10)||
'     then ''<font color="green">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     when get_price_diff(asin) > 0'||chr(10)||
'     then ''<font color="red">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     else null'||chr(10)||
'end as diff_price'||chr(10)||
'from   "LIST_ITEM';

s:=s||'" join "AMAZON_LIST" using (listid)'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'and nvl(received,0) = 0'||chr(10)||
'and watch != ''D'''||chr(10)||
'and (   '||chr(10)||
' instr(upper("ASIN"),upper(nvl(:P3_REPORT_SEARCH,"ASIN"))) > 0  or'||chr(10)||
' instr(upper("TITLE"),upper(nvl(:P3_REPORT_SEARCH,"TITLE"))) > 0  or'||chr(10)||
' instr(upper("ARTIST"),upper(nvl(:P3_REPORT_SEARCH,"ARTIST"))) > 0  or'||chr(10)||
' instr(upper("LISTID"),upper(nvl(:P3_REPORT_SEARCH,"LISTI';

s:=s||'D"))) > 0  or'||chr(10)||
' instr(upper("ITEM_URL"),upper(nvl(:P3_REPORT_SEARCH,"ITEM_URL"))) > 0 '||chr(10)||
') '||chr(10)||
'order by get_latest_prices (asin)';

wwv_flow_api.create_report_region (
  p_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_name=> 'Items',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> 'Unable to show report.',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 6966114199663914+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'COLON_DELMITED_LIST',
  p_query_num_rows               => '100',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'No data found.',
  p_query_num_rows_item          => 'P3_ROWS',
  p_query_num_rows_type          => 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max          => '2000',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'Y',
  p_csv_output_link_text         => 'Spread Sheet',
  p_query_asc_image              => 'themes/theme_2/sort_arrow_down.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'themes/theme_2/sort_arrow_up.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6996206007990585 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'List name',
  p_column_display_sequence=> 5,
  p_column_heading=> 'List Name',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7244227661426860 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'IMG',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6975327073664304 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:4:#APP_SESSION#::::P4_ASIN:#ASIN#',
  p_column_linktext=> '<img src="#IMAGE_PREFIX#themes/theme_2/ed-item.gif" alt="Edit" />',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ASIN',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6975425706664304 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Title',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_ASIN:#ASIN#',
  p_column_linktext=> '#TITLE#',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'TITLE',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6975517856664304 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ITEM_URL',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item Url',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ITEM_URL',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6975718658664304 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ARTIST',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Artist',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ARTIST',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7196404238789559 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MIN_PRICE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Min Price',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7194813888763896 + wwv_flow_api.g_id_offset,
  p_region_id=> 6975211884664300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DIFF_PRICE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Diff',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6976012123664309 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3,
  p_button_sequence=> 10,
  p_button_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Reset',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6978612057664321 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 3,
  p_button_sequence=> 10,
  p_button_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=101:4:&SESSION.::NO:4',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6976416254664310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_action=> 'f?p=&APP_ID.:3:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6975822710664304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_REPORT_SEARCH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_prompt=>'Search',
  p_display_as=> 'TEXT_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6975910850664307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_ROWS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '15',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Display',
  p_source=>'50',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'Report Row Per Page',
  p_lov => '.'||to_char(6969320037664085 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6976115775664309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_GO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'Go',
  p_source=>'Go',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(6961928397663859 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7025224731374014 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P_LISTID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 6975211884664300+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 6976201133664310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to reset pagination.',
  p_process_when=>'Go,P3_REPORT_SEARCH',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P3_REPORT_SEARCH,P3_ROWS';

wwv_flow_api.create_page_process(
  p_id     => 6976303200664310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Reset report search',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to clear cache.',
  p_process_when_button_id=>6976012123664309 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 4: LIST_ITEM
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph:=ph||'<script language="JavaScript" type="text/javascript">'||chr(10)||
'<!--'||chr(10)||
''||chr(10)||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>';

wwv_flow_api.create_page(
  p_id     => 4,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'LIST_ITEM',
  p_step_title=> 'LIST_ITEM',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => ' ',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20071108161034',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>4,p_text=>h);
wwv_flow_api.set_html_page_header(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>4,p_text=>ph);
end;
 
end;
/

declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6976929038664315 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'LIST_ITEM',
  p_plug_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'AFTER_SHOW_ITEMS',
  p_plug_source  => s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6978800065664321 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Breadcrumbs',
  p_plug_template=> 6962424813663871+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'REGION_POSITION_01',
  p_plug_source  => s,
  p_plug_source_type=> 'M'|| to_char(6969230818664065 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 6966812784663928+ wwv_flow_api.g_id_offset,
  p_plug_display_error_message=> 'Unable to show breadcrumb.',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 6977017150664315 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 10,
  p_button_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6977227504664315 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 30,
  p_button_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P4_ASIN',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6977302686664315 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 40,
  p_button_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_condition=> 'P4_ASIN',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 6977120698664315 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 4,
  p_button_sequence=> 20,
  p_button_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>6977423456664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&APP_ID.:3:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6977528542664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_ASIN',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Asin',
  p_source=>'ASIN',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6977632337664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_TITLE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Title',
  p_source=>'TITLE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6977805172664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_ARTIST',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Artist',
  p_source=>'ARTIST',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6978017941664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_LISTID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Listid',
  p_source=>'LISTID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'No help available for this page item.';

wwv_flow_api.create_page_item(
  p_id=>6978203154664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_ITEM_URL',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Item Url',
  p_source=>'ITEM_URL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_help_text   => h,
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7409203634375426 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_WATCH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 14,
  p_item_plug_id => 6976929038664315+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default => 'N',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Watch',
  p_source=>'WATCH',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'RADIOGROUP',
  p_lov => 'STATIC2:Yes;Y,No;N,Deleted;D',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:LIST_ITEM:P4_ASIN:ASIN';

wwv_flow_api.create_page_process(
  p_id     => 6978427703664318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 1,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from LIST_ITEM',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:LIST_ITEM:P4_ASIN:ASIN|IUD';

wwv_flow_api.create_page_process(
  p_id     => 6978524283664321 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 1,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of LIST_ITEM',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table LIST_ITEM.',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 5: Item Prices
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 5,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'Item Prices',
  p_step_title=> 'Item Prices',
  p_step_sub_title => 'Item Prices',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070601222140',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>5,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select price_date as "Price Date"'||chr(10)||
'     , ''£'' || to_char(new_offer_price/100) "new offer price"'||chr(10)||
'     , ''£'' || to_char(used_offer_price/100) "used offer price" '||chr(10)||
'     , ''£'' || to_char(amazon_price/100) "Amazon price" '||chr(10)||
'from list_item join item_price_history using (asin)'||chr(10)||
'where asin = nvl(:P5_ASIN, asin)'||chr(10)||
'order by asin, price_date';

wwv_flow_api.create_report_region (
  p_id=> 6986316518902701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_name=> 'Price History',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 2,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 6966114199663914+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '50',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'No data found.',
  p_query_num_rows_type          => 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max          => '2000',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6990725087956323 + wwv_flow_api.g_id_offset,
  p_region_id=> 6986316518902701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'Price Date',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Price Date',
  p_column_format=> 'DD-MON-YYYY HH24:MI',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6990820941956323 + wwv_flow_api.g_id_offset,
  p_region_id=> 6986316518902701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'new offer price',
  p_column_display_sequence=> 2,
  p_column_heading=> 'New Offer Price',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 6990922953956323 + wwv_flow_api.g_id_offset,
  p_region_id=> 6986316518902701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'used offer price',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Used Offer Price',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7057014416976593 + wwv_flow_api.g_id_offset,
  p_region_id=> 6986316518902701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'Amazon price',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Amazon Price',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ''<img border="0" src="''||nvl(img_url,''http://ec1.images-amazon.com/images/G/02/uk-shared/logos/amazon-logo-151x32._V45462390_.gif'')||''" />'' as picture'||chr(10)||
'     ,''<a href="''||item_url||''">''||asin||''<a>'' as "ASIN"'||chr(10)||
'     , title || '' - '' || artist as "Title"'||chr(10)||
'     , ( select max(to_number(iph.AMAZON_PRICE)) from item_price_history iph where iph.asin = :p5_asin ) as "High Amazon"'||chr(10)||
'     , ( select ';

s:=s||'min(to_number(iph.AMAZON_PRICE)) from item_price_history iph where iph.asin = :p5_asin) as "Low Amazon"'||chr(10)||
'     , ( select greatest ( max(to_number(iph.NEW_OFFER_PRICE)), max(to_number(iph.USED_OFFER_PRICE)) ) from item_price_history iph where iph.asin = :p5_asin) as "High marketplace"'||chr(10)||
'     , ( select least ( min(to_number(iph.NEW_OFFER_PRICE)), min(to_number(iph.USED_OFFER_PRICE)) ) from item_pric';

s:=s||'e_history iph where iph.asin = :p5_asin) as "Low marketplace"'||chr(10)||
'from list_item'||chr(10)||
'where asin = :p5_asin';

wwv_flow_api.create_report_region (
  p_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_name=> 'Summary',
  p_template=> 0+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 5,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 2,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '1',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as          => ' - ',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'no data found',
  p_query_num_rows_type          => '0',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7407107481329176 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'PICTURE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Picture',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397206647246545 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Asin',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397301467246548 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'Title',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Title',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397428868246548 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'High Amazon',
  p_column_display_sequence=> 3,
  p_column_heading=> 'High Amazon',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397517124246550 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'Low Amazon',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Low Amazon',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397611077246550 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'High marketplace',
  p_column_display_sequence=> 5,
  p_column_heading=> 'High Marketplace',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7397702353246550 + wwv_flow_api.g_id_offset,
  p_region_id=> 7396916344246370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'Low marketplace',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Low Marketplace',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7042830721508154 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 5,
  p_button_sequence=> 10,
  p_button_plug_id => 6986316518902701+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'See All',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7046832153536971 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_branch_action=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>7042830721508154+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_branch_comment=> 'Created 18-APR-2007 11:04 by TEST');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7034319761438768 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_name=>'P5_ASIN',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 6986316518902701+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P5_ASIN';

wwv_flow_api.create_page_process(
  p_id     => 7045204449528965 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'P_CLEAR_ITEMS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Failure to Reset criteria',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 6: LIST_ITEM_UP_DOWN
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 6,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'LIST_ITEM_UP_DOWN',
  p_step_title=> 'LIST_ITEM',
  p_step_sub_title => 'LIST_ITEM',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070505000239',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>6,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'"LIST_NAME" as "List name",'||chr(10)||
'"ASIN",'||chr(10)||
'"TITLE",'||chr(10)||
'"ITEM_URL",'||chr(10)||
'"ARTIST",'||chr(10)||
'get_latest_prices(asin) min_p,'||chr(10)||
'case when substr(get_up_down_flag(asin),1,1) = ''-'''||chr(10)||
'     then ''<font color="green">'' || get_up_down_flag(asin) || ''</font>'''||chr(10)||
'     when substr(get_up_down_flag(asin),1,1) = ''+'''||chr(10)||
'     then ''<font color="red">'' || get_up_down_flag(asin) || ''</font>'''||chr(10)||
'     else get_up_down_flag(asin)'||chr(10)||
'end a';

s:=s||'s min_price'||chr(10)||
'from   "LIST_ITEM" join "AMAZON_LIST" using (listid)'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'and nvl(received,0) = 0'||chr(10)||
'and (   '||chr(10)||
' instr(upper("ASIN"),upper(nvl(:P6_REPORT_SEARCH,"ASIN"))) > 0  or'||chr(10)||
' instr(upper("TITLE"),upper(nvl(:P6_REPORT_SEARCH,"TITLE"))) > 0  or'||chr(10)||
' instr(upper("ARTIST"),upper(nvl(:P6_REPORT_SEARCH,"ARTIST"))) > 0  or'||chr(10)||
' instr(upper("LISTID"),upper(nvl(:P6_REPORT_S';

s:=s||'EARCH,"LISTID"))) > 0  or'||chr(10)||
' instr(upper("ITEM_URL"),upper(nvl(:P6_REPORT_SEARCH,"ITEM_URL"))) > 0 '||chr(10)||
') '||chr(10)||
'';

wwv_flow_api.create_report_region (
  p_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 6,
  p_name=> 'LIST_ITEM',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> 'Unable to show report.',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 6965617917663904+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'COLON_DELMITED_LIST',
  p_query_num_rows               => '50',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'No data found.',
  p_query_num_rows_item          => 'P6_ROWS',
  p_query_num_rows_type          => 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max          => '2000',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'Y',
  p_csv_output_link_text         => 'Spread Sheet',
  p_query_asc_image              => 'themes/theme_2/sort_arrow_down.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'themes/theme_2/sort_arrow_up.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7173111770036770 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'List name',
  p_column_display_sequence=> 4,
  p_column_heading=> 'List Name',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7173214163036785 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:4:#APP_SESSION#::::P4_ASIN:#ASIN#',
  p_column_linktext=> '<img src="#IMAGE_PREFIX#themes/theme_2/ed-item.gif" alt="Edit" />',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ASIN',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7173330200036787 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Title',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_ASIN:#ASIN#',
  p_column_linktext=> '#TITLE#',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 2,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'TITLE',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7184226852160471 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ITEM_URL',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Item Url',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7173513356036789 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ARTIST',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Artist',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ARTIST',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7176203116040059 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'MIN_P',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Min P',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 1,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7173622386036789 + wwv_flow_api.g_id_offset,
  p_region_id=> 7172915716036670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MIN_PRICE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Min Price',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_column_comment               => '');
end;
end;
/
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 7173818023036789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 6,
  p_plug_name=> 'Breadcrumbs',
  p_plug_template=> 6962424813663871+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'REGION_POSITION_01',
  p_plug_source  => s,
  p_plug_source_type=> 'M'|| to_char(6969230818664065 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 6966812784663928+ wwv_flow_api.g_id_offset,
  p_plug_display_error_message=> 'Unable to show breadcrumb.',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7174006203036793 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 10,
  p_button_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Reset',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7174221764036817 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 6,
  p_button_sequence=> 10,
  p_button_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=101:4:&SESSION.::NO:4',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7175620454036912 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_action=> 'f?p=&APP_ID.:6:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7174429775036828 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_REPORT_SEARCH',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_prompt=>'Search',
  p_display_as=> 'TEXT_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7174622041036873 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_ROWS',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => '15',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Display',
  p_source=>'50',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'Report Row Per Page',
  p_lov => '.'||to_char(6969320037664085 + wwv_flow_api.g_id_offset)||'.',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7174808839036879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'P6_GO',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'Go',
  p_source=>'Go',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(6961928397663859 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7175015137036879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_name=>'6_P_LISTID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 7172915716036670+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 7175200395036895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to reset pagination.',
  p_process_when=>'Go,P6_REPORT_SEARCH',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P6_REPORT_SEARCH,P6_ROWS';

wwv_flow_api.create_page_process(
  p_id     => 7175430577036907 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 6,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Reset report search',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to clear cache.',
  p_process_when_button_id=>7174006203036793 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 6
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 7: Item Price History
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 7,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Item Price History',
  p_step_title=> 'Item Price History',
  p_step_sub_title => 'Item Price History',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070511110041',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>7,p_text=>h);
end;
 
end;
/

declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'<div class="svgRegion"><embed src="f?p=&APP_ID.:7:#SESSION#:FLOW_SVG_CHART_R#REGION_ID#" width="#WIDTH#" height="#HEIGHT#" type="image/svg+xml" /></div><script src="#IMAGE_PREFIX#javascript/plugins.js" language="JavaScript" type="text/javascript"></script>';

wwv_flow_api.create_page_plug (
  p_id=> 7322302713513706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Item Price Graph',
  p_plug_template=> 6962605338663871+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'AFTER_SHOW_ITEMS',
  p_plug_source  => s,
  p_plug_source_type=> 'SVG_CHART',
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
declare
 a varchar2(32767):=null;
begin
a:=a||'LINE';

wwv_flow_api.create_generic_attr(
 p_id=>7322521449513731+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>2,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'ENABLE';

wwv_flow_api.create_generic_attr(
 p_id=>7326129681556409+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>7,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'N';

wwv_flow_api.create_generic_attr(
 p_id=>7322600764513737+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>9,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'LOOK_3';

wwv_flow_api.create_generic_attr(
 p_id=>7322732269513739+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>10,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Y';

wwv_flow_api.create_generic_attr(
 p_id=>7322800189513739+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>14,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'PARSE_CHART_QUERY';

wwv_flow_api.create_generic_attr(
 p_id=>7326218425556410+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>16,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7326316175556410+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>20,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>7326424741556410+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>21,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7326523147556410+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>22,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7326627408556412+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>23,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>7326717820556412+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>24,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7326816682556414+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>25,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7326916653556415+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>26,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>7327010677556415+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>27,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7327132767556415+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>28,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7327208832556417+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>29,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'400';

wwv_flow_api.create_generic_attr(
 p_id=>7322906512513740+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>30,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'600';

wwv_flow_api.create_generic_attr(
 p_id=>7323002003513740+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>31,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>7327328651556418+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>35,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7327414032556420+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>36,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7327500584556420+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>37,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>7327628587556420+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>38,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7327724537556420+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>39,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>7327801526556426+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>40,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>7327923546556426+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>41,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>7328001707556428+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>42,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'AUTO';

wwv_flow_api.create_generic_attr(
 p_id=>7328113153556431+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>60,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'NO';

wwv_flow_api.create_generic_attr(
 p_id=>7328208086556431+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>64,
 p_attribute_value=>a);
end;
declare
 a varchar2(32767):=null;
begin
a:=a||'NO';

wwv_flow_api.create_generic_attr(
 p_id=>7328327976556431+wwv_flow_api.g_id_offset,
 p_region_id=>7322302713513706+wwv_flow_api.g_id_offset,
 p_attribute_id=>67,
 p_attribute_value=>a);
end;
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select item_url as link'||chr(10)||
'     , title || artist as label'||chr(10)||
'     , least(new_offer_price/100,used_offer_price/100,amazon_price/100) as value'||chr(10)||
'from list_item join item_price_history using (asin)'||chr(10)||
'where asin = nvl(:P7_ASIN, asin)'||chr(10)||
'order by asin, price_date';

wwv_flow_api.create_chart_series_attr(
  p_id => 7323125031513754+wwv_flow_api.g_id_offset,
  p_region_id => 7322302713513706+wwv_flow_api.g_id_offset,
  p_series_id => 1,
  p_a001 => a1,
  p_a002 => '100',
  p_a003 => 'no data found',
  p_a004 => 'price history',
  p_a005 => '#99FFFF',
  p_a006 => '',
  p_a007 => '',
  p_a008 => '',
  p_a009 => 'CIRCLE',
  p_a010 => '3',
  p_a011 => 'STRAIGHT',
  p_a012 => '2',
  p_a013 => '',
  p_a014 => '',
  p_a015 => '',
  p_a016 => 'PARSE_CHART_QUERY',
  p_a017 => '',
  p_a018 => '',
  p_a019 => '',
  p_a020 => '',
  p_a021 => '',
  p_a022 => '',
  p_a023 => '',
  p_a024 => '',
  p_a025 => '',
  p_a026 => '',
  p_a027 => '',
  p_a028 => '',
  p_a029 => '',
  p_a030 => '',
  p_a031 => '',
  p_a032 => '',
  p_a033 => '',
  p_a034 => '',
  p_a035 => '',
  p_a036 => '',
  p_a037 => '',
  p_a038 => '',
  p_a039 => '',
  p_a040 => '',
  p_a041 => '',
  p_a042 => '',
  p_a043 => '',
  p_a044 => '',
  p_a045 => '',
  p_a046 => '',
  p_a047 => '',
  p_a048 => '',
  p_a049 => '',
  p_a050 => '');
end;
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7324620546544254 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_ASIN',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 7322302713513706+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default => 'B000B9ROKO',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 8: Dashboard
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 8,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'Dashboard',
  p_step_title=> 'LIST_ITEM',
  p_step_sub_title => 'LIST_ITEM',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> '',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20071119172119',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>8,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select * from items_on_lowest_price'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'order by price';

wwv_flow_api.create_report_region (
  p_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_name=> 'Lowest_Items',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_display_column=> 1,
  p_display_point=> 'BEFORE_BOX_BODY',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 6965617917663904+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '30',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as          => ' - ',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'no data found',
  p_query_num_rows_type          => 'NEXT_PREVIOUS_LINKS',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7929409591322601 + wwv_flow_api.g_id_offset,
  p_region_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN_URL',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Asin Url',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7929514737322610 + wwv_flow_api.g_id_offset,
  p_region_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Asin',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7929624947322610 + wwv_flow_api.g_id_offset,
  p_region_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Title',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7929729580322610 + wwv_flow_api.g_id_offset,
  p_region_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PRICE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Price',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7929829932322610 + wwv_flow_api.g_id_offset,
  p_region_id=> 7929101528322376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'LISTID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Listid',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select * from ('||chr(10)||
'select '||chr(10)||
'''<a href="''||item_url||''">''||asin||''<a>'' as ASIN_URL,'||chr(10)||
'ASIN,'||chr(10)||
'''<b>''||"TITLE"||''</b>'' || '' / '' || "ARTIST" as Title,'||chr(10)||
'get_latest_prices (asin) || '' ('' ||'||chr(10)||
'case when get_price_diff(asin) < 0'||chr(10)||
'     then ''<font color="green">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     when get_price_diff(asin) > 0'||chr(10)||
'     then ''<font color="red">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     els';

s:=s||'e null'||chr(10)||
'end || '')'' as Price'||chr(10)||
'from   "LIST_ITEM" join "AMAZON_LIST" using (listid)'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'and nvl(received,0) = 0'||chr(10)||
'and watch != ''D'''||chr(10)||
'order by nvl(get_price_diff(asin), 0) '||chr(10)||
')'||chr(10)||
'where rownum < 11';

wwv_flow_api.create_report_region (
  p_id=> 7423529767561215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_name=> 'Top 10 Fallers',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_display_column=> 1,
  p_display_point=> 'BEFORE_BOX_BODY',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'N',
  p_query_row_template           => 6965617917663904+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '10',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as          => ' - ',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'no data found',
  p_query_num_rows_type          => '0',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424026943561217 + wwv_flow_api.g_id_offset,
  p_region_id=> 7423529767561215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN_URL',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Asin Url',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7423827680561217 + wwv_flow_api.g_id_offset,
  p_region_id=> 7423529767561215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Asin',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7423922818561217 + wwv_flow_api.g_id_offset,
  p_region_id=> 7423529767561215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Title',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7423710563561217 + wwv_flow_api.g_id_offset,
  p_region_id=> 7423529767561215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PRICE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Price',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select * from ('||chr(10)||
'select '||chr(10)||
'''<a href="''||item_url||''">''||asin||''<a>'' as ASIN_URL,'||chr(10)||
'ASIN,'||chr(10)||
'''<b>''||"TITLE"||''</b>'' || '' / '' || "ARTIST" as Title,'||chr(10)||
'get_latest_prices (asin) || '' ('' ||'||chr(10)||
'case when get_price_diff(asin) < 0'||chr(10)||
'     then ''<font color="green">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     when get_price_diff(asin) > 0'||chr(10)||
'     then ''<font color="red">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     els';

s:=s||'e null'||chr(10)||
'end || '')'' as Price'||chr(10)||
'from   "LIST_ITEM" join "AMAZON_LIST" using (listid)'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'and nvl(received,0) = 0'||chr(10)||
'and watch != ''D'''||chr(10)||
'order by nvl(get_price_diff(asin), 0)  desc'||chr(10)||
')'||chr(10)||
'where rownum < 11';

wwv_flow_api.create_report_region (
  p_id=> 7424111393561217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_name=> 'Top 10 Risers',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 30,
  p_display_column=> 2,
  p_display_point=> 'BEFORE_BOX_BODY',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'N',
  p_query_row_template           => 6965617917663904+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '10',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as          => ' - ',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'no data found',
  p_query_num_rows_type          => '0',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424621017561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424111393561217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN_URL',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Asin Url',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424426043561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424111393561217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Asin',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424526952561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424111393561217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Title',
  p_column_alignment=> 'LEFT',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424310332561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424111393561217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'PRICE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Price',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||chr(10)||
'"LIST_NAME" as "List name",'||chr(10)||
'''<img border="0" src="''||nvl(img_url,''http://ec1.images-amazon.com/images/G/02/uk-shared/logos/amazon-logo-151x32._V45462390_.gif'')||''" />'' as img,'||chr(10)||
'"ASIN",'||chr(10)||
'"TITLE",'||chr(10)||
'"ITEM_URL",'||chr(10)||
'"ARTIST",'||chr(10)||
'case when get_latest_prices (asin) <= 300 '||chr(10)||
'     then ''<b>'' || ''£'' || to_char(get_latest_prices (asin)/100) || ''</b>'''||chr(10)||
'     when get_latest_prices (asin) between 300 and ';

s:=s||'500'||chr(10)||
'     then ''<font color="blue">'' || ''£'' || to_char(get_latest_prices (asin)/100) || ''</font>'''||chr(10)||
'else ''£'' || to_char(get_latest_prices (asin)/100)'||chr(10)||
'end as min_price,'||chr(10)||
'case when get_price_diff(asin) < 0'||chr(10)||
'     then ''<font color="green">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     when get_price_diff(asin) > 0'||chr(10)||
'     then ''<font color="red">'' || get_price_diff(asin) || ''</font>'''||chr(10)||
'     else null'||chr(10)||
'end';

s:=s||' as diff_price'||chr(10)||
'from   "LIST_ITEM" join "AMAZON_LIST" using (listid)'||chr(10)||
'where  "LISTID" = nvl(:P_LISTID,"LISTID")'||chr(10)||
'and nvl(received,0) = 0'||chr(10)||
'and watch = ''Y'''||chr(10)||
'order by get_latest_prices (asin)';

wwv_flow_api.create_report_region (
  p_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_name=> 'Watch List',
  p_template=> 6963431850663873+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_display_column=> 1,
  p_display_point=> 'BEFORE_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> 'Unable to show report.',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 6966114199663914+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'COLON_DELMITED_LIST',
  p_query_num_rows               => '1000',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'No data found.',
  p_query_num_rows_item          => 'P8_ROWS',
  p_query_num_rows_type          => 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max          => '10000',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'Y',
  p_csv_output_link_text         => 'Spread Sheet',
  p_query_asc_image              => 'themes/theme_2/sort_arrow_down.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'themes/theme_2/sort_arrow_up.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425015985561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'List name',
  p_column_display_sequence=> 5,
  p_column_heading=> 'List Name',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7424928620561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'IMG',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425107257561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ASIN',
  p_column_display_sequence=> 1,
  p_column_heading=> '<br>',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:4:#APP_SESSION#::::P4_ASIN:#ASIN#',
  p_column_linktext=> '<img src="#IMAGE_PREFIX#themes/theme_2/ed-item.gif" alt="Edit" />',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ASIN',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425226586561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TITLE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Title',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_link=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_ASIN:#ASIN#',
  p_column_linktext=> '#TITLE#',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'TITLE',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425309911561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'ITEM_URL',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item Url',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ITEM_URL',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425432012561223 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ARTIST',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Artist',
  p_column_hit_highlight=> '&P3_REPORT_SEARCH.',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_pk_col_source=> s,
  p_ref_schema=> 'TEST',
  p_ref_table_name=> 'LIST_ITEM',
  p_ref_column_name=> 'ARTIST',
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425602749561225 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'MIN_PRICE',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Min Price',
  p_column_format=> 'FML999G999G999G999G990D00',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 7425520118561225 + wwv_flow_api.g_id_offset,
  p_region_id=> 7424715657561223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'DIFF_PRICE',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Diff',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 7425713963561225 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 10,
  p_button_plug_id => 7422503140561207+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Reset',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 7425915720561237 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 10,
  p_button_plug_id => 7422503140561207+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_image   => 'template:'||to_char(6961928397663859+wwv_flow_api.g_id_offset),
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=101:4:&SESSION.::NO:4',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>7427326155561260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&APP_ID.:3:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>7426712491561248 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'8_P_LISTID',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_use_cache_before_default=> 'YES',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 7426902337561251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to reset pagination.',
  p_process_when=>'Go,P8_REPORT_SEARCH',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P8_REPORT_SEARCH,P8_ROWS';

wwv_flow_api.create_page_process(
  p_id     => 7427107043561259 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Reset report search',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to clear cache.',
  p_process_when_button_id=>7425713963561225 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 8
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 101: Login
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 101,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Login',
  p_alias  => 'LOGIN',
  p_step_title=> 'Login',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => 6961601467663848+ wwv_flow_api.g_id_offset,
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'TEST',
  p_last_upd_yyyymmddhh24miss => '20070505000239',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6968431133664015 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'AFTER_SHOW_ITEMS',
  p_plug_source  => s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6968518538664031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 6968431133664015+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'User Name',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 2,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6968618830664045 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 6968431133664015+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'PASSWORD_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 6966430146663925+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6968709665664045 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 6968431133664015+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default => 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(6961928397663859 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'owa_util.mime_header(''text/html'', FALSE);'||chr(10)||
'owa_cookie.send('||chr(10)||
'    name=>''LOGIN_USERNAME_COOKIE'','||chr(10)||
'    value=>lower(:P101_USERNAME));'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6968924307664057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||chr(10)||
'    P_UNAME       => :P101_USERNAME,'||chr(10)||
'    P_PASSWORD    => :P101_PASSWORD,'||chr(10)||
'    P_SESSION_ID  => v(''APP_SESSION''),'||chr(10)||
'    P_FLOW_PAGE   => :APP_ID||'':1'''||chr(10)||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 6968800327664048 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 6969112577664064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||chr(10)||
'    v varchar2(255) := null;'||chr(10)||
'    c owa_cookie.cookie;'||chr(10)||
'begin'||chr(10)||
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||chr(10)||
'   :P101_USERNAME := c.vals(1);'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6969024585664060 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...Lists
--
 
begin
 
wwv_flow_api.create_list (
  p_id=> 7317310307352164 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'list pages',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_display_row_template_id=> 6965008352663900 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 7318223598365450 + wwv_flow_api.g_id_offset,
  p_list_id=> 7317310307352164 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Page Links',
  p_list_item_link_target=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> 'http://127.0.0.1:8080/apex/f?p=101:3',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

---------------------------------------
prompt  ...Breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 6969230818664065 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=> 6972110555664192 + wwv_flow_api.g_id_offset,
  p_menu_id=> 6969230818664065 + wwv_flow_api.g_id_offset,
  p_parent_id               => 0,
  p_option_sequence=> 10,
  p_short_name     => 'AMAZON_LIST',
  p_long_name      => '',
  p_link           => 'f?p=101:1:&SESSION.',
  p_page_id        => 1,
  p_also_current_for_pages  => '');
 
wwv_flow_api.create_menu_option (
  p_id=> 6974715008664298 + wwv_flow_api.g_id_offset,
  p_menu_id=> 6969230818664065 + wwv_flow_api.g_id_offset,
  p_parent_id               => 6972110555664192 + wwv_flow_api.g_id_offset,
  p_option_sequence=> 20,
  p_short_name     => 'AMAZON_LIST',
  p_long_name      => '',
  p_link           => 'f?p=101:2:&SESSION.',
  p_page_id        => 2,
  p_also_current_for_pages  => '');
 
wwv_flow_api.create_menu_option (
  p_id=> 6976526321664310 + wwv_flow_api.g_id_offset,
  p_menu_id=> 6969230818664065 + wwv_flow_api.g_id_offset,
  p_parent_id               => 0,
  p_option_sequence=> 30,
  p_short_name     => 'LIT',
  p_long_name      => 'List Items',
  p_link           => 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_page_id        => 3,
  p_also_current_for_pages  => '');
 
wwv_flow_api.create_menu_option (
  p_id=> 6978702766664321 + wwv_flow_api.g_id_offset,
  p_menu_id=> 6969230818664065 + wwv_flow_api.g_id_offset,
  p_parent_id               => 6976526321664310 + wwv_flow_api.g_id_offset,
  p_option_sequence=> 40,
  p_short_name     => 'LIST_ITEM',
  p_long_name      => '',
  p_link           => 'f?p=101:4:&SESSION.',
  p_page_id        => 4,
  p_also_current_for_pages  => '');
 
null;
 
end;
/

---------------------------------------
prompt  ...Page Templates for application: 101
--
prompt  ......Page template 7250205856475760
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7BotbarMiddle" align="center" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td width="5%" align';

c3:=c3||'="center" class="t7TopbarMiddleTop" valign="bottom">#LOGO#</td>'||chr(10)||
'    <td width="90%" align="left" class="t7TopbarMiddleTop" valign="bottom">'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'        <tr>#PARENT_TAB_CELLS#</tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
'    <td width="5%" align="left" class="t7TopbarMiddleTop" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7TopbarMid';

c3:=c3||'dleWTab" valign="top">&nbsp;</td>'||chr(10)||
'    <td class="t7TopbarMiddleWTab" valign="top">'||chr(10)||
'    <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'       <tr>#TAB_CELLS#'||chr(10)||
'    </tr></table>'||chr(10)||
'    </td>'||chr(10)||
'    <td class="t7TopbarMiddleWTab" valign="top" align="right"><span class="t7customize">#CUSTOMIZE#</span>&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" valign="top" align="center">'||chr(10)||
'    <table wid';

c3:=c3||'th="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td width="180" valign="top" align="center" class="t7SideBarNav">'||chr(10)||
'        #REGION_POSITION_02#'||chr(10)||
'      </td>'||chr(10)||
'      <td valign="top" align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'        <tr>'||chr(10)||
'          <td width="100%" valign="top" align="center">#REGION_POSITION_01#&nbsp;</td>'||chr(10)||
'        </tr>'||chr(10)||
'  ';

c3:=c3||'      <tr>'||chr(10)||
'          <td valign="top" align="center">'||chr(10)||
'            #SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="top" align="center">'||chr(10)||
'            <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'              <td width="100%" valign="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POS';

c3:=c3||'ITION_07##REGION_POSITION_08#<br /></td>'||chr(10)||
'              <td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'            </tr></table>          '||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table></td>'||chr(10)||
'    </tr></table>'||chr(10)||
'  </tr>'||chr(10)||
''||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7250205856475760 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td>'||chr(10)||
'  <a href="#TAB_LINK#" class="t7standardtabcurrent">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||chr(10)||
'</td>'||chr(10)||
''||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td>'||chr(10)||
'  <a href="#TAB_LINK#" class="t7standardtab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||chr(10)||
'</td>'||chr(10)||
''||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
''||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOff"><a href="#TAB_LINK#" style="text-decoration: none;">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 7250503624475760
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="4" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">#LOGO#</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7TopbarM';

c3:=c3||'iddle" valign="top" align="center">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center">'||chr(10)||
'    <table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td width="160" valign="top" align="center">&nbsp;</td>'||chr(10)||
'      <td valign="top" align="center"><table border="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td width="180" valign="top" align="left">&nbsp;</td>'||chr(10)||
'          <td width="100%" valign';

c3:=c3||'="top" align="center">#REGION_POSITION_01#</td>'||chr(10)||
'          <td width="180" valign="top" align="right"><span class="t7customize">#CUSTOMIZE#</span>&nbsp;</td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td colspan="3" valign="top" align="center">'||chr(10)||
'            #SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td colspan="3" valign="top" align="center">'||chr(10)||
'      <tab';

c3:=c3||'le cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td width="100%" valign="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#'||chr(10)||
'<br /></td><td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'      </tr></table>'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table></td>'||chr(10)||
'    </tr></table>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

c3:=c3||''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7250503624475760 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7BotbarMiddle" align="center" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>');
end;
 
null;
 
end;
/

prompt  ......Page template 7250817438475760
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" valign="top" align="center">#REGION_POSIT';

c3:=c3||'ION_01#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" colspan="3">#SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center" colspan="3">'||chr(10)||
'      <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td valign="top" align="center">#BOX_BODY#<br /></td>'||chr(10)||
'      </tr></table>'||chr(10)||
'    </td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7250817438475760 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6960822198663821
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6960822198663821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

prompt  ......Page template 6960929503663832
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td  class="t2topbar05"';

c3:=c3||'><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" val';

c3:=c3||'ign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td align="left" class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>';

c3:=c3||'#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6960929503663832 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961000097663842
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2to';

c3:=c3||'pbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</';

c3:=c3||'tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td ';

c3:=c3||'valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961000097663842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961131406663842
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961131406663842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961213606663845
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t1Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height=';

c3:=c3||'"35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><b';

c3:=c3||'r/></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_';

c3:=c3||'02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961213606663845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961318426663846
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height=';

c3:=c3||'"35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sideba';

c3:=c3||'r" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BO';

c3:=c3||'DY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961318426663846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961414942663846
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" height="70%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2to';

c3:=c3||'pbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><br/></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valig';

c3:=c3||'n="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" height="70%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td ';

c3:=c3||'valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961414942663846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '19');
end;
 
null;
 
end;
/

prompt  ......Page template 6961520563663848
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'#PARENT_TAB_CELLS#'||chr(10)||
'<td width="6"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_tra';

c3:=c3||'ns.gif" width="6" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#t';

c3:=c3||'hemes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top"><br /></td>'||chr(10)||
'<td colspan';

c3:=c3||'="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_PO';

c3:=c3||'SITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6961520563663848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_03',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 6961601467663848
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'  </body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<div class="t2messages">#NOTIFICATION_MESSAGE#</div>'||chr(10)||
'<table cellpadding="0" border="0" cellspacing="0" summary="" style="margin-top:100px;" align="center">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_';

c3:=c3||'PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BOX_BODY##REGION_POSITION_01##REGION_POSITI';

c3:=c3||'ON_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><i';

c3:=c3||'mg alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'#FORM_CLOSE#'||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 6961601467663848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
''||chr(10)||
'',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

prompt  ......Page template 7248523980475715
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td width="5%" align';

c3:=c3||'="center" class="t7TopbarMiddleTop" valign="bottom">#LOGO#</td>'||chr(10)||
'    <td width="90%" align="left" class="t7TopbarMiddleTop" valign="bottom">'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'        <tr>#PARENT_TAB_CELLS#</tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
'    <td width="5%" align="left" class="t7TopbarMiddleTop" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7TopbarMid';

c3:=c3||'dleWTab" valign="top">&nbsp;</td>'||chr(10)||
'    <td class="t7TopbarMiddleWTab" valign="top">'||chr(10)||
'    <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'       <tr>#TAB_CELLS#'||chr(10)||
'    </tr></table>'||chr(10)||
'    </td>'||chr(10)||
'    <td class="t7TopbarMiddleWTab" valign="top" align="right"><span class="t7customize">#CUSTOMIZE#</span>&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" valign="top" align="center">'||chr(10)||
'    <table wid';

c3:=c3||'th="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td width="180" valign="top" align="center">'||chr(10)||
'        &nbsp;'||chr(10)||
'      </td>'||chr(10)||
'      <td valign="top" align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'        <tr>'||chr(10)||
'          <td width="100%" valign="top" align="center">#REGION_POSITION_01#&nbsp;</td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="to';

c3:=c3||'p" align="center">'||chr(10)||
'            #SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="top" align="center">'||chr(10)||
'            <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'              <td width="100%" valign="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#<br />';

c3:=c3||'</td>'||chr(10)||
'              <td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'            </tr></table>          '||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table></td>'||chr(10)||
'    </tr></table>'||chr(10)||
'  </tr>'||chr(10)||
''||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7248523980475715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td>'||chr(10)||
'  <a href="#TAB_LINK#" class="t7standardtabcurrent">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||chr(10)||
'</td>'||chr(10)||
''||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td>'||chr(10)||
'  <a href="#TAB_LINK#" class="t7standardtab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||chr(10)||
'</td>'||chr(10)||
''||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
''||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOff"><a href="#TAB_LINK#" style="text-decoration: none;">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7BotbarMiddle" align="center" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>');
end;
 
null;
 
end;
/

prompt  ......Page template 7248718462475754
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td width="5%" align';

c3:=c3||'="center" class="t7TopbarMiddleTop" valign="bottom">#LOGO#</td>'||chr(10)||
'    <td width="90%" align="left" class="t7TopbarMiddleTop" valign="bottom">'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'        <tr>#TAB_CELLS#</tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
'    <td width="5%" align="left" class="t7TopbarMiddleTop" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" class="t7Topb';

c3:=c3||'arMiddle" valign="top" align="right">#CUSTOMIZE#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" valign="top" align="center">#REGION_POSITION_01#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" colspan="3">#SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center" colspan="3">'||chr(10)||
'      <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td width="100%" valig';

c3:=c3||'n="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#'||chr(10)||
'<br /></td><td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'      </tr></table>'||chr(10)||
'    </td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7248718462475754 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
''||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOff"><a href="#TAB_LINK#" style="text-decoration: none;">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

prompt  ......Page template 7249027111475757
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7BotbarMiddle" align="center" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="4" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">#LOGO#</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7TopbarM';

c3:=c3||'iddle" valign="top" align="center">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center">'||chr(10)||
'    <table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td width="160" valign="top" align="center" class="t7SideBarNav">'||chr(10)||
'        #REGION_POSITION_02#'||chr(10)||
'      </td>'||chr(10)||
'      <td valign="top" align="center"><table border="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td width="180" valign="top" align="';

c3:=c3||'left">&nbsp;</td>'||chr(10)||
'          <td width="100%" valign="top" align="center">#REGION_POSITION_01#</td>'||chr(10)||
'          <td width="180" valign="top" align="right"><span class="t7customize">#CUSTOMIZE#</span>&nbsp;</td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td colspan="3" valign="top" align="center">'||chr(10)||
'            #SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td ';

c3:=c3||'colspan="3" valign="top" align="center">'||chr(10)||
'      <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td width="100%" valign="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#'||chr(10)||
'<br /></td><td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'      </tr></table>'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'    ';

c3:=c3||'  </table></td>'||chr(10)||
'    </tr></table>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7249027111475757 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="Notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 7249315234475759
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7BotbarMiddle" align="center" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="center" valign="top">&nbsp;</td>'||chr(10)||
'    <td align="right" class="t7NavBar" valign="top"><a>[&USER.]</a>&nbsp;#NAVIGATION_BAR#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" c';

c3:=c3||'lass="t7TopbarMiddleTop" valign="bottom">#LOGO#</td>'||chr(10)||
'    <td width="90%" align="left" class="t7TopbarMiddleTop" valign="bottom">'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0" align="center">'||chr(10)||
'        <tr>#TAB_CELLS#</tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
'    <td align="left" class="t7TopbarMiddleTop" valign="bottom">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t7TopbarMiddle" valign="top" colspan="3"';

c3:=c3||'>#CUSTOMIZE#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center" colspan="3">'||chr(10)||
'    <table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td width="180" valign="top" align="center" class="t7SideBarNav">'||chr(10)||
'        #REGION_POSITION_02#'||chr(10)||
'      </td>'||chr(10)||
'      <td valign="top" align="center"><table>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="top" align="center">#REGION_POSITION_01#</td>'||chr(10)||
'';

c3:=c3||'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="top" align="center">'||chr(10)||
'            #SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td valign="top" align="center">'||chr(10)||
'      <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td width="100%" valign="top" align="center">#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION';

c3:=c3||'_POSITION_07##REGION_POSITION_08#'||chr(10)||
'<br /></td><td width="180" valign="top" align="right">#REGION_POSITION_03#</td>'||chr(10)||
'      </tr></table>'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table></td>'||chr(10)||
'    </tr></table>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7249315234475759 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t7success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
''||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t7TabcenterOff"><a href="#TAB_LINK#" style="text-decoration: none;">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_7/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">[#TEXT#]</a>&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 7,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 7249627830475759
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" colspan="3"><br/><br/><br/><br/></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" colspan="3">#SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center" colspan="3">'||chr(10)||
'      <table><tr>'||chr(10)||
'        <td valign="top" align="center">#BOX_BODY#<br /></td>'||chr(10)||
'      </tr></tabl';

c3:=c3||'e>'||chr(10)||
'    </td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7249627830475759 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '#BODY_TITLE#',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t7notification">#MESSAGE#</div>',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_theme_id  => 7,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 7249917896475759
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="3" valign="top" align="center">#REGION_POSITION_01#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" colspan="3">#SUCCESS_MESSAGE# #NOTIFICATION_MESSAGE#</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" align="center" colspan="3">'||chr(10)||
'      <table cellpadding="4" cellspacing="4" border="0"><tr>'||chr(10)||
'        <td valign="top';

c3:=c3||'" align="center">#BOX_BODY#<br /></td>'||chr(10)||
'      </tr></table>'||chr(10)||
'    </td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 7249917896475759 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="success"><img src="#IMAGE_PREFIX#themes/theme_1/success_w.gif" width="24" height="23" alt="" class="success" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="Notification">#MESSAGE#</div>',
  p_navigation_bar=> '<table cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr><td>&nbsp;&nbsp;</td>'||chr(10)||
'#BAR_BODY#'||chr(10)||
'</tr>'||chr(10)||
'</table>',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" summary=""',
  p_theme_id  => 7,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

---------------------------------------
prompt  ...Button Templates
--
prompt  ......Button Template 6961727409663850
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6961727409663850 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 6961811943663859
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6961811943663859 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 6961928397663859
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6961928397663859 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 6962018464663859
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6962018464663859 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 7251105904475760
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t7button2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr><td class="L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button3_left.png" alt="" /></a></td>'||chr(10)||
'<td class="blue" valign="middle"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button3_right.png" alt="" /></a></td>'||chr(10)||
'</tr></table>';

wwv_flow_api.create_button_templates (
  p_id=>7251105904475760 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_template_comment       => 'Standard Button');
end;
/
prompt  ......Button Template 7251309723475768
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t7button4" cellspacing="0" cellpadding="0" border="0"  summary=""><tr>'||chr(10)||
'<td class="L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button4_left.png" alt="" /></a></td>'||chr(10)||
'<td class="C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button4_right.png" alt="" /></a></td>'||chr(10)||
'</tr></table>';

wwv_flow_api.create_button_templates (
  p_id=>7251309723475768 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_template_comment       => 'XP Square FFFFFF');
end;
/
prompt  ......Button Template 7251511103475768
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t7button5" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button5_left.png" alt="" /></a></td>'||chr(10)||
'<td class="C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button5_right.png" alt="" /></a></td>'||chr(10)||
'</tr></table>';

wwv_flow_api.create_button_templates (
  p_id=>7251511103475768 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 7,
  p_theme_class_id => 5,
  p_template_comment       => 'Standard Button');
end;
/
prompt  ......Button Template 7251710214475768
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t7button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button_left.png" alt="" /></a></td>'||chr(10)||
'<td class="CEEEEEE"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/button_right.png" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>7251710214475768 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_template_comment       => 'Standard Button');
end;
/
---------------------------------------
prompt  ...Region Templates
--
prompt  ......Region Template 7251900142475768
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/but_region_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANG';

t:=t||'E##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/but_region_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7251900142475768 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7251900142475768 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7252501272475775
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7252501272475775 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7252501272475775 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7252819522475775
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT#';

t:=t||'#CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot"><img src="#IMAGE_PREFIX#themes/theme_7/space.gif" width="480" height="1"></td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7252819522475775 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7252819522475775 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7253120806475778
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle2" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##';

t:=t||'CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td colspan="2"><table><tr>'||chr(10)||
'    <td align="left" valign="middle"><img src="#IMAGE_PREFIX#themes/theme_7/icon_charts.gif" width="80" height="95" border="0" alt="" /></t';

t:=t||'d>'||chr(10)||
'    <td align="left" valign="middle">#BODY#</td>'||chr(10)||
'    </tr></table></td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/';

t:=t||'theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7253120806475778 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7253120806475778 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7253405912475778
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCBorderless" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left" class="t7Header" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="left">#BODY#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7253405912475778 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 7,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7253405912475778 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7253724109475778
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT#';

t:=t||'#CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7253724109475778 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7253724109475778 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7254002692475781
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCNoTitle" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/button_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="right"  class="buttonRegionTop">&nbsp;#CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/th';

t:=t||'eme_7/button_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <';

t:=t||'td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7254002692475781 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7254002692475781 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7254316091475781
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t7GCCShowHide" id="#REGION_ID#"><div class="t7Header"><a href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif'',''#IMAGE_PREFIX#htmldb/builder/rollup_minus_dgray.gif'');" class="htmldbHideShowMinLink"><img src="#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a';

t:=t||'>#TITLE#</div>'||chr(10)||
'<div class="t7Hide" id="region#REGION_SEQUENCE_ID#">'||chr(10)||
'  <div class="t7Body">'||chr(10)||
'<table class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="htmldb#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="right"  class="formRegionTop">&nbsp;#CLOSE&nbsp;##PR';

t:=t||'EVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>  '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#them';

t:=t||'es/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>  '||chr(10)||
'  </div>'||chr(10)||
'</div></div>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7254316091475781 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7254316091475781 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7254622234475782
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table width="640" class="t7WizardContainer" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td align="left" class="formRegionHeading" no';

t:=t||'wrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'      <td align="right" class="formRegionHeading">#CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#&nbsp;</td>      '||chr(10)||
'      </tr></table></td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left">#BO';

t:=t||'DY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot"><img src="#IMAGE_PREFIX#themes/theme_7/space.gif" width="640" height="1"></td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border';

t:=t||'="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7254622234475782 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7254622234475782 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7254901443475784
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7254901443475784 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7254901443475784 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7255210823475784
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCBracketed"  cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CH';

t:=t||'ANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top2_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/th';

t:=t||'eme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7255210823475784 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7255210823475784 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7255529648475784
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table width="180" class="t7SBNCStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="navRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<';

t:=t||'tr>'||chr(10)||
'<td align="right" class="navRegionLeft"></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td align="left" class="navRegionRight"></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_bot2_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="navRegionBot2"><img src="#IMAGE_PREFIX#themes/theme_9/spacer.gif" width="180" height="1"/></td>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/nav_r';

t:=t||'egion_bot2_right.png" border="0" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7255529648475784 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7255529648475784 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7255827027475784
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCFormItemContent" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT';

t:=t||'##CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot"><img src="#IMAGE_PREFIX#themes/theme_7/space.gif" width="480" height="1"></td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7255827027475784 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 7,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7255827027475784 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7256130372475785
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCNoButtonsNoTitle" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/button_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="right"  class="buttonRegionTop">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/button_region_top_right.png" border="0" alt="" /><';

t:=t||'/td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/f';

t:=t||'orm_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7256130372475785 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7256130372475785 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7256402784475785
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle2" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##';

t:=t||'CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot"><img src="#IMAGE_PREFIX#themes/theme_7/space.gif" width="480" height="1"></td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7256402784475785 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7256402784475785 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7256702790475785
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle2" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##';

t:=t||'CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td colspan="2"><table><tr>'||chr(10)||
'    <td align="left" valign="middle"><img src="#IMAGE_PREFIX#themes/theme_7/icon_reports.gif" width="80" height="95" border="0" alt="" /></';

t:=t||'td>'||chr(10)||
'    <td align="left" valign="middle">#BODY#</td>'||chr(10)||
'    </tr></table></td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7256702790475785 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7256702790475785 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7257008598475789
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle2" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##';

t:=t||'CHANGE##CREATE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center" colspan="2">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>    '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7257008598475789 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7257008598475789 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7257315770475789
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table  width="180" class="t7SBNCStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_top2_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="navRegionTop2" nowrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_top2_right.png" border="0" alt="" /></td>'||chr(10)||
'</t';

t:=t||'r>'||chr(10)||
'<tr>'||chr(10)||
'<td align="right" class="navRegionLeft"></td>'||chr(10)||
'<td>#BODY#</td>'||chr(10)||
'<td align="left" class="navRegionRight"></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/nav_region_bot2_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="navRegionBot2"><img src="#IMAGE_PREFIX#themes/theme_9/spacer.gif" width="180" height="1"/></td>'||chr(10)||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/n';

t:=t||'av_region_bot2_right.png" border="0" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7257315770475789 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7257315770475789 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7257614593475789
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table width="640" class="t7WizardContainer" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>'||chr(10)||
'      <td align="left" class="formRegionHeading" no';

t:=t||'wrap="nowrap">#TITLE#&nbsp;</td>'||chr(10)||
'      <td align="right" class="formRegionHeading">#CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#&nbsp;</td>      '||chr(10)||
'      </tr></table></td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="left"><im';

t:=t||'g src="#IMAGE_PREFIX#themes/theme_7/wizard_icon.gif" alt="confirm" style="float:left;">#BODY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot"><img src="#IMAGE_PREFIX#themes/theme_7/space.gif" width="640" height="1"></td>    '||chr(10)||
'   ';

t:=t||' <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7257614593475789 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7257614593475789 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7257929617475789
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t7breadcrumbcontainer" id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7257929617475789 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 7,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7257929617475789 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 7252208640475775
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/but_region_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left"  class="formRegionTop" nowrap="nowrap">&nbsp;</td>'||chr(10)||
'    <td align="right" class="formRegionTop">'||chr(10)||
'      #CLOSE#&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREA';

t:=t||'TE##HELP#&nbsp;'||chr(10)||
'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/but_region_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 7252208640475775 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 7,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 7252208640475775 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962105504663859
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutButtonsandTitles">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962105504663859 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Titles',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962105504663859 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962208801663868
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BracketedRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DE';

t:=t||'LETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAG';

t:=t||'E_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962208801663868 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962208801663868 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962321025663868
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCBody" colspan="2" valig';

t:=t||'n="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/chart.gif" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_n';

t:=t||'av-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962321025663868 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962321025663868 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962424813663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2BreadcrumbRegion"  id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962424813663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962424813663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962526553663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELET';

t:=t||'E##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_P';

t:=t||'REFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962526553663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 2,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962526553663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962605338663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ChartRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE';

t:=t||'##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2Body" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#t';

t:=t||'hemes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962605338663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962605338663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962730004663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2FormRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE#';

t:=t||'#EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#<img src="#IMAGE_PREFIX#/themes/theme_2/1px_trans.gif" height="1" width="582" style="display:block;" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962730004663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962730004663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962829803663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td clas';

t:=t||'s="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width';

t:=t||'="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962829803663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962829803663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6962931369663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2HideandShowRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#R';

t:=t||'EGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif'',''#IMAGE_PREFIX#themes/theme_2/showhide_show.gif'');" class="t2HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'';

t:=t||'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><div class="t2Hide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt=';

t:=t||'"" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6962931369663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6962931369663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963010338663871
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegionwithIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEX';

t:=t||'T##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><table summary="" cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/wizard_icon.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963010338663871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 2,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963010338663871 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963104247663873
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2NavigationRegion" id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963104247663873 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963104247663873 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963219595663873
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CLOSE#&nbsp;&nbsp;&nbsp;#PREV';

t:=t||'IOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></t';

t:=t||'d>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963219595663873 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963219595663873 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963317480663873
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="600" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" heig';

t:=t||'ht="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img alt="" src';

t:=t||'="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963317480663873 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963317480663873 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963431850663873
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELE';

t:=t||'TE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_';

t:=t||'PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963431850663873 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963431850663873 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963518869663873
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BorderlessRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##D';

t:=t||'ELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMA';

t:=t||'GE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963518869663873 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963518869663873 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963626145663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody">'||chr(10)||
''||chr(10)||
'<table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCBody" colspan="2" val';

t:=t||'ign="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/report.gif" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'</td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/l';

t:=t||'eft_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963626145663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963626145663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963707749663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-3.png" width="9"';

t:=t||' height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp';

t:=t||';#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround2';

t:=t||'1"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963707749663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963707749663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963813532663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-3.png" width="9"';

t:=t||' height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'';

t:=t||'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/them';

t:=t||'e_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963813532663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963813532663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6963916635663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table border="0" cellspacing="0" cellpadding="0" summary="" class="t2NavigationRegionAlternative1" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6963916635663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6963916635663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6964000357663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td';

t:=t||' class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td';

t:=t||'>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6964000357663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6964000357663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 6964130320663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" wid';

t:=t||'th="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" width="100%" class="t2ReportsRegion100Width">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp';

t:=t||';&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2st';

t:=t||'dround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6964130320663879 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Outline, tab-title, 100%');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6964130320663879 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...List Templates
--
prompt  ......List Template 6964210938663879
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>6964210938663879 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 2,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964310793663890
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t6:=t6||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>6964310793663890 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 2,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964420908663893
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br />#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964420908663893 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t2VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964531049663893
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t2current" href="#TAB_LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#TAB_LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964531049663893 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t2TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964600505663893
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964600505663893 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t2VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964723256663893
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964723256663893 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithoutBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964810339663893
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>'||chr(10)||
'';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964810339663893 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullet',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6964916393663896
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6964916393663896 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalImageswithLabelList"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965008352663900
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6965008352663900 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t2HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965131564663900
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2navcurrent">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t2nav">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6965131564663900 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 2,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t2VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965214156663900
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current">#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td>#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6965214156663900 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965320240663901
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2:=t2||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2NC"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6965320240663901 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t2ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7258230533475789
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr>'||chr(10)||
'<td class="t7nobulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr>'||chr(10)||
'<td class="t7nobulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7258230533475789 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullets',
  p_theme_id  => 7,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<table>',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965417181663901
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>6965417181663901 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 2,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">'||chr(10)||
'<li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 6965517788663904
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>6965517788663904 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 2,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7258515310475798
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t7standardlistbold"><a href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr><td class="t7standardlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7258515310475798 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 7,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<table>',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7258815535475800
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7tabbednavigation" cellspacing="0" cellpadding="0" border="0"  summary=""><tr><td class="L"><img src="#IMAGE_PREFIX#themes/theme_7/tabnav_left.png" alt="" /></td><td class="C"><a href="#LINK#">#TEXT#</a></td><td class="R"><img src="#IMAGE_PREFIX#themes/theme_7/tabnav_right.png" alt="" /></td></tr></table>';

t2:=t2||'<table class="t7tabbednavigation" cellspacing="0" cellpadding="0" border="0"  summary=""><tr><td class="L"><img src="#IMAGE_PREFIX#themes/theme_7/tabnav_left.png" alt="" /></td><td class="NC"><a href="#LINK#">#TEXT#</a></td><td class="R"><img src="#IMAGE_PREFIX#themes/theme_7/tabnav_right.png" alt="" /></td></tr></table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7258815535475800 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 7,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="t7tabbednavigation">'||chr(10)||
'<table class="t7tabbednavigation" cellspacing="0" cellpadding="0" border="0"  summary=""><tr><td class="L"><img src="#IMAGE_PREFIX#themes/theme_7/tabnav_start.png" alt="" /></td></tr></table>',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7259131868475801
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr>'||chr(10)||
'<td class="t7wizardprogresslistcurrent" align="center" nowrap="nowrap"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'</tr><tr>'||chr(10)||
'<td align="center"><a href="#LINK#">'||chr(10)||
'  <img src="#IMAGE_PREFIX#themes/theme_7/down_arrow.png" width="14" height="7" border="0"></a>'||chr(10)||
'</td>'||chr(10)||
'</tr>';

t2:=t2||'<tr>'||chr(10)||
'<td class="t7wizardprogresslist" align="center" nowrap="nowrap"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'</tr><tr>'||chr(10)||
'<td align="center"><a href="#LINK#">'||chr(10)||
'  <img src="#IMAGE_PREFIX#themes/theme_7/down_arrow.png" width="14" height="7" border="0"></a>'||chr(10)||
'</td>'||chr(10)||
'</tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7259131868475801 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 7,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table width="100%">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7259407070475801
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="current">'||chr(10)||
'<a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a>'||chr(10)||
'</td>';

t2:=t2||'<td class="noncurrent">'||chr(10)||
'<a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a>'||chr(10)||
'</td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7259407070475801 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t7horizontalimglinks" border="0" cellspacing="2"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7259709827475801
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t7buttonlist" cellspacing="0" cellpadding="0" border="0" summary=""><tr><td class="L"><img src="#IMAGE_PREFIX#themes/theme_7/button3_left.png" alt="" /></td><td class="C"><a href="#LINK#">#TEXT#</a></td><td class="R"><img src="#IMAGE_PREFIX#themes/theme_7/button3_right.png" alt="" /></td></tr></table>';

t2:=t2||'<table class="t7buttonlist" cellspacing="0" cellpadding="0" border="0" summary=""><tr><td class="L"><img src="#IMAGE_PREFIX#themes/theme_7/button2_left.png" alt="" /></td><td class="NC"><a href="#LINK#">#TEXT#</a></td><td class="R"><img src="#IMAGE_PREFIX#themes/theme_7/button2_right.png" alt="" /></td></tr></table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7259709827475801 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 7,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t7buttonlist">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7260011111475801
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t7bulletlist"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/bullet.png" width="10" height="10" border="0"></a></td><td class="t7bulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr><td class="t7bulletlist"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/bullet.png" width="10" height="10" border="0"></a></td><td class="t7bulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7260011111475801 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<table>',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7260332095475801
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t7bulletlist"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/doc.png" width="24" height="24" border="0"></a></td><td class="t7bulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr><td class="t7bulletlist"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/doc.png" width="24" height="24" border="0"></a></td><td class="t7bulletlist"><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7260332095475801 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered (Custom)',
  p_theme_id  => 7,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<table>',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7260627913475803
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>7260627913475803 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 7,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7260923694475803
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>7260923694475803 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 7,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7261219084475803
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="C"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="NC"><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7261219084475803 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<table><tr><td align="left"><ol class="t7verticalorderedlinks">',
  p_list_template_after_rows=>'</ol></td></tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7261524735475803
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="current"><a href="#LINK#" class="current">#TEXT#</a></td>';

t2:=t2||'<td class="noncurrent"><a href="#LINK#" class="noncurrent">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7261524735475803 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<table class="t7horizontallinks" border="0" cellspacing="2"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7261814944475803
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="current">'||chr(10)||
'<a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a>'||chr(10)||
'</td></tr>';

t2:=t2||'<tr><td class="noncurrent">'||chr(10)||
'<a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a>'||chr(10)||
'</td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>7261814944475803 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 7,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table class="t7horizontalimglinks" border="0" cellspacing="2">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7262128951475804
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t6:=t6||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>7262128951475804 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 7,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 7262419989475804
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>7262419989475804 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 7,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">'||chr(10)||
'<li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Report Templates
--
prompt  ......Row Template 6965617917663904
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6965617917663904 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6965617917663904 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6965728815663910
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t2header">#COLUMN_HEADER#</th><td class="t2data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6965728815663910 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t2ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6965728815663910 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'<tr><td colspan="2" class="t2seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6965810727663912
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6965810727663912 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6965810727663912 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6965932352663914
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6965932352663914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2borderless">'||chr(10)||
''||chr(10)||
'',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>'||chr(10)||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6965932352663914 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6966030358663914
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6966030358663914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t2OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6966030358663914 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6966114199663914
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6966114199663914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalBorder">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t2header"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6966114199663914 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 6966207258663917
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6966207258663917 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6966207258663917 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 7262701094475804
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="odd"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7262701094475804 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table width="100%" class="t7toppagination">#TOP_PAGINATION#</table>'||chr(10)||
'<table summary="" class="t7standard"  align="center" border="1" cellspacing="0" cellpadding="1">',
  p_row_template_after_rows =>'<tr><td class="bottom" align="right"><span class="fielddatasmall">#EXTERNAL_LINK#&nbsp;#CSV_LINK#</span></td></tr></table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# valign="top" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_row_style_checked=>'#dddddd',
  p_theme_id  => 7,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 7262701094475804 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 7263200064475812
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="odd"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="even"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7263200064475812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="t7toppagination" width="100%">#TOP_PAGINATION#</table>'||chr(10)||
'<table summary="Report Layout Table" class="t7standard"  align="center" border="1" cellspacing="0" cellpadding="1">',
  p_row_template_after_rows =>'<tr><td class="bottom" align="right" colspan="99"><span class="fielddatasmall">#EXTERNAL_LINK#&nbsp;#CSV_LINK#</span></td></tr></table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_theme_id  => 7,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 7263200064475812 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 7263700789475812
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t7data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7263700789475812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" class="t7toppagination">#TOP_PAGINATION#</table><table class="t7bottomborderonly" cellpadding="0" border="0" cellspacing="0" summary="0">',
  p_row_template_after_rows =>'</table><table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" class="t7pagination">#PAGINATION#'||chr(10)||
'<tr><td class="bottom" align="right" colspan="99"><span class="fielddatasmall">#EXTERNAL_LINK#&nbsp;#CSV_LINK#</span></td></tr></table>'||chr(10)||
''||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t7header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</td>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Row Template 7264032628475815
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="odd"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7264032628475815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table width="100%" class="t7toppagination">#TOP_PAGINATION#</table>'||chr(10)||
'<table summary="Report Layout Table" class="t7standard"  align="center" border="1" cellspacing="0" cellpadding="1">',
  p_row_template_after_rows =>'<tr><td class="bottom" align="right" colspan="99"><span class="fielddatasmall">#EXTERNAL_LINK#&nbsp;#CSV_LINK#</span></td></tr></table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# valign="top" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_row_style_checked=>'#dddddd',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 7264032628475815 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 7264512547475815
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t7data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7264512547475815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="t7contentcollapse"><table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" class="t7toppagination">#TOP_PAGINATION#</table><table class="t7borderless" cellpadding="0" border="0" cellspacing="0" summary="0">',
  p_row_template_after_rows =>'</table><table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" class="t7toppagination">#PAGINATION#'||chr(10)||
'<tr><td class="bottom" align="right" colspan="99"><span class="fielddatasmall">&nbsp;#EXTERNAL_LINK##CSV_LINK#</span></td></tr></table>'||chr(10)||
'</div>'||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t7header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 7264512547475815 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 7265003215475817
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#1#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7265003215475817 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div align="left"><table class="t7nobulletlist" border="0"><tr><td align="left">',
  p_row_template_after_rows =>'</td></tr>'||chr(10)||
'#PAGINATION#</table>#EXTERNAL_LINK#</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Row Template 7265316870475818
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t7header" width="50%">#COLUMN_HEADER#:</th>'||chr(10)||
'<td class="t7data" width="50%">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 7265316870475818 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t7ValueAttributePairs">#TOP_PAGINATION#&nbsp;<tr><td>',
  p_row_template_after_rows =>'<td></tr>#PAGINATION#'||chr(10)||
'<tr><td class="bottom" align="right" colspan="99"><span class="fielddatasmall">#EXTERNAL_LINK#&nbsp;#CSV_LINK#</span></td></tr></table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'#TEXT#',
  p_next_page_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_page_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS#</a></td></tr></table>',
  p_next_set_template=>'<table><tr><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_NEXT_SET#</a></td><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_next.png" border="0" width="16" height="16" alt="next"></a></td></tr></table>',
  p_previous_set_template=>'<table><tr><td class="pagination"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_7/paginate_prev.png" border="0" width="16" height="16" alt="next"></a></td><td class="pagination"><a href="#LINK#" class="fielddata">#PAGINATION_PREVIOUS_SET#</a></td></tr></table>',
  p_theme_id  => 7,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 7265316870475818 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<table width="100%" class="t7GCCReportsStyle1" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/button_region_top_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left" class="buttonRegionTop" width="100%">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/button_region_top_right.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center"><table width="100%">',
  p_row_template_after_last =>'</table></td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>');
exception when others then null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...Label Templates
--
prompt  ......Field Template 6966305498663918
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6966305498663918 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 6966430146663925
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6966430146663925 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t2OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 6966513985663926
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6966513985663926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t2NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 6966615567663926
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6966615567663926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" tabindex="999" style="margin-right:5px;"/><a class="t2RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 6966705800663926
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6966705800663926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Required"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" style="margin-right:5px;" />',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 7265822729475820
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 7265822729475820 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999">'||chr(10)||
'<img src="#IMAGE_PREFIX#themes/theme_7/asterix.png" alt="Required Field Icon" width="10" height="14" tabindex="999" />'||chr(10)||
'<span class="t7required">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 7,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 7265908772475823
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 7265908772475823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t7nolabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 7,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 7266013390475823
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 7266013390475823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t7optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 7266114445475823
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 7266114445475823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_7/asterix.png" alt="Required Field Icon" width="10" height="14" tabindex="999" /><a class="t7requiredwithhelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 7266224648475825
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 7266224648475825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t7optionalwithhelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Breadcrumb Templates
--
prompt  ......Breadcrumb Template 6966812784663928
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 6966812784663928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t2BreadcrumbMenu">',
  p_current_page_option=>'<span class="t2current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 6966914398663937
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 6966914398663937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t2HierarchicalMenu">',
  p_current_page_option=>'<li class="t2current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 7266323442475825
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 7266323442475825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t7BreadCrumb">',
  p_current_page_option=>'<span>#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 7266401952475831
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 7266401952475831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t7hierarchicalmenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Popup List of Values Templates
--
prompt  ......Popup LOV Template 6967600536663948
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 6967600536663948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme.css" type="text/css">'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t2PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t2PopupBody">',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ......Popup LOV Template 7267123015475839
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 7267123015475839 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_7/theme.css" type="text/css" />'||chr(10)||
'',
  p_page_body_attr=>'OnLoad="first_field()" style="margin:0;"',
  p_before_field_text=>'<table cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""><tr><td>'||chr(10)||
'<table class="t7GCCFormItemContent" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""><tr><td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_left.png" border="0" alt="" /></td><td align="left"  class="formRegionTop">',
  p_page_heading_text=>'<table width="100%" cellpadding="4" cellspacing="0" border="0" summary=""><tr><td>',
  p_page_footer_text =>'</td></tr></table>',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'class="t7htmlbutton"',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'class="t7htmlbutton"',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'class="t7htmlbutton"',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'class="t7htmlbutton"',
  p_after_field_text=>'    </td>      '||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_top_right" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div><center>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'  <tr>'||chr(10)||
'    <td  class="formRegionLeft" align="right">&nbsp;</td>'||chr(10)||
'    <td align="left">',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'     </td>'||chr(10)||
'    <td  class="formRegionRight" align="left">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_left.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/form_region_bot_right" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'</td></tr></table>');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Calendar Templates
--
prompt  ......Calendar Template 6967027131663937
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6967027131663937 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t2CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 6967230163663948
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6967230163663948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek" height="12">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 6967410634663948
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6967410634663948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 7266515247475831
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 7266515247475831 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<td class="condensedBody">#IDAY#</td>',
  p_month_title_format=> '<table class="t7standardcalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""  id="#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tl.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left" width="100%" class="formRegionTop">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tr.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center" class="formRegionHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'',
  p_month_open_format=> '  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center"  class="formRegionHeader">'||chr(10)||
'      <table cellspacing="0" cellpadding="0" class="condensedTable">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_bl.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_br.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/>'||chr(10)||
'',
  p_day_open_format=> '<td valign="top" class="condensedBody">'||chr(10)||
'',
  p_day_close_format=> '&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="condensedBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="condensedBody">'||chr(10)||
'',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top" class="condensedBody">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 7,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 7266718220475834
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 7266718220475834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<td width="100">#IDAY#</td>',
  p_month_title_format=> '<table class="t7standardcalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""  id="#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tl.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left" width="100%" class="formRegionTop">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tr.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center" class="formRegionHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_bl.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_br.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_month_open_format=> '<table class="t7standardcalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""  id="#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tl.png" border="0" alt="" /></td>'||chr(10)||
'    <td align="left" width="100%" class="formRegionTop">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_tr.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="formRegionLeft">&nbsp;</td>'||chr(10)||
'    <td align="center"  class="formRegionHeader"><table cellspacing="2" cellpadding="2">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'    <td align="left" class="formRegionRight">&nbsp;</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_bl.png" border="0" alt="" /></td>'||chr(10)||
'    <td class="formRegionBot">&nbsp;</td>'||chr(10)||
'    <td align="left"><img src="#IMAGE_PREFIX#themes/theme_7/calbox_br.png" border="0" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/>'||chr(10)||
'',
  p_day_open_format=> '<td valign="top"width="100" class="formRegionBody">'||chr(10)||
'',
  p_day_close_format=> '&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="formRegionBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="formRegionBody">'||chr(10)||
'',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr class="formRegionHeader">',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 7,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 7266906128475837
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 7266906128475837 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<td width="15%" class="condensedBody">#IDAY#</td>',
  p_month_title_format=> '<table class="t7standardcalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""  id="#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center" class="simpleHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'  </tr>'||chr(10)||
'',
  p_month_open_format=> '  <tr>'||chr(10)||
'    <td align="center"  class="simpleHeader">'||chr(10)||
'      <table cellspacing="0" cellpadding="0" class="condensedTable">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/>'||chr(10)||
'',
  p_day_open_format=> '<td valign="top" class="simpleBody">'||chr(10)||
'',
  p_day_close_format=> '&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="simpleBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="condensedBody">'||chr(10)||
'',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top" class="simpleBody">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 7,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

---------------------------------------
prompt  ...Application Themes
--
prompt  ......Theme 6967728300663954
begin
wwv_flow_api.create_theme (
  p_id                        =>6967728300663954 + wwv_flow_api.g_id_offset,
  p_flow_id                   =>wwv_flow.g_flow_id,
  p_theme_id  => 2,
  p_theme_name=>'Blue and Tan',
  p_default_page_template=>6961414942663846 + wwv_flow_api.g_id_offset,
  p_error_template=>6961414942663846 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>6960822198663821 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template            =>6961601467663848 + wwv_flow_api.g_id_offset,
  p_default_button_template   =>6961928397663859 + wwv_flow_api.g_id_offset,
  p_default_region_template   =>6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_chart_template    =>6962605338663871 + wwv_flow_api.g_id_offset,
  p_default_form_template     =>6962730004663871 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>6962526553663871 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>6962424813663871 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>6963431850663873 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>6965617917663904 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>6966430146663925 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>6966812784663928 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>6967410634663948 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>6964810339663893 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>6966430146663925 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>6966615567663926 + wwv_flow_api.g_id_offset);
end;
/
prompt  ......Theme 7267225935475842
begin
wwv_flow_api.create_theme (
  p_id                        =>7267225935475842 + wwv_flow_api.g_id_offset,
  p_flow_id                   =>wwv_flow.g_flow_id,
  p_theme_id  => 7,
  p_theme_name=>'Centered',
  p_default_page_template=>7248718462475754 + wwv_flow_api.g_id_offset,
  p_error_template=>7248718462475754 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>7249917896475759 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template            =>7249627830475759 + wwv_flow_api.g_id_offset,
  p_default_button_template   =>7251710214475768 + wwv_flow_api.g_id_offset,
  p_default_region_template   =>7257008598475789 + wwv_flow_api.g_id_offset,
  p_default_chart_template    =>7257008598475789 + wwv_flow_api.g_id_offset,
  p_default_form_template     =>7255827027475784 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>7257008598475789 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>7257008598475789 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>7254622234475782 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>7254002692475781 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>7257008598475789 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>7264032628475815 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>7266224648475825 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>7266323442475825 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>7266718220475834 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>7260332095475801 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>7266224648475825 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>7266114445475823 + wwv_flow_api.g_id_offset);
end;
/
---------------------------------------
prompt  ...Build Options used by APPLICATION 101
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Messages Used by Application: 101
--
---------------------------------------
prompt  ...Language Maps for Application 101
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Shortcuts
--
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 6973002457664265 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
 
null;
 
end;
/

---------------------------------------
prompt  ...Configurations for application101
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...WEB SERVICES (9iR2 or better)
--
---------------------------------------
prompt  ...Authorization Schemes
--
prompt  ......Authentication Schemes 6967822524663987
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'-BUILTIN-';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6967822524663987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'HTML DB',
  p_description=>'Use internal Application Express account credentials and login page in this application.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

prompt  ......Authentication Schemes 6967931520663990
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1:=s1||'-DATABASE-';

s2 := null;
s3 := null;
s4 := null;
s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6967931520663990 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE',
  p_description=>'Use database authentication (user identified by DAD).',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

prompt  ......Authentication Schemes 6968000615663990
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'return false; end;--';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6968000615663990 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE ACCOUNT',
  p_description=>'Use database account credentials.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

prompt  ......Authentication Schemes 7132119110473828
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'return false; end;--';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 7132119110473828 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'NO_LOGIN',
  p_description=>'',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'',
  p_invalid_session_url=>'-BUILTIN-',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=4155:PUBLIC_PAGE',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

prompt  ......Authentication Schemes 7133612662481342
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1:=s1||'-DATABASE-';

s2 := null;
s3 := null;
s4 := null;
s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 7133612662481342 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'New_NO_LOGIN',
  p_description=>'Based on authentication scheme from gallery:No Authentication (using DAD)',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Application Entry Points
--
 
begin
 
null;
 
end;
/

commit;
commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
