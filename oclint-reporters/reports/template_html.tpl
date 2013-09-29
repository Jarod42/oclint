{{%AUTOESCAPE context="HTML"}}
<!DOCTYPE html>
<html>
<head>
<title>OCLint Report</title>
<style type='text/css'>
.priority1, .priority2, .priority3,
.cmplr-error, .cmplr-warning, .checker-bug {
    font-weight: bold;
    text-align: center;
}
.priority1, .priority2, .priority3 {
    color: #BF0A30;
}
.priority1 { background-color: #FFC200; }
.priority2 { background-color: #FFD3A6; }
.priority3 { background-color: #FFEEB5; }
.cmplr-error, .cmplr-warning {
    background-color: #BF0A30;
}
.cmplr-error { color: #FFC200; }
.cmplr-warning { color: #FFD3A6; }
.checker-bug {
    background-color: #002868;
    color: white;
}
table {
    border: 2px solid gray;
    border-collapse: collapse;
    -moz-box-shadow: 3px 3px 4px #AAA;
    -webkit-box-shadow: 3px 3px 4px #AAA;
    box-shadow: 3px 3px 4px #AAA;
}
td, th {
    border: 1px solid #D3D3D3;
    padding: 4px 20px 4px 20px;
}
th {
    text-shadow: 2px 2px 2px white;
    border-bottom: 1px solid gray;
    background-color: #E9F4FF;
}
</style>
</head>
<body>
<h1>OCLint Report</h1>
<hr />
<h2>Summary</h2>
<table><thead><tr><th>Total Files</th><th>Files with Violations</th>
<th>Priority 1</th><th>Priority 2</th><th>Priority 3</th>
<th>Compiler Errors</th><th>Compiler Warnings</th>
<th>Clang Static Analyzer</th></tr></thead>
<tbody><tr><td>{{numberOfFiles}}</td>
<td>{{numberOfFilesWithViolations}}</td>
<td class='priority1'>{{numberOfViolationsWithPriority1}}</td>
<td class='priority2'>{{numberOfViolationsWithPriority2}}</td>
<td class='priority3'>{{numberOfViolationsWithPriority3}}</td>
<td class='cmplr-error'>{{numberOfErrors}}</td>
<td class='cmplr-warning'>{{numberOfWarnings}}</td>
<td class='checker-bug'>{{numberOfCheckerBugs}}</td></tr></tbody></table>

<hr />
<table>
<thead><tr><th>File</th><th>Location</th><th>Rule Name</th><th>Priority</th><th>Message</th></tr></thead>
<tbody>
{{#ForEachViolation}}
<tr><td>{{path}}</td><td>{{startLine}}:{{startColumn}}</td>
<td>{{name}}</td><td class='priority"{{priority}}"'>{{priority}}</td>
<td>{{message}}</td></tr>
{{/ForEachViolation}}

{{#ForEachError}}
<tr><td>{{path}}</td><td>{{startLine}}:{{startColumn}}</td>
<td>compiler error</td><td class='cmplr-error'>error</td><td>{{message}}</td></tr>
{{/ForEachError}}
{{#ForEachWarning}}
<tr><td>{{path}}</td><td>{{startLine}}:{{startColumn}}</td>
<td>compiler warning</td><td class='cmplr-warning'>warning</td><td>{{message}}</td></tr>
{{/ForEachWarning}}

{{#ForEachCheckerBug}}
<tr><td>{{path}}</td><td>{{startLine}}:{{startColumn}}</td>
<td>clang static analyzer</td><td class='checker-bug'>checker bug</td><td>{{message}}</td></tr>
{{/ForEachCheckerBug}}

</tbody></table>
<hr />

<p>{{Date}}| Generated with <a href='http://oclint.org'>OCLint v{{Version}}</a>.</p>
</body>
</html>
