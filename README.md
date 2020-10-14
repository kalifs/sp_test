# Smart Pension test

## Problem

The test is as follows:

Write a ruby script that:

  * Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
  * Returns the following:
    * list of web pages with most page views ordered from most pages views to less page views

Examples:

  * `/home 90 visits` `/index 80 visits` etc... > list of webpages with most
  * `/about/2 8 unique views` `/index 5 unique views` etc... > unique page views also ordered

## Solution

Simple script that consist of multiple parts

  * `log_file.rb` that contains specific parsing logic and could be replace with different log file if necessary
  * `*_accumulator.rb` specific accumulators that tally log data in specific ways
  * `table_printer.rb` just a nicer printer for results

  * `bin/test` standardized way to run all the tests
  * `bin/run` runner script.

There is not class that is responsible for running all the things together as there may be different ways one wants to aggregate results. In real world application this would be captured in place where use-cases are kept, like controller.

## Usage

### Dependencies

 * ruby 2.7.2 (see `.ruby-version`)
 * bundler

### Setup

`bundle install`

### Running tests

To run test:  `bin/test`
To run specific test: `bin/test spec/some_spec.rb`

### Running script

`bin/run data/webserver.log`

## Author

Arturs Meisters
14/10/2020
