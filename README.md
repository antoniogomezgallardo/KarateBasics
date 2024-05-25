# Karate Basics

*Run tests*

- Run all tests: mvn clean test
- Run tests with tag: mvn clean test -Dkarate.options="--tags @TAG_NAME"
- Run all tests except the tagged: mvn clean test -Dkarate.options="--tags ~@TAG_NAME"
- Run tesst from classPath: mvn clean test -Dkarate.options="classpath:conduitApp/feature/FEATURE_NAME.feature:#Line_Number"

- Run tests for a different envirionment: mvn clean test -Dkarate.env="ENVIRONMENT_NAME"

# Schema validation
- https://github.com/karatelabs/karate/blob/master/karate-core/src/test/java/com/intuit/karate/core/schema-like.feature

