# NIST Opensource

Code Repositories
The code base for the NIST Code Portal is based on the LLNL Software Portal code stack.    The following NIST Github Repositories are used:

usnistgov/opensource-repo - Template opensource code repository (not part of code.nist.gov)
usnistgov/opensource - Website (Jekyll github pages based) for the NIST opensource code (FORK from LLNL]
usnistgov/opensource-actions - Code for the Bot (harvester of usnistgov/github public repositories (FORK from LLNL),  Cron JOB)
runs daily on github
usnistgov/opensource-theme - Branding of the website for NIST (FORK from LLNL]
usnistgov/opensource-data - Generates Code.JSON   (github action,  cron schedule).  - sometimes this needs to be restarted (commit small function)


## NIST code.json
The public code inventory for NIST is represented by a code.json file,  available at the code.nist.gov endpoint /explore/code.json
It was initially generated as part of the Code.gov,  which currently is operated in maintenance mode:

Related:
Using existing software with github to generate a code.json
generators https://github.com/GSA/code-gov/blob/master/CODE_JSON_GENERATORS.md
scraper https://github.com/llnl/scraper
Legacy Policy Link: https://code.gov/about/overview/introduction
Schema Documentation: https://code.gov/about/compliance/inventory-code
Repo for Code JSON Schema: https://github.com/GSA/code-gov-data/blob/master/schemas/schema-2.0.0.json
LLNL Software Portal https://software.llnl.gov/
Code Repository for the LLNL Software Portal https://github.com/LLNL/llnl.github.io


