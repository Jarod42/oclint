#include "oclint/Reporter.h"
#include "oclint/RuleBase.h"
#include "oclint/Version.h"
#include "oclint/ViolationSet.h"

#include <ctemplate/template.h>

using namespace oclint;

class CTemplateReporter : public Reporter
{
public:
    virtual const std::string name() const
    {
        return "ctemplate";
    }

    virtual void report(Results *results, std::ostream &out)
    {
        ctemplate::TemplateDictionary dict("root");

        dict.SetValue("Version", Version::identifier());
        {
            time_t now;
            time(&now);
            dict.SetValue("Date", ctime(&now));
        }

        // TODO: feed Dict with more "global" values (as configuration options).
        feedDict(*results, &dict);

        std::string templateFilename; // TODO: which name.
        std::string output;
        ctemplate::ExpandTemplate(templateFilename, ctemplate::DO_NOT_STRIP, &dict, &output);
        out << output;
    }

private:
    void feedDict(/*const*/ Results &results, ctemplate::TemplateDictionary *dict)
    {
        dict->SetIntValue("numberOfViolations", results.numberOfViolations());
        dict->SetIntValue("numberOfViolationsWithPriority1", results.numberOfViolationsWithPriority(1));
        dict->SetIntValue("numberOfViolationsWithPriority2", results.numberOfViolationsWithPriority(2));
        dict->SetIntValue("numberOfViolationsWithPriority3", results.numberOfViolationsWithPriority(3));
        dict->SetIntValue("numberOfFiles", results.numberOfFiles());
        dict->SetIntValue("numberOfFilesWithViolations", results.numberOfFilesWithViolations());
        dict->SetIntValue("numberOfErrors", results.numberOfErrors());
        dict->SetIntValue("numberOfWarnings", results.numberOfWarnings());
        dict->SetIntValue("numberOfCheckerBugs", results.numberOfCheckerBugs());

        if (results.hasCheckerBugs()) { dict->ShowSection("hasCheckerBugs"); }
        if (results.hasErrors()) { dict->ShowSection("hasErrors"); }
        if (results.hasWarnings()) { dict->ShowSection("hasWarnings"); }

        feedDict(results.allWarnings(), "ForEachWarning", dict);
        feedDict(results.allErrors(), "ForEachError", dict);
        feedDict(results.allCheckerBugs(), "ForEachCheckerBug", dict);
        feedDict(results.allViolations(), "ForEachViolation", dict);
    }

    void feedDict(const std::vector<Violation> &violations,
                  const std::string &name,
                  ctemplate::TemplateDictionary *dict)
    {
        for (const auto &violation : violations)
        {
            auto sectionDict = dict->AddSectionDictionary(name);

            feedDict(violation, sectionDict);
        }
    }

    void feedDict(const Violation &violation, ctemplate::TemplateDictionary *dict)
    {
        dict->SetValue("path", violation.path);
        dict->SetValue("message", violation.message);
        dict->SetIntValue("startLine", violation.startLine);
        dict->SetIntValue("startColumn", violation.startColumn);
        dict->SetIntValue("endLine", violation.endLine);
        dict->SetIntValue("endColumn", violation.endColumn);
        const RuleBase* rule = violation.rule;
        dict->SetValue("name", rule->name());
        dict->SetIntValue("priority", rule->priority());
    }

};

extern "C" Reporter* create()
{
  return new CTemplateReporter();
}
