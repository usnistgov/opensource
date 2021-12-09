---
title: About the NIST Software Portal
layout: info
---

## {{ page.title }}

Welcome to the NIST Open Source Software (OSS) code portal, otherwise known as
[code.nist.gov][nist-code]. This website allows public users to search and
explore open source software developed by NIST and affiliated code
collaborators. We want to expressly thank the [LLNL Software Portal][llnl-code]
developers for sharing their portal code base, of which this site is built on.
In other words, this is a site which demonstrates the value of OSS for reuse
for discovery and exchange of code!

The NIST OSS catalog is also exported in compliance with [Federal Source Code
Policy][fed-code] for agency inventory in [Code.gov][code-gov]. The NIST open
source code inventory is accessible from this website in JSON format:
[code.json][code-json].

### NIST Software Licensing

**All NIST open source software follows the licensing and policy as described
on the organization website [here][nist-open]**

#### LICENSE file

Every repository must include a license statement in a [LICENSE.md][open-lic]
file.

#### Other considerations

Distributions of NIST software should also include copyright and licensing
statements of any third-party software that are legally bundled with the code
in compliance with the conditions of those licenses.

### Using GitHub

- Setting up Your GitHub Account
- Joining the Organization
- Working with NIST Repositories
  - Repository Content
  - Repository Visibility
- Other References

If you're new to GitHub and open source in general, figuring out how to get set
up can be a challenge. This guide is for getting started with GitHub, and
specifically targets NIST developers working in the NIST GitHub Organization.

#### Setting up Your GitHub Account

If you're new to GitHub, you may want to read through the GitHub Help pages on
[Setting up and managing your GitHub profile][gh-prof]. Here are some of the
highlights:

