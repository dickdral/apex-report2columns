# Oracle APEX Dynamic Action Plugin -  report2columns
Oracle Apex plugin for distributing a report over more than one column. 

The number of columns and the sort order of the elements can be specified. 

## Requirements
The plugin can be used with Apex 5.0 and Apex 5.1 in applications using Universal Theme. 

## Install
- Import plugin file "dynamic_action_plugin_nl_detora_apex_report2columns.sql" from source directory into your application
- Add an After Refresh Dynamic Action to the region to be affected
- In the True Action refer to the report2columns [Plug-In] and adjust the Settings if desired

## Plugin Settings
The plugin settings are customizable and you can change:
- **Number of Columns** - The number of columns over which the report should be distributed
- **Direction** - Direction in which the elements are ordered:

**Vertical** ( default )

1    4

2    5

3    6


**Horizontal**

1    2

3    4

5    6

## Demo Application
http://www.speech2form.com/ords/f?p=OPFG:REP2COL

## Preview
![](https://github.com/dickdral/apex-report2columns/blob/master/report2columns_example.png?raw=true)
---
