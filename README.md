# HATT example project

This demonstrates using HATT to test a set of HTTP APIs.

## Usage

### Setup

#### Get the code

     git clone git@github.com:rschultheis/hatt_example.git
     cd hatt_example

#### Install the needed gems

    bundle install

#### Get an App ID for Open Weather Map

Go to [https://openweathermap.org/appid] to get your own APP ID (API Key).

#### Put your App ID into hatt.secret.yml

Change the file to have these contents:

    owm_app_id: <your api key>

### Running RSpec fully automated tests

Simply run the rspec command like so:

    bundle exec rspec

### Using hatt cmd line tool for adhoc calls

One can call any hattdsl method from the command line like so:

    bundle exec hatt -v weather_for "Missoula, MT"

Try the --help option for a full list of ways to use the hatt command line tool.

### Running scripts that use the HATT DSL

    bundle exec hatt -q -f scripts/temperatures.rb

### Using the HATT REPL mode (a PRY repl):

    bundle exec hatt -v --pry-repl

    > weather_for '59801'
    ... <big response> ...

## More info

See the official HATT repository: [https://github.com/rschultheis/hatt]
