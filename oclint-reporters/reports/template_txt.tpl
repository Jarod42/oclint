{{#hasErrors}}Compiler Errors:
(please aware that these errors will prevent OCLint from analyzing those source code)


{{#ForEachError}}{{Path}}:{{startLine}}:{{startColumn}}:{{message}}
{{/ForEachError}}{{/hasErrors}}{{#hasWarnings}}"Compiler Warnings:


{{#ForEachWarning}}{{Path}}:{{startLine}}:{{startColumn}}:{{message}}
{{/ForEachWarning}}{{/hasWarnings}}{{#hasCheckerBugs}}"Clang Static Analyzer Results:"

{{#ForEachCheckerBug}}{{Path}}:{{startLine}}:{{startColumn}}:{{message}}
{{/ForEachCheckerBug}}{{/hasCheckerBugs}}

OCLint Report

Summary: TotalFiles={{numberOfFiles}} FilesWithViolations={{numberOfFilesWithViolations}} P1={{numberOfViolationsWithPriority1}} P2={{numberOfViolationsWithPriority2}} P3={{numberOfViolationsWithPriority3}}

{{#ForEachViolation}}{{path}}:{{startLine}}:{{startColumn}}: {{name}} P{{priority}} {{message}}
{{/ForEachViolation}}

[OCLint (http://oclint.org) v{{Version}}
