# Smart Pension test

## Description

The test is as follows:

Write a ruby script that:

  * Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
  * Returns the following:
    * list of webpages with most page views ordered from most pages views to less page views

Examples:

  * `/home 90 visits` `/index 80 visits` etc... > list of webpages with most
  * `/about/2 8 unique views` `/index 5 unique views` etc... > unique page views also ordered


## Dependencies

 * ruby 2.7.2 (see `.ruby-version`)
 * bundler

