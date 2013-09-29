{{%AUTOESCAPE context="JSON"}}
{"version":"{{Version}}", "url":"http://oclint.org", "timestamp":"{{Date}}",
 "summary":{"numberOfFiles": {{numberOfFiles}},
        "numberOfFilesWithViolations": {{numberOfFilesWithViolations}},
        "numberOfViolationsWithPriority":[{"priority":1, "number":{{numberOfViolationsWithPriority1}}},{"priority":2, "number":{{numberOfViolationsWithPriority2}}},{"priority":3, "number":{{numberOfViolationsWithPriority3}}}]},
 "violation":[{{#ForEachViolation}}
  {"path": "{{path}}"}, {"startLine":{{startLine}}, "startColumn":{{startColumn}}, "endLine":{{endColumn}},
   "rule":"{{name}}", "priority":{{priority}}, "message":"{{message}}"}{{#ForEachViolation_separator}}, {{/ForEachViolation_separator}}
{{/ForEachViolation}}]}
