# The Hammer API!

  The Hammer is a tool inventory managment system inspired by the need for easy
  to use accessible, and cost effective IMSs in the non-profit sector. The
  construction of this API focused on wholistic management of a single resource
  and a delibrate build process that took advantage of Rspec to guide the
  construction of models, routes and controllers and the smooth integration of
  API with [The Hammer's client side application](https://github.com/SimonPringleWallace/tool-tracker-client) 

  Writing tests during the development of this API proved to be one of the
  great satisfactions of the project and also one of the biggest expenditures
  of time. While the process of testing each CRUD action was simple in the
  beginning stages, once the toolsController was set to inherit from
  portectController rather than openRead, the wheels came off the cart a bit.
  With the added need for user authentication that protectedController requires,
  tests that had all passed previous to the switch, summarily failed and the
  solution lay in developing out either mocks or stubs to provide dummy user
  auth information to satisfy protectedController and allow for the tests to
  pass. Additional difficulty came in trying to write tests to test validations
  within the model itself. These tests had a peculiar tendency to pass when
  they should fail and fail when they should pass.

  Although both sets of test were eventually abandoned due to a working product
  and time constraints, writing these tests and using them to further shape the
  scope of this project remains a high priority.

# Future Work
  Having created a working API to manage a single resource, future work will
  be focused on building out additional resources and more complex structures
  with a priority placed on using BDD to inform and guid this process. Future
  priorities are as follows:

  - Build an additional resource (warehouse) which has one owner and many tools

  - Write mocks for controller Rspec tests and get them to pass as the did
    before the sqitch was made to protectedController.

 -  Sort out model testing bug to allow for BDD of future model validations


# Entity Relationship Diagrams

 [ERD](https://imgur.com/mn9wM1J)

# Technologies Used

-Ruby
-Rspec
-Ruby on Rails
-Heroku
