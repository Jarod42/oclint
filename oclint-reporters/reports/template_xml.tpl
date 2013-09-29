{{%AUTOESCAPE context="XML"}}
<?xml version="1.0" encoding="UTF-8" ?>
<oclint version="{{Version}}" url="http://oclint.org">
  <datetime>Date</datetime>{{! other format: YYYY-MM-DDTHH:MM:SSZ }}
  <summary>
    <property name="number of files">{{numberOfFiles}}</property>
    <property name="files with violations">{{numberOfFilesWithViolations}}</property>
    <property name="number of priority 1 violations">{{numberOfViolationsWithPriority1}}</property>
    <property name="number of priority 2 violations">{{numberOfViolationsWithPriority2}}</property>
    <property name="number of priority 3 violations">{{numberOfViolationsWithPriority3}}</property>
  </summary>
  <violations>
{{#ForEachViolation}}    <violation "path"="{{path}}" "startline"="{{startLine}}" "startcolumn"="{{startColumn}}"
 "endline"="{{endLine}}" "endcolumn"="{{endColumn}}"
 "rule"="{{name}}" "priority"="{{priority}}"
 "message"="{{message}}" />
{{/ForEachViolation}}
  </violations>
</oclint>
