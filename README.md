1. run docker build -t jenkins:codeception .
2. run docker run -i -p 8080:8080 -p 50000:50000 jenkins:codeception
3. change password to admin
4. install plugins:
  - Git Plugin - for building tests for Git repo
  - Green Balls - to display success results in green.
  - xUnit Plugin, jUnit Plugin - to process and display Codeception XML reports
  - HTML Publisher Plugin - to process Codeception HTML reports
  - AnsiColor - to show colorized console output.
5. create new Item
6. add git repo && credentials for pull project
7. at Build section add shell commands:
  composer update || installer
  cd {test_directory}
  ../vendor/bin/codecept run api --html
8. at Post build actions add Publish HTML reports
9. done
