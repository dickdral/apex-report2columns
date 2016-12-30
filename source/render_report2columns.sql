/*-------------------------------------
 * APEX Report to Columns
 * Version: 1.0 (28-12-2016)
 * Author:  Dick Dral
 *-------------------------------------
*/
FUNCTION render_report2columns(p_dynamic_action IN apex_plugin.t_dynamic_action,
                               p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  -- plugin attributes
  l_result       apex_plugin.t_dynamic_action_render_result;
  l_numcols      number        := p_dynamic_action.attribute_01;
  l_direction    varchar2(100) := p_dynamic_action.attribute_02;
  --
BEGIN
  -- attribute defaults
  l_numcols   := nvl(l_numcols,
                          2);
  l_direction := nvl(l_direction,
                        'vertical');
  --
  l_result.javascript_function := 'apexreport2columns.doIt';
  l_result.attribute_01        := l_numcols;
  l_result.attribute_02        := l_direction;
  --
  RETURN l_result;
  --
END render_report2columns;