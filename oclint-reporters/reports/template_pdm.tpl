{{%AUTOESCAPE context="XML"}}
<?xml version="1.0" encoding="UTF-8"?>
<pmd version="oclint-{{Version}}">
{{#ForEachViolation}}<file name="{{violation.path}}">
<violation begincolumn="{{startColumn}}" endcolumn="{{endColumn}}" beginline="{{startLine}}" endline="{{endLine}}" 
priority="{{priority}}" {{! priority="2*{{priority}}-1" Give correct priority  }}
rule="{{name}}">
{{message}}
</violation>
</file>
{{/ForEachViolation}}
</pmd>