1. [Create an account on GitHub](https://github.com/join).

   You *do not need* a separate work account and personal account. Instead, you
   can [link multiple email addresses to the same GitHub account][gh-link],
   which is almost always preferred.

2. [Update your profile information](https://github.com/settings/profile).

   - Photo: A headshot photo, or image that is uniquely you.
   - Name: Your personal name and surname.
   - Bio: Include a few words about yourself! Don't forget to mention NIST.
   - URL: This might be your [nist.gov/people][nist-ppl] page.
   - Company: Probably `@usnistgov`.
   - Location: Your primary location.

3. Add your `first.last@nist.gov` email address (and any aliases) to
   your [Email Settings][gh-eml] page. This will link any commits
   done via [your Git identity][git-id] to your GitHub account.

#### Joining the Organization

The [USNISTGOV organization][usnistgov] is managed by NIST. Only NIST
staff may become a repository owner and must agree to the NIST GitHub
Rules of Behavior.

Send the Rules of Behavior by email, with your GitHub username
included, to <devops@nist.gov>, requesting to be added to the
organization.

1. After an administrator has added you to the organization, you
   will receive a notification email from GitHub. Alternatively,
   once the invitation has been sent, you will see a notification
   banner at the top of [github.com/usnistgov][usnistgov] which you
   can use to accept the invitation.

2. Head over to the [@NIST People][gh-ppl] page and make your
   membership `Public`.

3. Review the "Working with NIST Repositories" information below.

### Working with NIST Repositories

Repositories within the NIST organization are owned and managed by
NIST. Please do not attempt to create personal repositories here.

All public information produced by NIST follow the guidance set forth
by the NIST directives and policies on the [Internal-only software
publishing][nist-pubs] information website.

#### Repository Content

Before content is placed into a GitHub repository in
[USNISTGOV][usnistgov] it should contain at a minimum the following
information.

- Every repository must include a license statement in a
  [LICENSE.md][open-lic] file. For most cases, use the text in the
  blue box for [NIST software][nist-soft].
- README.MD or README.rst file clearly describes, in layman's terms:
  - goals of the repository and project
  - whether the code is usable (pre-release, production-ready, or in-between?)
  - how to get in touch with the development team
  - acknowledges collaborators and reused code, if applicable
  - dependencies, if any
  - installation process
  - basic usage
- Binaries, if used, must be [signed][gh-sign].
- [CODEMETA.YAML][open-meta] file: edit to include your relevant
  categories and topics to be indexed by [code.nist.gov][nist-code]
  portal and NIST websites for search.

Remember that these repositories *are hosted* on GitHub servers, and
should contain only NIST scientific research data.

- NO Classified
- NO Export Controlled
- NO Official Use Only (OUO)
- NO Health Insurance Portability and Accountability Act (HIPAA)
- NO Personally Identifiable Information (PII)
- NO NDA or vendor-proprietary information
- NO Unclassified Controlled Information (UCI)
- NO Unclassified Controlled Nuclear Information (UCNI)

When in doubt, contact your ITSO for guidance.

### GitHub Pages

GitHub Pages are public websites hosted and published through a
branch in your repository. The default service provided by GitHub on
[github.io](https://github.io/) domains may not be used with
repositories in the NIST GitHub organization. An alternate service,
hosted by NIST and forked from the [18F pages-server][gh-18f] is
available, see the [pages wiki][gh-pages] for more information.

#### Repository Visibility

Once your project is on GitHub, make sure users and contributors can
find it! There are several ways to do this. NIST staff may contact
<public-access@nist.gov> for help with the following tasks:

1. Include meaningful metadata (description and topic tags) in your repository.

   - Start with our [list][open-meta] of recommended, standardized
     topics (categories and themes).

   - See helpful hints on [GitHub's topic help page][gh-help]. Add
     tags relevant to your project's programming language, platforms,
     and more (e.g., Python, HPC, Linux).

   - Add custom Topics along with the appropriate
     [category and themes][open-meta] and (based on the
     [NIST Taxonomy][nist-tax] tier 1 terms).

   - Publicize any outreach activities or major milestones related to
     your project. Examples: You have a paper/poster/presentation
     accepted at a conference; you're hosting a workshop or webinar;
     your project is nominated for an award; or you're speaking on a
     podcast or guest blogging.

   - If your repository exists under a different organization, you
     can move it to NIST by selecting "Transfer Ownership" under
     Settings.

Make sure your repository is listed properly following
(internal) [Guidance for Publishing Software][nist-pubs].

### Other References

There are many great "getting started" guides for GitHub. Here are a
few we recommend:

- [18F Handbook: GitHub](https://handbook.18f.gov/github/)
- <https://www.cio.gov/2016/08/11/peoples-code.html>

The Federal government also provides some relevant information:

- [Guidance for Agency Use of Third-Party Websites and Applications][wh-tpw]
  (PDF)

See also:

- [18F Blog: Facts about Publishing Open Source Code][gsa-18f]
- [The entire Pro Git book, written by S][git-scm]

## Contributing to NIST Open Source Projects

NIST welcomes contributions from the general public to our
[open source projects on GitHub][usnistgov].

### Contributing

Refer to individual projects for their requirements on accepting
contributions. In general though, we follow the "fork and pull" Git
workflow model:

- Fork a repository
- Develop your changes in your fork
- Create a pull request to the "upstream" repository
- If approved, changes will be merged in by a repository maintainer.

<!-- links -->

[code-gov]: https://code.gov/
[code-json]: https://code.nist.gov/explore/code.json
[fed-code]: https://code.gov/agency-compliance/compliance/dashboard
[gh-18f]: https://github.com/18f/pages-server
[gh-eml]: https://github.com/settings/emails
[gh-help]: https://help.github.com/articles/about-topics/
[gh-link]: https://help.github.com/articles/adding-an-email-address-to-your-github-account/
[gh-pages]: https://github.com/usnistgov/pages-root/wiki
[gh-ppl]: https://github.com/usnistgov/people
[gh-prof]: https://help.github.com/categories/setting-up-and-managing-your-github-profile/
[gh-sign]: https://github.com/usnistgov/discuss/issues/2
[git-id]: https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#Your-Identity
[git-scm]: https://git-scm.com/book/en/v2
[gsa-18f]: https://18f.gsa.gov/2016/08/08/facts-about-publishing-open-source-code-in-government/
[llnl-code]: https://software.llnl.gov/
[nist-code]: https://code.nist.gov
[nist-open]: https://www.nist.gov/open/copyright-fair-use-and-licensing-statements-srd-data-software-and-technical-series-publications
[nist-ppl]: https://www.nist.gov/about-nist/our-organization/people
[nist-pubs]: https://inet.nist.gov/adlp/publishing-instructions/publishing-software
[nist-soft]: https://www.nist.gov/open/copyright-fair-use-and-licensing-statements-srd-data-software-and-technical-series-publications#software
[nist-tax]: https://data.nist.gov/od/id/691DDF3315711C14E0532457068146BE1907
[open-lic]: https://github.com/usnistgov/opensource-repo/blob/main/LICENSE.md
[open-meta]: https://github.com/usnistgov/opensource-repo/blob/main/CODEMETA.yaml
[usnistgov]: https://github.com/usnistgov
[wh-tpw]: https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/memoranda_2010/m10-23.pdf
