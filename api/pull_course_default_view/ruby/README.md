Exporting Course's Default View to CSV
======

This determine_course_default_view.rb file in this folder can be used to
generate a report of published courses with enrollments located within an
account of what their default view.

The default view is the type of page that users will see when they first 
visit the course:

'feed': Recent Activity Dashboard
'wiki': Wiki Front Page
'modules': Course Modules/Sections Page
'assignments': Course Assignments List
'syllabus': Course Syllabus Page

The report will be generated in a CSV formatted file.

Requirements
======

You will need to install [Ruby](https://www.ruby-lang.org/) version 2.7.3.

Configuration
======

You will need to open the included ruby file:

determine_course_default_view.rb

and adjust or input the following variables:

Account ID:

Find `account_id = ''` and place your account ID in the quotes.

Access Token:

Find `canvas_token = ''` and place your access token in the quotes.

Canvas Domain:

Find `canvas_url = ''` and place your Canvas domain in the quotes.

CSV File:

Find `csv_file = ''` and place your output file eg: full/path/to/file/api_courses.csv

Support
======

This is an unsupported, community-created project. Keep that in
mind. Instructure won't be able to help you fix or debug this.
That said, the community will hopefully help support and keep
both the script and this documentation up-to-date.

Good luck!
