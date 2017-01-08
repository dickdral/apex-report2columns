/*-------------------------------------
 * APEX Resize Dialog
 * Version: 1.0 (05-01-2016)
 * Author:  Dick Dral
 *-------------------------------------
*/
FUNCTION render_resize_dialog(p_dynamic_action IN apex_plugin.t_dynamic_action,
                               p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  -- plugin attributes
  l_result          apex_plugin.t_dynamic_action_render_result;
  l_center_dialog   varchar2(100)  := p_dynamic_action.attribute_01;
  l_margin          number         := p_dynamic_action.attribute_02;
  --
BEGIN
  -- attribute defaults
  l_center_dialog   := nvl(l_center_dialog
                          ,'false');
  l_margin          := nvl(l_margin
                          , 20);
  --
  l_result.javascript_function := 'apexresizedialog.doIt';
  l_result.attribute_01        := l_center_dialog;
  l_result.attribute_02        := l_margin;
  --
  RETURN l_result;
  --
END render_resize_dialog;