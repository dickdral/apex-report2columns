set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>5853461301138549
,p_default_application_id=>1002
,p_default_owner=>'APP_O'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/nl_detora_apex_report2columns
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(60317962992936279)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'NL.DETORA.APEX.REPORT2COLUMNS'
,p_display_name=>'report2columns'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#apexreport2columns.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * APEX Report to Columns',
' * Version: 1.0 (28-12-2016)',
' * Author:  Dick Dral',
' *-------------------------------------',
'*/',
'FUNCTION render_report2columns(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                               p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  -- plugin attributes',
'  l_result       apex_plugin.t_dynamic_action_render_result;',
'  l_numcols      number        := p_dynamic_action.attribute_01;',
'  l_direction    varchar2(100) := p_dynamic_action.attribute_02;',
'  --',
'BEGIN',
'  -- attribute defaults',
'  l_numcols   := nvl(l_numcols,',
'                          2);',
'  l_direction := nvl(l_direction,',
'                        ''vertical'');',
'  --',
'  l_result.javascript_function := ''apexreport2columns.doIt'';',
'  l_result.attribute_01        := l_numcols;',
'  l_result.attribute_02        := l_direction;',
'  --',
'  RETURN l_result;',
'  --',
'END render_report2columns;'))
,p_render_function=>'render_report2columns'
,p_standard_attributes=>'REGION:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60318206894940434)
,p_plugin_id=>wwv_flow_api.id(60317962992936279)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Number of columns'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'2'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60318515678942647)
,p_plugin_id=>wwv_flow_api.id(60317962992936279)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Direction'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'vertical'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Ordering of the elements:',
'',
'Vertical',
'1   4',
'2   5',
'3   6',
'',
'Horizontal',
'1   2',
'3   4',
'5   6'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60318775639944083)
,p_plugin_attribute_id=>wwv_flow_api.id(60318515678942647)
,p_display_sequence=>10
,p_display_value=>'Horizontal'
,p_return_value=>'horizontal'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(60319232251945694)
,p_plugin_attribute_id=>wwv_flow_api.id(60318515678942647)
,p_display_sequence=>20
,p_display_value=>'Vertical'
,p_return_value=>'vertical'
,p_is_quick_pick=>true
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F2041504558205265706F727420746F20436F6C756D6E730A2F2F20417574686F723A204469636B204472616C0A2F2F2056657273696F6E3A20312E300A0A2F2F20676C6F62616C206E616D6573706163650A76617220617065787265706F72743263';
wwv_flow_api.g_varchar2_table(2) := '6F6C756D6E73203D207B0A202020202F2F20706172736520737472696E6720746F20626F6F6C65616E0A202020207061727365426F6F6C65616E3A2066756E6374696F6E2870537472696E6729207B0A20202020202020207661722070426F6F6C65616E';
wwv_flow_api.g_varchar2_table(3) := '3B0A20202020202020206966202870537472696E672E746F4C6F776572436173652829203D3D2027747275652729207B0A20202020202020202020202070426F6F6C65616E203D20747275653B0A20202020202020207D0A202020202020202069662028';
wwv_flow_api.g_varchar2_table(4) := '70537472696E672E746F4C6F776572436173652829203D3D202766616C73652729207B0A20202020202020202020202070426F6F6C65616E203D2066616C73653B0A20202020202020207D0A202020202020202069662028212870537472696E672E746F';
wwv_flow_api.g_varchar2_table(5) := '4C6F776572436173652829203D3D202774727565272920262620212870537472696E672E746F4C6F776572436173652829203D3D202766616C7365272929207B0A20202020202020202020202070426F6F6C65616E203D20756E646566696E65643B0A20';
wwv_flow_api.g_varchar2_table(6) := '202020202020207D0A202020202020202072657475726E2070426F6F6C65616E3B0A202020207D2C0A0A202020202F2F2068656C7065722066756E6374696F6E20746F2067657420726967687420746578740A20202020676574546578743A2066756E63';
wwv_flow_api.g_varchar2_table(7) := '74696F6E2870536F757263652C2070546578742C20704974656D2C2070456C656D656E7429207B0A20202020202020207661722076546578743B0A20202020202020206966202870536F75726365203D3D2027544558542729207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(8) := '202020207654657874203D2070546578743B0A20202020202020207D20656C7365206966202870536F75726365203D3D20274954454D2729207B0A2020202020202020202020207654657874203D20247628704974656D293B0A20202020202020207D20';
wwv_flow_api.g_varchar2_table(9) := '656C7365206966202870536F75726365203D3D20275449544C452729207B0A2020202020202020202020207654657874203D20242870456C656D656E74292E6174747228277469746C6527293B0A20202020202020207D0A202020202020202072657475';
wwv_flow_api.g_varchar2_table(10) := '726E2076546578743B0A202020207D2C0A202020200A202020202F2F2066756E6374696F6E20646F696E6720746865207265616C20776F726B0A20202020646973747269627574653A2066756E6374696F6E282074616253656C6563746F722C206E756D';
wwv_flow_api.g_varchar2_table(11) := '436F6C732C20646972656374696F6E202920207B0A202020202020766172206E756D526F777320203D20303B20200A092020766172206375727461626C65203D206E756C6C3B0A090A0920202F2F20636865636B20706172616D65746572206469726563';
wwv_flow_api.g_varchar2_table(12) := '74696F6E20616E64206170706C792064656661756C742076616C75650A092020646972656374696F6E202020203D202820646972656374696F6E2029203F20646972656374696F6E203A2027766572746963616C273B0A090A0920202F2F2063616C6375';
wwv_flow_api.g_varchar2_table(13) := '6C61746520746865206E756D626572206F6620726F77732070657220636F6C756D6E0A092020766172207461626C65203D20242874616253656C6563746F72292E616464436C61737328277265706F7274436F6C756D6E27293B200A0920207661722072';
wwv_flow_api.g_varchar2_table(14) := '6F7773506572436F6C203D204D6174682E6365696C2820282024287461626C65292E66696E64282720747227292E6C656E6774682D3120292F6E756D436F6C73293B20200A09202076617220626173654E616D65203D20277265706F7274436F6C756D6E';
wwv_flow_api.g_varchar2_table(15) := '273B2020200A20200A0920202F2F20637265617465207461626C652074656D706C61746520666F7220636F6C756D6E73200A0920207661722074656D706C617465203D2024287461626C65292E636C6F6E6528293B0A092020242874656D706C61746529';
wwv_flow_api.g_varchar2_table(16) := '2E66696E642827747227292E6861732827746427292E72656D6F766528293B0A20200A0A0920206966202820646972656374696F6E2E746F4C6F77657243617365282920213D2027686F72697A6F6E74616C2729200A0920207B20200A0909202F2F2056';
wwv_flow_api.g_varchar2_table(17) := '4552544943414C200A090920666F7220282069203D20323B2069203C3D206E756D436F6C733B20692B2B2920200A0909207B20206375727461626C65203D20242874656D706C617465292E636C6F6E6528292E6174747228276964272C626173654E616D';
wwv_flow_api.g_varchar2_table(18) := '652B69292E617070656E64546F282024287461626C65292E706172656E74282920293B0A090909726F7773203D2024287461626C65292E66696E642827747227292E6861732827746427292E736C6963652820726F7773506572436F6C2C20322A726F77';
wwv_flow_api.g_varchar2_table(19) := '73506572436F6C292E64657461636828293B0A09090924286375727461626C65292E66696E64282774626F647927292E617070656E6428726F7773293B0A0909207D20200A0920207D0A092020656C73650A0920207B0A0909202F2F20484F52495A4F4E';
wwv_flow_api.g_varchar2_table(20) := '54414C0A0909202F2F2063726561746520636F6C756D6E730A090920666F7220282069203D20323B2069203C3D206E756D436F6C733B20692B2B29202020200A0909207B20206375727461626C65203D20242874656D706C617465292E636C6F6E652829';
wwv_flow_api.g_varchar2_table(21) := '2E6174747228276964272C626173654E616D652B69292E617070656E64546F282024287461626C65292E706172656E74282920293B20200A0909207D20200A200A0909202F2F20646973747269627574652074686520726F7773206F7665722074686520';
wwv_flow_api.g_varchar2_table(22) := '636F6C756D6E730A090920766172206964203D20313B20200A090920242874616253656C6563746F72292E66696E64282774626F647920747227292E65616368282066756E6374696F6E28696E6465782920200A0909207B200A0909092F2F206D6F7665';
wwv_flow_api.g_varchar2_table(23) := '2063656C6C206966206E6F7420696E20666972737420636F6C756D6E20200A09090969662028206964203E2031202029207B2024282723272B626173654E616D652B69642B272074626F647927292E617070656E6428202428746869732920293B20207D';
wwv_flow_api.g_varchar2_table(24) := '0A0A0909092F2F2072657374617274207769746820636F6C756D6E2031207768656E20626568696E64206C61737420636F6C756D6E0A0909096964203D2028206964203C206E756D436F6C732029203F206964202B2031203A20313B0A0909207D20293B';
wwv_flow_api.g_varchar2_table(25) := '2020200A0920207D202020200A0A202020207D2C0A202020200A202020202F2F2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A20202020646F49743A2066756E6374696F6E2829207B0A202020202020';
wwv_flow_api.g_varchar2_table(26) := '20202F2F20706C7567696E20617474726962757465730A202020202020202076617220646154686973203D20746869733B0A20202020202020207661722076456C656D656E74734172726179203D206461546869732E6166666563746564456C656D656E';
wwv_flow_api.g_varchar2_table(27) := '74733B0A2020202020202020766172207654616253656C6563746F722020203D202723272B242876456C656D656E747341727261795B305D292E617474722827696427292B27207461626C652E742D5265706F72742D7265706F7274273B0A2020202020';
wwv_flow_api.g_varchar2_table(28) := '20202076617220764E756D636F6C73203D206461546869732E616374696F6E2E61747472696275746530313B0A20202020202020207661722076446972656374696F6E203D206461546869732E616374696F6E2E61747472696275746530323B0A202020';
wwv_flow_api.g_varchar2_table(29) := '20202020202F2F204C6F6767696E670A202020202020202076617220764C6F6767696E67203D20747275653B0A202020202020202069662028764C6F6767696E6729207B0A202020202020202020202020636F6E736F6C652E6C6F67282773686F77546F';
wwv_flow_api.g_varchar2_table(30) := '6F6C7469703A206166666563746564456C656D656E743A272C207654616253656C6563746F72293B0A202020202020202020202020636F6E736F6C652E6C6F67282773686F77546F6F6C7469703A20417474726962757465204E756D626572206F662063';
wwv_flow_api.g_varchar2_table(31) := '6F6C756D6E733A272C20764E756D636F6C73293B0A202020202020202020202020636F6E736F6C652E6C6F67282773686F77546F6F6C7469703A2041747472696275746520446972656374696F6E3A272C2076446972656374696F6E293B0A2020202020';
wwv_flow_api.g_varchar2_table(32) := '2020207D0A2020202020202020617065787265706F727432636F6C756D6E732E64697374726962757465287654616253656C6563746F722C764E756D636F6C732C76446972656374696F6E293B0A202020207D0A7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(60319940364955339)
,p_plugin_id=>wwv_flow_api.id(60317962992936279)
,p_file_name=>'apexreport2columns.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
